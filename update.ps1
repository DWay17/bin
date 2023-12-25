# update software
#Start-Process "C:\Users\Public\Desktop\IObit Software Updater.lnk"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\IObit Software Updater\IObit Software Updater.lnk"
Start-Process "C:\Users\t.richter\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\PatchMyPC.lnk"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PatchMyPC\PatchMyPC.lnk"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI.lnk"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\WingetUI.lnk "
#echo "choco outdated | sed -e 's/|/\t/g'"
Write-Output "choco_outdated.ps1"
choco_outdated.ps1
Write-Output "winget source update ; winget upgrade"
winget source update ; winget upgrade
