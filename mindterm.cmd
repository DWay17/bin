REM 
set DIR=%PROGRAMFILESMY%\mindterm\
cd %DIR%
set LOG_FILE=mindterm.log
echo %DATE% %TIME% >> "%LOG_FILE%"
sleep 1
start "mindterm" /B javaw -jar mindterm.jar >> %LOG_FILE% 2>&1
sleep 1
echo %DATE% %TIME% >> "%LOG_FILE%"
