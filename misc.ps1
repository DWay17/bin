Install-Module PSReadLine
; Administrator
Install-Module PSReadLine
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module PSReadLine
Set-PSReadlineOption -HistorySaveStyle SaveAtExit

; All User
Get-Content -Path (Get-PSReadlineOption).HistorySavePath
Invoke-History 1
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit

Get-History | Export-Csv c:\testing\history.csv
Import-Csv c:\testing\history.csv | Add-History

Get-History | Select-String -Pattern "Example"

$HistFile = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistFile } | out-null
if (Test-path $HistFile) { Import-Clixml $HistFile | Add-History }

# grep
Select-String -Path *.ts -Pattern "@select"

set-netroute -destination 134.245.4.72/32 -AddressFamily IPv4 -NextHop 172.21.90.1

(Get-NetRoute).GetType()
(Get-NetRoute | out-string).split("`n") | Select-String -Pattern "255"
Get-NetRoute | Where-Object {$_.DestinationPrefix -like "134.245.4.72*"}
Get-NetRoute | Where-Object {$_.DestinationPrefix -like "134.245.4.72*" -and $_.NextHop -like "134.245*"} | Set-NetRoute -RouteMetric 512
Get-NetRoute | Where-Object {$_.DestinationPrefix -like "134.245.4.72*" -and $_.NextHop -like "172.*"} | Set-NetRoute -RouteMetric 512

$array = @("wert1","wert2","wert3", "wert4", "wert5")
Write-Host $array[0]
$array.length
$array | foreach { $_ }

# environment variables
# show environment variables
dir env:
Get-ChildItem env:
echo ${env:ProgramFiles(x86)}
Write-Output ${env:ProgramFiles(x86)}
echo $env:JAVA_HOME
Remove-Item env:\test, env:\myVar
$env:PATH += ";c:\test"
$env:DISPLAY = 'localhost:0.0'

# You can use the .NET Path class:
[IO.Path]::Combine('C:\', 'Foo', 'Bar')

$env:Path=(($env:Path.Split(";") | Select-String -NotMatch -Pattern "Java") | Out-String).Replace("`r`n", ";") -Replace(";+",";")
$env:Path += "$env:JAVA_HOME\bin"

ii $profile
# ==
Invoke-Item $profile

Set-ADAccountPassword 'CN=Jeremy Los,OU=Accounts,DC=Fabrikam,DC=com' -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)
Set-AdAccountPassword -Identity I-KMB\t.richter -OldPassword (Read-Host -asSecureString "Enter the current password") -NewPassword (Read-Host -asSecureString "Enter the new password")
$old = (Read-Host -asSecureString "Enter the current password")
$new = (Read-Host -asSecureString "Enter the new password")

$user = "t.richter"
$computer = "I-KMB"
$usr = [adsi]"WINNT://$computer/$user"
$usr.ChangePassword($old,$new)

# spawn a few notepad windows to play with
1..2 | % { Notepad.exe }

$WindowCode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$AsyncWindow = Add-Type -MemberDefinition $WindowCode -Name Win32ShowWindowAsync -namespace Win32Functions -PassThru

# get the handles for each window
$hwnd0 = (Get-Process -Name Notepad)[0].MainWindowHandle
$hwnd1 = (Get-Process -Name Notepad)[1].MainWindowHandle

# hide the first notepad window (remove from the taskbar)
$null = $AsyncWindow::ShowWindowAsync($hwnd0, 0)
# maximise the first notepad window again
$null = $AsyncWindow::ShowWindowAsync($hwnd0, 3)
# minimise the second notepad window
$null = $AsyncWindow::ShowWindowAsync($hwnd1, 6)
# now hide it completely even though its minimised
$null = $AsyncWindow::ShowWindowAsync($hwnd1, 0)
# restore the first notepad window to its original state
$null = $AsyncWindow::ShowWindowAsync($hwnd0, 9)

# optionale Feature „Windows-Subsystem für Linux“ aktivieren.
# Öffnen Sie PowerShell als Administrator, und führen Sie Folgendes aus: PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Öffnen Sie PowerShell als Administrator, und führen Sie Folgendes aus: PowerShell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# close stop kill end
Get-Process MyProgram |   Foreach-Object { $_.CloseMainWindow() | Out-Null }
Get-Process Myprogram |   Foreach-Object { $_.CloseMainWindow() | Out-Null } | stop-process -force
Get-Process anything | ? { $_.CloseMainWindow() | Out-Null }
# 
Stop-Process -Name firefox
Stop-Process -Name firefox -force
# 
$acl = Get-Acl 'C:\Program Files\jEdit\modes\'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("t.richter","Write","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'C:\Program Files\jEdit\modes\'

[system.Diagnostics.Process]::Start("chrome","https://debug.to")
Start-Process "https://debug.to"

Get-NetRoute -AddressFamily IPv4 -State Alive | Where-Object {$_.NextHop -ne '0.0.0.0'} | Sort-Object InterfaceAlias
Get-NetRoute -AddressFamily IPv4 -State Alive | Where-Object {$_.NextHop -ne '0.0.0.0'} | Sort-Object InterfaceAlias | Select-Object -Property InterfaceAlias,DestinationAddress,DestinationPrefix,NextHop
Get-NetRoute |  Where-Object {($_.Addressfamily -eq "IPv4")} | ft InterfaceAlias,AddressFamily,DestinationPrefix,NextHop,Routemetric -a
Get-NetRoute -AddressFamily IPv4 -State Alive | Where-Object {$_.NextHop -ne '0.0.0.0'} | Sort-Object InterfaceAlias | Select-Object -Property InterfaceAlias,DestinationAddress,DestinationPrefix,NextHop,AddressFamily,Routemetric

$device = Get-PnpDevice -class Bluetooth -friendlyname "WH-1000XM3"
Disable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false
Start-Sleep -Seconds 10
Enable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false

(($env:tsp100id = (Get-PnpDevice -FriendlyName 'WH-1000XM3').InstanceId[0]) -split '\\')[-1]

# list show software
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.Publisher -notmatch 'microsoft|NVIDIA|intel'}|  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName | Format-Table -AutoSize
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.Publisher -notmatch 'microsoft|NVIDIA|intel'}|  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName | Format-Table -AutoSize

Get-Content -Path (Get-PSReadlineOption).HistorySavePath | grep -i start | tac | awk '!seen[$0]++' | tac

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Typora version 0.9.75"}
$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -like "Typora*"}
$MyApp.Uninstall()
$MyApp = Get-Package -Provider Programs -IncludeWindowsInstaller -Name "Typora version 0.9.75"
Uninstall-Package -Name 'Typora version 0.9.75' 
Get-Package -Provider Programs -IncludeWindowsInstaller -Name "Typora version 0.9.75" | Uninstall-Package
Get-Software | Where-Object { $_.DisplayName -like "*Typora*" } | Format-Table
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName -like '*typora*'}
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName -like '*typora*'} |% { & $_.Meta.Attributes["UninstallString"]}
# rocket
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName -like '*rocket*'}
Get-Package -Provider Programs -IncludeWindowsInstaller | Where-Object {$_.Name -like '*rocket*'}
##slow
Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -like "*rocket*"}

# hexdump
gc -encoding byte -TotalCount 100 ".\Napkon Dataset.kdbx" |% {write-host ("{0:x}" -f $_) -noNewline " "}; write-host

# package manager
winget source update
winget upgrade --all
winget upgrade --all --silent --accept-package-agreements --accept-source-agreements --logs winget.log
winget upgrade --all --disable-interactivity --accept-package-agreements --accept-source-agreements --logs winget.log

# talend project - build - shell settings
$fileDir = Split-Path -Parent $MyInvocation.MyCommand.Path
cd $fileDir
java '-Dtalend.component.manager.m2.repository=%cd%/../lib' ${talend.job.jvmargs.ps1} -cp ${talend.job.ps1.classpath} ${talend.job.class} ${talend.job.bat.addition} $args

### 
$choco = (new-object net.webclient). DownloadString('https://chocolatey.org/install.ps1')
Invoke-Expression $choco;
#Optional ist es zudem möglich, die Umgebungsvariable "PATH" anzupassen:

$ENV:PATH += ";$ENV:ALLUSERSPROFILE\chocolatey\bin"

"`nNew-Alias which get-command" | add-content $profile

Get-PSReadlineOption
$Host.PrivateData.ErrorBackgroundColor.GetType()
[System.Enum]::GetValues('ConsoleColor')
[Console]::ResetColor()
[System.Enum]::GetValues('ConsoleColor') | ForEach-Object { Write-Host $_ -ForegroundColor $_ }

Set-PSReadLineOption -Colors @{
 # Use a ConsoleColor enum
 "Error" = [ConsoleColor]::DarkRed

 # 24 bit color escape sequence
 "String" = "$([char]0x1b)[38;5;100m"

 # RGB value
 "Command" = "#8181f7"
}

getmac /v /fo csv | ConvertFrom-Csv

Start-Process xxx -RedirectStandardError xxx.log -RedirectStandardOutput xxx.log 
Get-Process -Name pwsh | Out-String | Set-Content .\Process.txt
Get-Process -Name pwsh | Out-File -Path C:\Foo\pwsh.txt
Out-File -Append

Get-Command -Module WindowsUpdateProvider # outdated
# Anzeigen der Provider
Get-WUServiceManager

# Hinzufügen von Microsoft Updates 
Add-WUServiceManager -ServiceID "7971f918-a847-4430-9279-4a52d1efe18d" -AddServiceFlag 7

# Microsoft Updates auflisten # Import-Module PSWindowsUpdate
Get-WUList -MicrosoftUpdate

# ? source ?
Install-WUUpdates

#? # Import-Module PSWindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot

Import-Module PSWindowsUpdate

ipconfig /flushdns /registerdns 
ipconfig /release /renew

ipconfig /flushdns
ipconfig /registerdns

ipconfig /displaydns

# systemsteuerung
start %windir%\system32\control.exe
Start-Process %windir%\system32\control.exe


# lnk target link
Get-ChildItem | ? Target | Select-Object FullName, Target
Get-ChildItem | Where-Object Target | Select-Object FullName, Target

# lock screen
rundll32.exe user32.dll,LockWorkStation
# exit log out
logoff.exe

Get-Process | Where-Object {$_.ProcessName -match ".*(opera|edge|firefox|launcher|browser_assistant).*" } | ForEach-Object { $_.kill() }

Get-Process | Where-Object {$_.ProcessName -notmatch "powerlauncher"} | Where-Object {$_.ProcessName -match ".*(iexplore|opera|edge|firefox|launcher|browser_assistant).*" } | ForEach-Object { $_.kill() }

C:\Program Files\PowerShell\7\pwsh.exe
pwsh -command C:\Users\t.richter\bin\userlog.ps1 winlogon %* '$(SystemTime)' '$(Data)'

"C:\Program Files\Mozilla Thunderbird\thunderbird" -profilemanager --allow-downgrade
c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Thunderbird.lnk -profile C:\Users\t.richter\AppData\Roaming\Thunderbird\Profiles\a0ogkwzo.default

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

winget source add --name https://www.powershellgallery.com/api/v2 --arg https://www.powershellgallery.com/api/v2 --accept-source-agreements --disable-interactivity --type Microsoft.Rest
winget source add --name PSGalleryv2 --arg https://www.powershellgallery.com/api/v2 --accept-source-agreements --disable-interactivity --type Microsoft.Rest

npm update -g -u

npm install -g npm-check-updates
ncu --upgrade

Get-Process | Get-Member | Out-String | grep -i path

Get-Service | Where-Object { $_.DisplayName -match "drop|dbx" } | Stop-Service











