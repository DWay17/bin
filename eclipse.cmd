set DIR=%PROGRAMFILESMY%\Eclipse\eclipse-standard-luna-SR1-win32-x86_64\
set DIR=%PROGRAMFILESMY%\Eclipse\eclipse-jee-mars-R-win32-x86_64\
set DIR=%PROGRAMFILESMY%\eclipse\eclipse-jee-neon-3-win32-x86_64\
set LOG_FILE=eclipse.log
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH

REM SET HOME=%HOMEDRIVE%%HOMEPATH%
REM SET HOMEDRIVE=C:
REM SET HOMEPATH=\Users\t.richter
REM SET JAVA_HOME=c:\Program Files\Java\jdk1.8.0_131\
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

java -version >> %LOG_FILE% 2>&1
REM echo "set vari to  1.7" >> %LOG_FILE% 2>&1
REM java -version >> %LOG_FILE% 2>&1
REM echo "set path to  1.7" >> %LOG_FILE% 2>&1
REM java -version >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B eclipse.exe >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
REM pause

