
Get-Process | Where-Object {($_.Name -ne 'explorer') -and ($_.Name -ne 'cmd')  -and ($_.Name -ne 'powershell')} | Foreach-Object { $_.CloseMainWindow() | Out-Null } | stop-process –force