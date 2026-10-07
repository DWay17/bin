set DIR=%PROGRAMFILESMY%\sqldeveloper\sqldeveloper-4.0.2.15.21\
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH
java -version
set JAVA_HOME=C:\Program Files\Java\jdk1.7.0_71
set JDK_HOME=C:\Program Files\Java\jdk1.7.0_71
set LOG_FILE=sqldeveloper.log
java -version >> "%LOG_FILE%" 2>&1
set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> "%LOG_FILE%" 2>&1
REM set
rem start "" /B sqldeveloper.exe > %TEMP%\sqldeveloper.log
echo %DATE% %TIME% >> "%LOG_FILE%"
start "" /B sqldeveloper.exe >> "%LOG_FILE%" 2>&1
echo %DATE% %TIME% >> "%LOG_FILE%" 
