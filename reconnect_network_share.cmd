@echo off

:Start
timeout /t 5 /nobreak >NUL
if exist X:\NUL goto End
net use X: \\server\share /USER:domainname\username /PERSISTENT:YES
if ERRORLEVEL 1 goto Start
:End
