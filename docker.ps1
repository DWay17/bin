# docker.ps1
$logFile = "C:\Users\t.richter\logs\docker.log"
#${
&{

$sleepSeconds = 42
Write-Output "start Docker Desktop"
Start-Process 'C:\Program Files\Docker\Docker\Docker Desktop.exe' # docker
Write-Output "started Docker Desktop"
#start 'C:\Program Files\Docker\Docker\Docker Desktop.exe' # docker
Write-Output "sleep for $sleepSeconds seconds"
Get-Date; Start-Sleep -Seconds $sleepSeconds ; Get-Date
Write-Output "start DockStation"
Start-Process 'C:\Users\t.richter\Desktop\DockStation.lnk' # docker
Write-Output "start Kitematic"
Start-Process 'C:\Users\t.richter\Desktop\Kitematic.lnk' # docker

} 4>&1 3>&1 2>&1 >> $logFile