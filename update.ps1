# update software
#Start-Process "C:\Users\Public\Desktop\IObit Software Updater.lnk"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\IObit Software Updater\IObit Software Updater.lnk"
Start-Process "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\PatchMyPC.lnk"
#echo "choco outdated | sed -e 's/|/\t/g'"

#echo "choco_outdated.ps1"
#choco_outdated.ps1
#echo "winget source update ; winget upgrade"
#winget source update ; winget upgrade

#start "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI .lnk"
#start "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI  - admin.lnk"
#start "C:\Users\t.richter\AppData\Roaming\Microsoft\Windows\Start Menu\WingetUI.lnk"
Start-Process 'WingetUI - admin.cmd'

Import-Module PSWindowsUpdate
Get-WUList -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
