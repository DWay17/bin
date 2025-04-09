# update software
#Start-Process "C:\Users\Public\Desktop\IObit Software Updater.lnk"
#Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\IObit Software Updater\IObit Software Updater.lnk"
run.ps1 "Software Updater"
#Start-Process "C:\Users\t.richter\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\PatchMyPC.lnk"
run.ps1 PatchMyPC
#Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PatchMyPC\PatchMyPC.lnk"
#Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI.lnk"
#Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI.lnk "
run.ps1 UniGetUI
#echo "choco outdated | sed -e 's/|/\t/g'"
Write-Output "choco_outdated.ps1"
#echo "choco_outdated.ps1"
Write-Output "winget source update ; winget upgrade"
#echo "winget source update ; winget upgrade"
#winget source update ; winget upgrade

#start "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI .lnk"
#start "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI  - admin.lnk"
#start "C:\Users\t.richter\AppData\Roaming\Microsoft\Windows\Start Menu\WingetUI.lnk"
Start-Process 'WingetUI - admin.cmd'

Import-Module PSWindowsUpdate
Get-WUList -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
