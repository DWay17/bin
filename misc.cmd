REM misc.cmd
REM Richter, Thomas (t.richter@i-kmb.de)
ICACLS . /grant t.richter@i-kmb.de:(OI)(CI)F /T
ATTRIB /s /d -R * 
"C:\Windows\system32\rundll32.exe" sysdm.cpl,EditEnvironmentVariables
runDLL32 sysdm.cpl,EditEnvironmentVariables
