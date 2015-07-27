set DIR=%PROGRAMFILESMY%\eclipse\eclipse-standard-luna-SR1-win32-x86_64\
set LOG_FILE=eclipse.log
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH
java -version
java -version >> %LOG_FILE% 2>&1
java -version >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B eclipse.exe >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
