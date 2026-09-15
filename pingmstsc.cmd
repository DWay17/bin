:start
ping -n 1 <server_ip>
if errorlevel 0 goto remote_desktop
goto start 
:remote_desktop
mstsc /v:<server_ip>
