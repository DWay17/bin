set DIR=%PROGRAMFILESMY%\Eclipse\eclipse-standard-luna-SR1-win32-x86_64\
set DIR=%PROGRAMFILESMY%\Eclipse\eclipse-jee-mars-R-win32-x86_64\
set DIR=%PROGRAMFILESMY%\eclipse\eclipse-jee-neon-3-win32-x86_64\
set DIR=%PROGRAMFILESMY%\eclipse\current\
set LOGDIR="C:\Users\t.richter\logs\"
set LOG_FILE=%LOGDIR%\eclipse.log
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH

REM SET HOME=%HOMEDRIVE%%HOMEPATH%
REM SET HOMEDRIVE=C:
REM SET HOMEPATH=\Users\t.richter
REM SET JAVA_HOME=c:\Program Files\Java\jdk1.8.0_131\
REM SET JAVA_HOME=C:\Users\t.richter\.sdkman\candidates\java\11.0.12-open\
SET JAVA_HOME=C:\Users\t.richter\.sdkman\candidates\java\current\
REM SET USERNAME=t.richter
REM SET USERPROFILE=C:\Users\t.richter
REM SET HOME.USER=C:\Users\t.richter

echo HOME=%HOME%
echo HOMEDRIVE=%HOMEDRIVE%
echo HOMEPATH=%HOMEPATH%
echo JAVA_HOME=%JAVA_HOME%         
echo USERNAME=%USERNAME%
echo USERPROFILE=%USERPROFILE%
echo HOME.USER=%HOME.USER%

REM 
REM  set java version in eclipse.ini with -vm 
REM

REM -perspective perspectiveId The perspective to open in the active workbench window on startup. If this parameter
REM is not specified, the perspective that was active on shutdown will be opened.
REM
REM -perspective (workbench) launch Eclipse and switch to the perspective with the given id. As an example, for
REM JDT perspective, we read the JDT APIs, to find the ID_PERSPECTIVE is "org.eclipse.jdt.ui.JavaPerspective".
REM org.eclipse.jdt.ui.JavaUI.ID_BROWSING_PERSPECTIVE (vari)
REM org.eclipse.jdt.ui.JavaBrowsingPerspective
set ARGS=-perspective org.eclipse.jdt.ui.JavaBrowsingPerspective

java -version >> %LOG_FILE% 2>&1
REM echo "set vari to  1.7" >> %LOG_FILE% 2>&1
REM java -version >> %LOG_FILE% 2>&1
REM echo "set path to  1.7" >> %LOG_FILE% 2>&1
REM java -version >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B eclipse.exe >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
REM pause

