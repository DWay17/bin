REM startupsequence
set LOGDIR="C:\Users\t.richter\logs\"
start "" /B %PROGRAMFILESMY%\Capture2Text\Capture2Text.exe >> %LOGDIR%\Capture2Text.log 2>&1 
rem start "" /B %PROGRAMFILESMY%\Sizer\sizer.exe >> %LOGDIR%\sizer.log 2>&1
REM start "" /B "C:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe" >> %LOGDIR%\KeePass.log 2>&1
start "" /B "I:\richter-th\database.kdbx" >> %LOGDIR%\KeePass.log 2>&1
start "" /B "C:\Program Files\totalcmd\TOTALCMD64.EXE" >> %LOGDIR%\totalcmd.log 2>&1
sleep 1
pskill jEdit
sleep 1
pskill javaw
sleep 1
pskill java
sleep 1
start "" /B "C:\Program Files\jEdit\jedit.exe" >> %LOGDIR%\jEdit.log 2>&1
start "" /B /min /low "C:\Windows\System32\taskmgr.exe" >> %LOGDIR%\taskmgr.log 2>&1 
REM start "" /B /min /low C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "cd; /usr/bin/startxwin"
REM pause
SET GNUPGHOME=C:\Users\t.richter\.gnupg\
cd "c:\Program Files (x86)\GNU\GnuPG\"
REM start "" /B /min /low "c:\Program Files (x86)\GNU\GnuPG\bin\kleopatra.exe"
REM start "" /B /min /low "C:\Program Files (x86)\Bitrix24\BitrixDesktop.exe" >> %LOGDIR%\bitrix.log 2>&1
REM start "" /B /min /low "C:\Programme\ClickOff\clickoff.exe" >> %LOGDIR%\clickoff.log 2>&1
REM runas /user:I-KMB\t.richter.lad  "C:\Program Files\totalcmd\TOTALCMD64.EXE"
