REM misc.cmd
REM Richter, Thomas (t.richter@i-kmb.de)
REM chmod für dos/windows:
ICACLS . /grant t.richter@i-kmb.de:(OI)(CI)F /T
ATTRIB /s /d -R * 
"C:\Windows\system32\rundll32.exe" sysdm.cpl,EditEnvironmentVariables
runDLL32 sysdm.cpl,EditEnvironmentVariables
