<#
.SYNOPSIS
 Stop processes by process name or company name. Accepts pipeline input.

.EXAMPLE
 'notepad' | .\process-cl-n-kill.ps1
 .\process-cl-n-kill.ps1 -Name notepad
 .\process-cl-n-kill.ps1 -Company "Microsoft Corporation" -Exact -Force
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    # Accept any pipeline object (so Get-Process objects are received here)
    [Parameter(ValueFromPipeline = $true)]
    [object]$InputObject,

    # Allow property-name binding (e.g. piping objects that have 'Name' property)
    [Parameter(ValueFromPipelineByPropertyName = $true, Position = 0)]
    [Alias('ProcessName')]
    [string[]]$Name,

    [Parameter(ValueFromPipelineByPropertyName = $true)]
    [string[]]$Company,

    [switch]$Exact,
    [switch]$Force
)

begin {
    Write-Host "begin script: $($MyInvocation.MyCommand.Name)`n"
}

process {
    Write-Host "process script: $($MyInvocation.MyCommand.Name)`n"
    $script:names = @()
    $script:companies = @()
    $script:ids = @()
    $script:ps = @()
    function close-f-kill {
        param ([System.Diagnostics.Process] $p)
        #try {
        $p | Select-Object Id, Name, Company | Write-Host -NoNewline
        if (-not $p.HasExited) {
            Write-Host -NoNewline " close ... "
            $p.CloseMainWindow() | Out-Null
            Start-Sleep -Seconds 1.5
            if (-not $p.HasExited) {
                Write-Host -NoNewline "stop ... "
                # stop no output 
                Stop-Process -Id $p.Id -ErrorAction SilentlyContinue | Out-Null
                Start-Sleep -Seconds 1.5
                if (-not $p.HasExited) {
                    Write-Host -NoNewline "close force ... "
                    Stop-Process -Id $p.Id -Force  -ErrorAction SilentlyContinue | Out-Null
                    if (-not $p.HasExited) {
                        Write-Host -NoNewline "kill ... "
                        $p.Kill() | Out-Null
                    }
                    else {
                        Write-Host "done." 
                    }
                }
                else {
                    Write-Host "done."
                }
            }
            else {
                Write-Host "done."
            }
        }
        else {
            Write-Host "done."
        }
        
        #}
        #catch {
        #    Write-Warning "Failed to close/kill process ID $($p.Id): $_"
        #}    
    }

    function handle1Input {
        param ([object] $o )
        Write-Host -ForegroundColor DarkGray "handling 1 input: $o"
        if ($o -is [string]) {
            Write-Host -ForegroundColor DarkGray "got string input"
            $script:names += $o
        }
        elseif ($o -is [System.Diagnostics.Process]) {
            Write-Host -ForegroundColor DarkGray "got process object input"
            $script:ps += $o
        }
        elseif ($o -is [psobject]) {
            Write-Host -ForegroundColor DarkGray "got psobject input"
            if ($o.Name) { $script:names += $o.Name }
            elseif ($o.ProcessName) { $script:names += $o.ProcessName }
            elseif ($o.Company) { $script:companies += $o.Company }
        }
    }


    if ($null -ne $InputObject) {
        write-Host "got pipeline input"

        # If it's an array (rare from pipeline), handle each element
        if ($InputObject -is [System.Collections.IEnumerable]) {
            Write-Host -ForegroundColor DarkGray "got array input (count: $($InputObject.Count))"
            foreach ($o in $InputObject) {
                handle1Input -o $o
            }
        }
        else {
            handle1Input -o $InputObject
        }
    }
    
    Write-Host -ForegroundColor DarkGray "Names: $($names -join ', ')"
    Write-Host -ForegroundColor DarkGray "Companies: $($companies -join ', ')" 
    Write-Host -ForegroundColor DarkGray "IDs: $($ids -join ', ')"
    write-Host -ForegroundColor DarkGray "Process objects: $($ps.Count)"
    
    if ($ps) {
        foreach ($proc in $ps) {
            close-f-kill -p $proc
        }
        exit 0
    }
    
    if ($Name) { $names += $Name }
    if ($Company) { $companies += $Company }
    if ($Id) { $ids += $Id }

    Write-Host -ForegroundColor DarkGray "Names: $($script:names -join ', ')"
    Write-Host -ForegroundColor DarkGray "Companies: $($script:companies -join ', ')" 
    Write-Host -ForegroundColor DarkGray "IDs: $($script:ids -join ', ')"
    write-Host -ForegroundColor DarkGray "Process objects: $($script:ps.Count)"
    if (-not $names -and -not $companies -and -not $ids) {
        Write-Error "Specify -Name, -Company or pipe process names/objects."
        return 1
    }


    $cimProcs = Get-CimInstance Win32_Process -ErrorAction SilentlyContinue
    if (-not $cimProcs) {
        Write-Error "Unable to enumerate processes."
        return 1
    }

    $all = foreach ($p in $cimProcs) {
        $company = $null
        if ($p.ExecutablePath) {
            try { $company = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($p.ExecutablePath).CompanyName } catch {}
        }
        [PSCustomObject]@{
            Id      = $p.ProcessId
            Name    = $p.Name
            Path    = $p.ExecutablePath
            Company = $company
        }
    }

    $matched = @()
    foreach ($proc in $all) {
        $isMatch = $false

        foreach ($n in $names) {
            if ($Exact) {
                if ($proc.Name -ieq $n -or $proc.Name -ieq ("$n.exe")) { $isMatch = $true; break }
            }
            else {
                if ($proc.Name -ilike "*$n*" -or $proc.Name -ilike "*$n.exe*") { $isMatch = $true; break }
            }
        }

        if (-not $isMatch -and $companies) {
            foreach ($c in $companies) {
                if ($proc.Company) {
                    if ($Exact) {
                        if ($proc.Company -ieq $c) { $isMatch = $true; break }
                    }
                    else {
                        if ($proc.Company -ilike "*$c*") { $isMatch = $true; break }
                    }
                }
            }
        }

        if ($isMatch) { $matched += $proc }
    }

    if (-not $matched) {
        Write-Output "No matching processes found."
        return 0
    }

    $matched | Select-Object Id, Name, Company, Path | Format-Table -AutoSize
    
    foreach ($m in $matched | Sort-Object Id -Unique) {
        close-f-kill -p (Get-Process -Id $m.Id -ErrorAction SilentlyContinue)
    }
}

end {

}

