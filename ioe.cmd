REM ioe.cmd
set DIR=%PROGRAMFILESMY%\IDRT_IOE\de.umg.mi.idrt.product.id-win32.win32.x86_64\
REM set EXENAME=IOE
set EXENAME=IDRTImportTool
set EXENAME=IDRT IMT
set LOG_FILE=%EXENAME%.log
cd "%DIR%"
echo %DATE% %TIME% >> "%LOG_FILE%"
start "%EXENAME%" /B "%EXENAME%" >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
pause
