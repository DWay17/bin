@echo off
set mydate=%date:~6,4%-%date:~3,2%-%date:~0,2%
echo %myDATE% %TIME% %~n0 %1 %2 %3 %4 %5 %6 %7 %8 %9 >> C:\Users\t.richter\logs\user.log
