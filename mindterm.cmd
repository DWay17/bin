REM 
DIR=c:\Programme\mindterm\
cd %DIR%
echo %DATE% %TIME% >> mindterm.log
sleep 1
start "mindterm" /B javaw -jar mindterm.jar >> mindterm.log 2>&1
sleep 1
echo %DATE% %TIME% >> mindterm.log
