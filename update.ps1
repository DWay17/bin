# update software
start "C:\Users\Public\Desktop\IObit Software Updater.lnk"
start "C:\Users\t.richter\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\PatchMyPC.lnk"
echo "choco outdated | sed -e 's/|/\t/g'"
choco_outdated.ps1
echo "winget source update ; winget upgrade"
winget source update ; winget upgrade
