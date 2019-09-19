REM bc2_sync_kdb
REM LAPTOP-FBFN60TK\t.richter
cd C:\Users\t.richter\bin\
REM dir I:\richter-th\
echo %DATE% %TIME%
echo %DATE% %TIME% >> bc2_sync_kdb_bat2_2.log
dir \\isilon01.zad.local\user\richter-th\
REM timeout /t 3 /NOBREAK
REM dir I:\richter-th\
REM net use I: '\\isilon01.zad.local\user' 
echo %DATE% %TIME%
echo %DATE% %TIME% >> bc2_sync_kdb_bat2_2.log
"C:\Program Files (x86)\Beyond Compare 2\BC2.exe" /silent @bc2_sync_kdb2.bc2 >> bc2_sync_kdb_bat2.log
echo %DATE% %TIME%
echo %DATE% %TIME% >> bc2_sync_kdb_bat2_2.log
exit

