REM ioe.cmd
set DIR=%PROGRAMFILESMY%\IDRT_IOE\de.umg.mi.idrt.product.id-win32.win32.x86_64\
set DIR=%PROGRAMFILESMY%\IDRT_IOE\200\
REM set EXENAME=IOE
set EXENAME=IDRTImportTool
set EXENAME=IDRT IMT
set LOG_FILE=%EXENAME%.log
c:\cygwin64\bin\find /c/Programme/IDRT_IOE -maxdepth 9 -regextype posix-extended -iregex ".*(ioe|idrt|i2b2|eclipse|sql|imt).*\.log$" -type f -size +0  | grep -ivE '\.[0-9]{14}\.' | grep -iv '/temp/' | sed -e 's/^\(.*\)$/"\1"/g' | xargs mv.date.sh
cd "%DIR%"
echo %DATE% %TIME% >> "%LOG_FILE%"
start "%EXENAME%" /B "%EXENAME%" >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
REM pause
