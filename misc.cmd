REM misc.cmd
REM Richter, Thomas (t.richter@i-kmb.de)
REM chmod für dos/windows:
ICACLS . /grant t.richter@i-kmb.de:(OI)(CI)F /T
ATTRIB /s /d -R * 
"C:\Windows\system32\rundll32.exe" sysdm.cpl,EditEnvironmentVariables
runDLL32 sysdm.cpl,EditEnvironmentVariables
REM notepad++
ICACLS .                                                                    /grant t.richter@i-kmb.de:(OI)(CI)F /T 
ICACLS ..                                                                   /grant t.richter@i-kmb.de:(OI)(CI)F /T 
ICACLS "c:\Program Files (x86)\Notepad++"                                   /grant t.richter@i-kmb.de:(OI)(CI)F /T 
ICACLS "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad++"     /grant t.richter@i-kmb.de:(OI)(CI)F /T 
ICACLS "c:\Users\All Users\Microsoft\Windows\Start Menu\Programs\Notepad++" /grant t.richter@i-kmb.de:(OI)(CI)F /T 
icacls "\Program Files (x86)\java" /t /grant I-KMB\t.richter:(OI)(CI)(F)
