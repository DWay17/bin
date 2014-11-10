c:
cd c:\Programme\TOS\TOS_DI-r104014-V5.3.1\
REM LANG=de_DE.UTF-8
set LANG=en_GB.UTF-8
echo %DATE% %TIME% >> TOS_DI-win-x86_64.log
start "" /B TOS_DI-win-x86_64.exe >> TOS_DI-win-x86_64.log
echo %DATE% %TIME% >> TOS_DI-win-x86_64.log

