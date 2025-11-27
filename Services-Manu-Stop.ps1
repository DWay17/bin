<#
.SYNOPSIS
set services by regex in command line or default or given file to manual and stop them
.DESCRIPTION
Set services by regex in command line or default or given file to manual and stop them them
and uses Get-Service, Set-Service -StartupType Manual and Stop-Service
.EXAMPLE
.\Services-Manu-Stop.ps1 -ServiceName "wuauserv","bits"
.EXAMPLE
"wuauserv|bits" | .\Services-Manu-Stop.ps1
.EXAMPLE
.\Services-Manu-Stop.ps1 -ServiceListFile C:\temp\services.txt
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter(Position=0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [string[]]$ServiceName,

    [Parameter()]
    [ValidateScript({ Test-Path $_ -PathType Leaf })]
    [string]$ServiceListFile,

    [switch]$Force
)

Begin {
    function Assert-Admin {
        if (-not ([bool]([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))) {
            Write-Warning "Not running elevated. Changing service startup type and stopping services may fail without administrative privileges."
        }
    }

    Assert-Admin

    $names = @()
    if ($ServiceListFile) {
        try {
            $fileNames = Get-Content -Path $ServiceListFile -ErrorAction Stop | 
              ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
            $names += $fileNames
        } catch {
            Write-Error "Failed to read service list file '$ServiceListFile': $_"
            return
        }
    }
}

Process {
    Write-Host "Running script: $($MyInvocation.MyCommand.Name)`n"

    if ($ServiceName) { $names += $ServiceName }
    $names2 = @()
    foreach ($n in $names) {
        Write-Host "list of names: $names"
        if ([string]::IsNullOrWhiteSpace($n)) { continue }

        # $n contains , split it and put to $names
        if ($n -like '*,*') {
            Write-Host "Splitting '$n' by ','"
            $splitNames = $n -split ','
            foreach ($sn in $splitNames) {
                if (-not [string]::IsNullOrWhiteSpace($sn)) {
                    $names2 += $sn.Trim()
                }
            }
            continue
        }
        if ($n -like '*|*' -or $n -like '*?*' -or $n -like '*[*]*' -or $n -like '*(*)*') {
            Write-Host "Getting services matching regex '$n'"
            try {
                # ignore error and get all services
                $allServices = Get-Service -ErrorAction SilentlyContinue
                Write-Host "Total services retrieved: $($allServices.Count)"
                $regex = [regex]$n
                Write-Host "Compiled regex: $regex"
                # ignore case when matching 
                $regex = New-Object System.Text.RegularExpressions.Regex($n, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase) 
                Write-Host "Compiled regex: $regex"
                $matchedServices = $allServices | 
                  Where-Object { $regex.IsMatch($_.Name) }
                foreach ($ms in $matchedServices) {
                    Write-Host "Matched service by Name: $($ms.Name) (DisplayName: $($ms.DisplayName))"
                    $names2 += $ms.Name
                }
                $matchedServices = $allServices | 
                  Where-Object { $regex.IsMatch($_.DisplayName) }
                foreach ($ms in $matchedServices) {
                    Write-Host "Matched service by DisplayName: $($ms.Name) (DisplayName: $($ms.DisplayName))"
                    $names2 += $ms.Name
                }
            } catch {
                Write-Warning "No services found matching regex='$n'. ($_ )"
                continue
            }
            continue
        }
        $names2 += $n
    }
    # unique names only
    $names2 = $names2 | Sort-Object -Unique
    Write-Host "Final list of service names to process: $names2 (Count: $($names2.Count))"
    foreach ($n in $names2) {
        if ([string]::IsNullOrWhiteSpace($n)) { continue }
        # if $n contains | get all sercices match via regex and put to $names
        # Get matching services (supports wildcards)
        try {
            Write-Host "getting service for name '$n'"
            $services = Get-Service -Name $n -ErrorAction Stop
        } catch {
            Write-Warning "No service found matching Name='$n'. ($_ )"
            continue
        }

        foreach ($service in $services) {
            $target = "$($service.Name) (DisplayName: $($service.DisplayName))"
            if ($service.StartupType -eq 'Manual') {
                Write-Host -ForegroundColor DarkGray "Service already set to 'Manual': $target"
            } elseif ($PSCmdlet.ShouldProcess($target, "Set StartupType to 'Manual'")) {
                try {
                    Set-Service -Name $service.Name -StartupType Manual -ErrorAction Stop
                    Write-Host "Set StartupType to 'Manual' for service: $target"
                } catch {
                    Write-Host -ForegroundColor DarkGray "Failed to set StartupType for service '$target': $_"
                    continue
                }
            }

            if ($service.Status -ne 'Stopped') {
                if ($PSCmdlet.ShouldProcess($target, "Stop Service")) {
                    try {
                        Stop-Service -Name $service.Name -Force:$Force -ErrorAction Stop
                        Write-Host "Stopped service: $target"
                    } catch {
                        Write-Error "Failed to stop service '$target': $_"
                    }
                }
            } else {
                Write-Host -ForegroundColor DarkGray "Service already stopped: $target"
            }
        }
    }
}

