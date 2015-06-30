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
REM \\mucosasafe.mucosalab.de\projects2\proj_I2B2 
net use V: \\mucosasafe.mucosalab.de\projects2\proj_I2B2\  
ICACLS \\mucosasafe.mucosalab.de\projects2\proj_I2B2\ /grant t.richter@i-kmb.de:(OI)(CI)F /T

REM damit trennst du alle laufwerke
net use * /D /Y

REM damit nur z.b. laufwerk x:

net use x: /D /Y
net use R: \\192.168.50.100\Datenverkehr /user:DOMÄNE\USER PASSWORT /persistent:no
mklink IKMB_PatientVisitsWithBiopsies_2014-10-14-s.zip IKMB_PatientVisitsWithBiopsies_2014-10-14.xlsx
mklink /H IKMB_PatientVisitsWithBiopsies_2014-10-14-s.zip IKMB_PatientVisitsWithBiopsies_2014-10-14.xlsx
net use V:\ \\mucosasafe.mucosalab.de\projects2\proj_I2B2
