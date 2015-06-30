set DIR=%PROGRAMFILESMY%\squirrel\squirrel-sql-3.6\
c:
cd "%DIR%"
set LOG_FILE=squirrel-sql.log
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B squirrel-sql.bat >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%"
