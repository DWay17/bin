#vpn.ps1

#Start-Process "c:\Program Files (x86)\Fortinet\FortiClient\FortiClient.exe"
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\FortiClient VPN\FortiClient VPN.lnk"

#Start-Process 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Pulse Secure\Pulse Secure.lnk'
# PulseSecureServic 
# Fragt interaktiv nach den Administrator-Anmeldedaten
# $credential = Get-Credential

# Startet eine unsichtbare PowerShell im Hintergrund als Administrator, um den Dienst zu starten
# Start-Process powershell -ArgumentList "-Command Start-Service -Name 'PulseSecureService'" -Credential $credential -WindowStyle Hidden
Start-Process powershell -ArgumentList "-Command Start-Service -Name 'PulseSecureService'" -WindowStyle Hidden -Verb RunAs
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Pulse Secure\Ivanti Secure Access Client.lnk"

#Start-Process C:\Programme\WinAuth\WinAuth.exe

# Start-Process 'C:\Program Files\OpenVPN\bin\openvpn-gui.exe'
run.ps1 openvpn-gui
