c:
cd c:\Programme\TOS\TOS_DI-20141207_1530-V5.6.1\

rem set LANG=en_GB.UTF-8 -nl en_EN in ini
set JAVA_HOME=C:\Program Files\Java\jdk1.7.0_71
set JDK_HOME=C:\Program Files\Java\jdk1.7.0_71
java -version >> TOS_DI_56-win-x86_64.log 2>&1
set PATH=%JAVA_HOME%\bin;%PATH%
java -version >> TOS_DI_56-win-x86_64.log 2>&1
echo %DATE% %TIME% >> TOS_DI_56-win-x86_64.log
start "" /B TOS_DI-win-x86_64.exe >> TOS_DI_56-win-x86_64.log 2>&1
echo %DATE% %TIME% >> TOS_DI_56-win-x86_64.log

