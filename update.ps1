# update software
#Start-Process "C:\Users\Public\Desktop\IObit Software Updater.lnk"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\IObit Software Updater\IObit Software Updater.lnk"
Start-Process "C:\Users\t.richter\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\PatchMyPC.lnk"
#echo "choco outdated | sed -e 's/|/\t/g'"
echo "choco_outdated.ps1"
choco_outdated.ps1
echo "winget source update ; winget upgrade"
winget source update ; winget upgrade

Import-Module PSWindowsUpdate
Get-WUList -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
