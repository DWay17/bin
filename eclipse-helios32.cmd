set DIR=c:\Programme\eclipse\eclipse-rcp-helios-SR2-win32\
set LOG_FILE=eclipse-helios32.log
c:
cd "%DIR%"
set LANG=en_GB.UTF-8
set NLS_LANG=ENGLISH
java -version
set JAVA_HOME=c:Program Files (x86)Javajdk1.7.0_71\
set JDK_HOME=c:Program Files (x86)Javajdk1.7.0_71\
java -version >> %LOG_FILE% 2>&1
set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> %LOG_FILE%
start "" /B eclipse.exe >> %LOG_FILE% 2>&1
echo %DATE% %TIME% >> %LOG_FILE% 
