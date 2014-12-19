set DIR=c:\Programme\Eclipse\eclipse-standard-luna-SR1-win32-x86_64\
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH
java -version
set JAVA_HOME=C:\Program Files\Java\jdk1.7.0_71
set JDK_HOME=C:\Program Files\Java\jdk1.7.0_71
rem set JAVA_HOME=c:\Program Files\Java\jdk1.6.0_45
rem set JDK_HOME=c:\Program Files\Java\jdk1.6.0_45
java -version >> eclipse.log 2>&1
set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> eclipse.log 2>&1
REM set
rem start "" /B eclipse.exe > %TEMP%\eclipse.log
echo %DATE% %TIME% >> eclipse.log
start "" /B eclipse.exe >> eclipse.log 2>&1
echo %DATE% %TIME% >> eclipse.log 
