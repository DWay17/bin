# c:\Users\t.richter\bin\startupsrequence.ps1
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

