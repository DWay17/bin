# c:\Users\t.richter\bin\startupsrequence.ps1

Write-Host "Running script: $($MyInvocation.MyCommand.Name)`n"

## sizer
#Stop-Process -Name sizer.exe
Get-Process | Where-Object {$_.ProcessName -match ".*(sizer).*" } | ForEach-Object { $_.kill() }
#Start-Process "C:\Program Files (x86)\Sizer\sizer.exe"
run.ps1 sizer

## Capture2Text
#Stop-Process -Name Capture2Text 
Get-Process | Where-Object {$_.ProcessName -match ".*(Capture2Text).*" } | ForEach-Object { $_.kill() }
# Start-Process c:\programme\Capture2Text\Capture2Text.exe # ocr
run.ps1 Capture2Text

## procexp
Get-Process | Where-Object {$_.ProcessName -match ".*(procexp).*" } | ForEach-Object { $_.kill() }
run.ps1 procexp

## Screenpresso
Get-Process | Where-Object {$_.ProcessName -match ".*(procexp).*" } | ForEach-Object { $_.kill() }
Start-Process "C:\Users\trichter\AppData\Local\Learnpulse\Screenpresso\Screenpresso.exe"

Disable-ScheduledTasks.ps1 -TaskListFile ~/Disable-ScheduledTasks.txt &

autoruns-disabled.ps1 &

#"postgres|pg_ctl|DbxSvc|dropbox|docker|VirtualBox|webex|CiscoSpark|dbupdate|dbupdatem|AdobeARMservice|nssm|grafana|slack|adobe" | Services-Manu-Stop.ps1 &
#"AdobeARMservice|CCleaner|CiscoSpark|DbxSvc|Lenovo|VirtualBox|adobe|dbupdate|dbupdatem|docker|dropbox|forti|grafana|ivanti|nssm|pg_ctl|postgres|pulse|slack|webex" | Services-Manu-Stop.ps1 &
#"AdobeARMservice|CCleaner|CiscoSpark|DbxSvc|VirtualBox|adobe|dbupdate|dbupdatem|docker|dropbox|forti|grafana|ivanti|nssm|pg_ctl|postgres|pulse|slack|webex" | Services-Manu-Stop.ps1 &
#"AdobeARMservice|CCleaner|CiscoSpark|DbxSvc|VirtualBox|adobe|dbupdate|dbupdatem|docker|dropbox|forti|grafana|nssm|pg_ctl|postgres|slack|webex" | Services-Manu-Stop.ps1 &
#"AdobeARMservice|CCleaner|CiscoSpark|DbxSvc|VirtualBox|adobe|dbupdate|dbupdatem|docker|dropbox|forti|grafana|nssm|onlyoffice|openvpn|pg_ctl|postgres|slack|webex" | Services-Manu-Stop.ps1 &
"AdobeARMservice|CCleaner|CiscoSpark|DSAService|DSAUpdateService|DbxSvc|Lenovo|VirtualBox|adobe|dbupdate|dbupdatem|docker|dropbox|forti|grafana|ivanti|nssm|onlyoffice|openvpn|pg_ctl|postgres|pulse|slack|webex" | Services-Manu-Stop.ps1 &

