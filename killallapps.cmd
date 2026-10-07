REM title Kill all running apps
cd c:\windows\System32
REM for /f "skip=3 tokens=1" %%i in ('TASKLIST /FI "USERNAME eq %userdomain%\%username%" /FI "STATUS eq running"') do (
for /f "skip=3 tokens=1" %%i in ('TASKLIST /FI "STATUS eq running"') do (
	if not "%%i"=="svchost.exe" (
		if not "%%i"=="explorer.exe" (
			if not "%%i"=="cmd.exe" (
				if not "%%i"=="tasklist.exe" (
					echo.
					taskkill /f /im "%%i" 
					taskkill /f /im explorer.exe
					echo.
				)
			)
		)
	)
)
pause
