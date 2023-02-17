REM misc.cmd
REM Richter, Thomas (t.richter@i-kmb.de)
REM chmod für dos/windows:
ICACLS . /grant t.richter@i-kmb.de:(OI)(CI)F /T
REM ATTRIB löscht Schreibschutz /s rekursiv /d ordner
ATTRIB /s /d -R "*" 
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
REM komprimieren compress
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
for %x in (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do taskkill /T /FI "IMAGENAME eq %x*"
cmd /c for %x in (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do taskkill /T /FI "IMAGENAME eq %x*"
C:\Users\t.richter>mklink /D symlink target
Ihre Berechtigungen reichen nicht aus, um diesen Vorgang auszuführen.
C:\Users\t.richter>mklink /H hardlink target
Zugriff verweigert
C:\Users\t.richter>mklink /J junktion target
Verbindung erstellt für junktion <<===>> target
Create JAVA_HOME system wide variable: setx.exe JAVA_HOME "C:\Program Files\Java\jre6" /M
forfiles /p c:\var /s /m *.tsv /d -7 /C "cmd /c del /q @path"
takeown /R /F "*"
icacls * /T /Q /C /RESET

icacls c:\Users\t.richter /reset /t
icacls c:\Users\t.richter /T /grant "LAPTOP-FBFN60TK\t.richter":(OI)(CI)F
REM takeown /R /U LAPTOP-FBFN60TK\t.richter /F *
takeown /R /S LAPTOP-FBFN60TK /U LAPTOP-FBFN60TK\t.richter /F *
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
secedit /configure /cfg %windir%\inf\defltsv.inf /db defltbase.sdb /verbose

REM Löschen kann man Snapshots mit
vssadmin delete shadows /all /quiet /for=c:
REM Dieser Befehl erfordert weitere Parameter: /shadow=‹GUID› löscht eine bestimmte Schatten­ko­pie, /oldest nur die älteste, /all alle. /quiet
wmic netlogin list full
REM seriennummer
wmic csproduct list full | grep IdentifyingNumber | sed -e 's/.*=//g'
REM set environment variable
setx MSYS winsymlinks:nativestrict
setx CYGWIN winsymlinks:nativestrict
git config --system core.symlinks true
setx JAVA_HOME C:\Users\t.richter\.sdkman\candidates\java\current
setx MAVEN_HOME c:\Users\t.richter\.sdkman\candidates\maven\current
setx GRADLE_HOME C:\Users\t.richter\.sdkman\candidates\gradle\current
setx GROOVY_HOME C:\Users\t.richter\.sdkman\candidates\groovy\current
setx MAVEN_HOME C:\Users\t.richter\.sdkman\candidates\maven\current
setx ANT_HOME C:\Users\t.richter\.sdkman\candidates\ant\current
setx GRAILS_HOME C:\Users\t.richter\.sdkman\candidates\grails\current

set | find "_HOME"
setx JDK_HOME "C:\Program Files\Java\jdk1.8.0_211"
setx JRE_HOME "C:\Program Files\Java\jre1.8.0_211"
setx JAVA_HOME "%JDK_HOME%"

icacls c:\Users\t.richter /grant "LAPTOP-FBFN60TK\t.richter":(OI)(CI)F
icacls c:\develop /grant "LAPTOP-FBFN60TK\t.richter":(OI)(CI)F
icacls "c:\develop\*" /q /c /reset /t
icacls "c:\Users\t.richter\*" /q /c /reset /t
REM 650848 Dateien erfolgreich verarbeitet, bei 63 Dateien ist ein Verarbeitungsfehler aufgetreten.
takeown /R /S LAPTOP-FBFN60TK /U LAPTOP-FBFN60TK\t.richter /F "My Web Sites"

pushd \\server\share
popd  \\server\share

for %%I IN (.\lib\*.jar) DO SET CP=!CP!;%%I

ftype jarfileterm=cmd /s /k “”C:\Program Files\Java\jre7\bin\java.exe” -jar “%1″ %*”
assoc .jar=jarfileterm 


REM 134.245.4.72	255.255.255.255	134.245.228.36	134.245.228.35	9999	Indirect	Static Route	2.748	Fortinet SSL VPN Virtual Ethernet Adapter	00-09-0F-AA-00-01	19.02.2020 10:35:07	No	

```
route add 134.245.4.72 mask 255.255.255.255 172.21.90.1
route change 134.245.4.72 mask 255.255.255.255 134.245.228.36 metric 9999
```
route CHANGE 157.0.0.0 MASK 255.0.0.0 157.55.80.5 METRIC 2 IF 2

REM node.js
REM To install a FHIR package with all dependencies, this gets you there. In this example we'll install package hl7.fhir.core.r4.
npm create
npm --registry https://packages.simplifier.net install hl7.fhir.core.r4
npm --registry https://packages.simplifier.net install 
REM Simplifier as default npm package server
REM If you want to set Simplifier as your default package server, you can do that with NPM. We recommend you only do that if you don't need npm for .js packages.
npm config set registry https://packages.simplifier.net/
npm install hl7.fhir.core.r4
npm install 
npm --registry https://packages.simplifier.net install de.medizininformatikinitiative.kerndatensatz@0.0.1

REM fhir
dotnet tool install -g torinox 

mvn archetype:generate -Dfilter=org.apache:nifi

wsl --set-version Ubuntu 2
wsl --set-version openSUSE-42 2
wsl --set-version Debian 2

cd \\wsl$\docker-desktop-data\version-pack-data\community\docker\volumes\
wsl -u root

REM Inkscape required an uninstallation before the latest update. Uninstalling Inkscape: 
C:\WINDOWS\system32\msiexec.exe /X{81922150-317E-4BB0-A31D-FF1C14F707C5} /qb


REM Equivalent of chmod 600 <filename> in windows will be:
REM  Add explicit R+W permissions for current user.
icacls <filename> /grant %username%:rw
REM Disable inheritance from folders
icacls <filename> /inheritance:d
REM  Remove default groups (Authenticated Users, System, Administrators, Users)
icacls <filename> /remove *S-1-5-11 *S-1-5-18 *S-1-5-32-544 *S-1-5-32-545










