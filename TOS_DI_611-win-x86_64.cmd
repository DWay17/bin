c:
cd %PROGRAMFILESMY%\TOS\TOS_DI-20151214_1327-V6.1.1\
REM    c:\Programme\TOS\TOS_DI-20141207_1530-V5.6.1\
rem set LANG=en_GB.UTF-8 -nl en_EN in ini

set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH

set LOG_FILE=TOS_DI-win-x86_64.log
java -version >> "%LOG_FILE%" 2>&1
set JAVA_HOME=c:\Users\t.richter\.sdkman\candidates\java\8.0.201-oracle\
set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> "%LOG_FILE%" 2>&1



echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B TOS_DI-win-x86_64.exe >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"

