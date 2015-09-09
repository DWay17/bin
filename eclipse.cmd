set DIR=%PROGRAMFILESMY%\Eclipse\eclipse-standard-luna-SR1-win32-x86_64\
set DIR=%PROGRAMFILESMY%\Eclipse\eclipse-jee-mars-R-win32-x86_64\
set LOG_FILE=eclipse.log
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH
java -version
set JAVA_HOME=C:\Program Files\Java\jdk1.7.0_71
set JDK_HOME=C:\Program Files\Java\jdk1.7.0_71
java -version >> %LOG_FILE% 2>&1
set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B eclipse.exe >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
