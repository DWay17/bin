c:
cd %PROGRAMFILESMY%\TOS\TOS_DI-20141207_1530-V5.6.1\

rem set LANG=en_GB.UTF-8 -nl en_EN in ini
set JAVA_HOME=C:\Program Files\Java\jdk1.7.0_71
set JDK_HOME=C:\Program Files\Java\jdk1.7.0_71
set LOG_FILE=TOS_DI_56-win-x86_64.log
java -version >> "%LOG_FILE%" 2>&1
set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B TOS_DI-win-x86_64.exe >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"

