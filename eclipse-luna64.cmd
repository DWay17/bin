set DIR=%PROGRAMFILESMY%\eclipse\eclipse-standard-luna-SR1-win32-x86_64\
set LOG_FILE=eclipse.log
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH
java -version
REM set JAVA_HOME=c:\Program Files (x86)\Java\jdk1.7.0_71\
REM set JDK_HOME=c:\Program Files (x86)\Java\jdk1.7.0_71\
java -version >> %LOG_FILE% 2>&1
REM set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B eclipse.exe >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
pause
