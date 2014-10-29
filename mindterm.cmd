REM 
DIR=c:\Programme\mindterm\
cd %DIR%
echo %DATE% %TIME% >> mindterm.log
start "mindterm" /B java -jar mindterm.jar >> mindterm.log
echo %DATE% %TIME% >> mindterm.log
