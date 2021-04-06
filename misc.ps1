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

echo ${env:ProgramFiles(x86)}
echo $env:JAVA_HOME
Remove-Item env:\test, env:\myVar
$env:PATH += ";c:\test"

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
Get-Process Myprogram |   Foreach-Object { $_.CloseMainWindow() | Out-Null } | stop-process –force
Stop-Process -Name firefox
Stop-Process -Name firefox -force














