REM startupsequence
set LOGDIR="C:\Users\t.richter\logs\"
start "" /B C:\Programme\Capture2Text\Capture2Text.exe >> C:\Programme\Capture2Text\Capture2Text.log 2>&1 
start "" /B c:\Programme\Sizer\sizer.exe >> c:\Programme\Sizer\sizer.log 2>&1
start "" /B "C:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe" >> %LOGDIR%\KeePass.log 2>&1
start "" /B "C:\Program Files\totalcmd\TOTALCMD64.EXE" >> %LOGDIR%\totalcmd.log 2>&1
pskill jEdit
start "" /B "C:\Program Files\jEdit\jedit.exe" >> %LOGDIR%\jEdit.log 2>&1
start "" /B /min /low "C:\Windows\System32\taskmgr.exe" >> %LOGDIR%\taskmgr.log 2>&1 
