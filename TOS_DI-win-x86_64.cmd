c:
cd %PROGRAMFILESMY%\TOS\TOS_DI-r104014-V5.3.1\

REM set LANG=en_GB.UTF-8 -nl en_EN in ini
set LOG_FILE=TOS_DI-win-x86_64.log
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B TOS_DI-win-x86_64.exe >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%" 


