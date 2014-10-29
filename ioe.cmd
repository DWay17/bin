REM ioe.cmd
DIR=C:\Programme\IDRT_IOE\de.umg.mi.idrt.product.id-win32.win32.x86_64\IOE.ini
cd "%DIR%"
echo %DATE% %TIME% >> IOE.log
start "ioe" /B IOE.exe >> IOE.log
echo %DATE% %TIME% >> IOE.log
