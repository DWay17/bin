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
ICACLS \\mucosasafe.mucosalab.de\projects2\proj_I2B2\ /grant t.richter@i-kmb.de:(OI)(CI)F /T
icacls "\\mucosasafe.mucosalab.de\projects2\proj_I2B2\Original Datenlieferungen\sysINFLAME\*" /reset /t
icacls sysINFLAME/ /reset /t
icacls \\mucosasafe.mucosalab.de\projects2\proj_I2B2\ /reset /t
REM in dos pasten: icacls sysINFLAME/ /verify /t | grep -a kanonischer | tr -c '[:print:][:space:]' ' ' | sed -re 's/(.*):.*/\1/g' -e 's#(.*)\\.*#\1#g' | sort -u | sed -re 's#[/\\]+#\\#g' -e 's#^#icacls "#g' -e 's#$#" /reset /t#g'
mklink IKMB_PatientVisitsWithBiopsies_2014-10-14-s.zip IKMB_PatientVisitsWithBiopsies_2014-10-14.xlsx
mklink /H IKMB_PatientVisitsWithBiopsies_2014-10-14-s.zip IKMB_PatientVisitsWithBiopsies_2014-10-14.xlsx
echo Y| Cacls filename g username: permission
pslist | cut -d' ' -f1 | grep -iE "(adobe|acrobat|reader)" | xargs pskill
REM WinSxS löschen oder aufräumen
DISM.exe /Online /Cleanup-Image /spsuperseded
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
Dism.exe /online /Cleanup-Wim
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
REM works:
DISM.exe /online /Cleanup-Image /spsuperseded
cleanmgr 
cmd /c start /b cxcc
REM shutdown /l = Log off and /f = force
shutdown /l /f

REM komprimieren
compact /c /a /s /i /q C:\Windows\winsxs\* >> %LOGDIR%/compact.log
compact /c /a /s /i /q C:\Windows\winsxs\ >> %LOGDIR%/compact.log
compact /c /a /i /q C:\Windows\winsxs\* >> %LOGDIR%/compact.log
compact /c /a /i /q C:\Windows\winsxs >> %LOGDIR%/compact.log

compact /c /a /s /i /q C:\Windows\installer\* >> %LOGDIR%/compact.log
compact /c /a /s /i /q C:\Windows\installer\ >> %LOGDIR%/compact.log
compact /c /a /i /q C:\Windows\installer\* >> %LOGDIR%/compact.log
compact /c /a /i /q C:\Windows\installer >> %LOGDIR%/compact.log

set CATALINA_OPTS=-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false
set JRE_HOME=c:\Program Files\Java\jdk1.7.0_79\
set JAVA_HOME=c:\Program Files\Java\jdk1.7.0_79\
set CATALINA_OPTS=%CATALINA_OPTS%-DproxySet=true -DproxyHost=127.0.0.1 -DproxyPort=8888 -Djavax.net.ssl.trustStore=C:\Users\t.richter\FiddlerKeystore -Djavax.net.ssl.trustStorePassword=Fiddler
set JAVA_OPTS=-DproxySet=true -DproxyHost=127.0.0.1 -DproxyPort=8888 -Djavax.net.ssl.trustStore=C:\Users\t.richter\FiddlerKeystore -Djavax.net.ssl.trustStorePassword=Fiddler
set MVN_HOME=C:\Programme\maven\apache-maven-3.3.9\
set PATH=%PATH%;%MVN_HOME%\bin
REM set M2_HOME=%HOME%\.m2
set USER.HOME=%HOME%
set user.home=%HOME%
taskkill /T /FI "IMAGENAME eq *e*"
taskkill /T /FI "IMAGENAME eq explorer"
taskkill /F /T /FI "IMAGENAME eq *e*"

mvn dependency:purge-local-repository
mvn --settings C:\Users\t.richter\.m2\settings.xml dependency:purge-local-repository | tee fdm_d_plr.log            
mvn --settings C:\Users\t.richter\.m2\settings.xml dependency:purge-local-repository -DreResolve=false | tee fdm_d_plr.log
mvn --settings C:\Users\t.richter\.m2\settings.xml dependency:purge-local-repository -DactTransitively=false -DreResolve=false | tee fdm_d_plr.log

forfiles /s /m *.txt /c "perl -pi -e s/Sitaram/Mohan/g @path"

REM mstsc /domain p2n-sh /u t.richter /v:172.21.97.223

taskkill /T /FI "IMAGENAME eq googledrive*"
taskkill /T /FI "IMAGENAME eq dropbox*"
taskkill /T /F /FI "IMAGENAME eq googledrive*"
taskkill /T /F /FI "IMAGENAME eq dropbox*"
taskkill /T /F /FI "IMAGENAME eq savservice*"

C:\Windows\winsxs\amd64_microsoft-windows-sidebar_31bf3856ad364e35_6.1.7601.17514_none_2d02b12c3d47a517\sidebar.exe
C:\Windows\winsxs\wow64_microsoft-windows-sidebar_31bf3856ad364e35_6.1.7601.17514_none_37575b7e71a86712\sidebar.exe

mklink /D C:\Windows\Installer D:\C_DRIVE\Windows\Installer
