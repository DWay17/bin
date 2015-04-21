c:
cd c:\Programme\TOS\TOS_DI-r104014-V5.3.1\

REM set LANG=en_GB.UTF-8 -nl en_EN in ini
echo %DATE% %TIME% >> TOS_DI-win-x86_64.log
start "" /B TOS_DI-win-x86_64.exe >> TOS_DI-win-x86_64.log 2>&1
echo %DATE% %TIME% >> TOS_DI-win-x86_64.log

