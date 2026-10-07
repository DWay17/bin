<#
.SYNOPSIS
Disable one or more scheduled tasks.

.DESCRIPTION
Disable-ScheduledTasks.ps1 accepts task names (pipeline or parameter), or a file with one task name per line.
Uses ShouldProcess so -WhatIf and -Confirm work. Outputs objects describing result.

.EXAMPLE
.\Disable-ScheduledTasks.ps1 -TaskName "MyTask","AnotherTask"

.EXAMPLE
"TaskA","TaskB" | .\Disable-ScheduledTasks.ps1

.EXAMPLE
.\Disable-ScheduledTasks.ps1 -TaskListFile C:\temp\tasks.txt -TaskPath "\MyFolder\"
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter(Position=0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [string[]]$TaskName,

    [Parameter(Position=1)]
    [string]$TaskPath = '\',

    [Parameter()]
    [ValidateScript({ Test-Path $_ -PathType Leaf })]
    [string]$TaskListFile,

    [switch]$Force
)


Begin {
    function Assert-Admin {
        if (-not ([bool]([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))) {
            Write-Warning "Not running elevated. Disabling scheduled tasks may fail without administrative privileges."
        }
    }

    Assert-Admin

    $names = @()
    if ($TaskListFile) {
        try {
            $fileNames = Get-Content -Path $TaskListFile -ErrorAction Stop | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
            $names += $fileNames
        } catch {
            Write-Error "Failed to read task list file '$TaskListFile': $_"
            return
        }
    }
}

Process {
    Write-Host "Running script: $($MyInvocation.MyCommand.Name)`n"

    if ($TaskName) { $names += $TaskName }

    foreach ($n in $names) {
        if ([string]::IsNullOrWhiteSpace($n)) { continue }

        # Get matching tasks (supports wildcards)
        try {
            $matches = Get-ScheduledTask -TaskName $n -TaskPath $TaskPath -ErrorAction Stop
        } catch {
            Write-Warning "No scheduled task found matching Name='$n' Path='$TaskPath'. ($_ )"
            continue
        }

        foreach ($task in $matches) {
            $target = "$($task.TaskName) (Path: $($task.TaskPath))"
            if ($PSCmdlet.ShouldProcess($target, 'Disable')) {
                try {
                    # Disable-ScheduledTask supports -InputObject in modern Windows PowerShell / PSCore
                    if ($Force) {
                        Write-Host -ForegroundColor DarkGray "Forcing disable of task $target"
                        Disable-ScheduledTask -InputObject $task -ErrorAction Stop -Confirm:$false
                    } else {
                        Write-Host -ForegroundColor DarkGray "Disabling of task $target"
                        Disable-ScheduledTask -InputObject $task -ErrorAction Stop
                    }
                    [PSCustomObject]@{
                        TaskName = $task.TaskName
                        TaskPath = $task.TaskPath
                        State    = 'Disabled'
                        Time     = (Get-Date)
                        Success  = $true
                    }
                } catch {
                    Write-Warning "Failed to disable task ${target}: $_"
                    [PSCustomObject]@{
                        TaskName = $task.TaskName
                        TaskPath = $task.TaskPath
                        State    = 'Error'
                        Time     = (Get-Date)
                        Success  = $false
                        Error    = $_.Exception.Message
                    }
                }
            } else {
                # If ShouldProcess returned $false (WhatIf), emit a preview object
                [PSCustomObject]@{
                    TaskName = $task.TaskName
                    TaskPath = $task.TaskPath
                    State    = 'WouldDisable'
                    Time     = (Get-Date)
                    Success  = $null
                }
            }
        }
    }
}

End {
    if (-not $names -or $names.Count -eq 0) {
        Write-Error "No task names provided. Use -TaskName, pipeline input, or -TaskListFile."
    }
}
