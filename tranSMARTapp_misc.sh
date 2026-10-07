#!/bin/sh
"C:\Program Files\Java\jdk1.7.0_79\bin\java.exe" 
	"-Dgrails.home=C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\\" 
	"-Dtools.jar=C:\Program Files\Java\jdk1.7.0_79\lib\tools.jar"
	-Dgroovy.starter.conf=C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\/conf/groovy-starter.conf
	-Xmx2g
	-XX:MaxPermSize=256m
	-XX:PermSize=256m
	-Djline.WindowsTerminal.directConsole=false
	-javaagent:C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.springframework\springloaded\jars\springloaded-1.2.0.RELEASE.jar
	-noverify
	-Dspringloaded=profile=grails;cacheDir=.
	-Dbase.dir=C:\Users\t.richter\git\sysINFLAME\transmartApp
	-Dgrails.project.fork.run.debugArgs
	-Dfile.encoding=UTF-8
	-classpath
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.codehaus.groovy\groovy-all\jars\groovy-all-2.1.9.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\dist\grails-bootstrap-2.3.11.jar org.codehaus.groovy.grails.cli.support.GrailsStarter
	--main org.codehaus.groovy.grails.cli.GrailsScriptRunner
	--conf C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\/conf/groovy-starter.conf "run-app
	-plain-output"

java
	-Dfile.encoding=UTF-8
	-Xmx4096M
	-Xms1536M
	-XX:MaxPermSize=384m
	-Dgrails.fork.parent.process.port=9192
	-Dgrails.fork.active=true
	-Dgrails.build.execution.context=C:\Users\t.richter\AppData\Local\Temp\transmartApp1436355960989932361grails-execution-context
	-cp "
		C:\Program Files\Java\jdk1.7.0_79\lib\tools.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.codehaus.groovy\groovy-all\jars\groovy-all-2.1.9.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.slf4j\jcl-over-slf4j\jars\jcl-over-slf4j-1.7.5.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.codehaus.gant\gant_groovy1.8\jars\gant_groovy1.8-1.9.6.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.apache.tomcat.embed\tomcat-embed-logging-log4j\jars\tomcat-embed-logging-log4j-7.0.50.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\dist\grails-plugin-log4j-2.3.11.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\log4j\log4j\jars\log4j-1.2.17.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\dist\grails-bootstrap-2.3.11.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.slf4j\slf4j-api\jars\slf4j-api-1.7.5.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\jline\jline\jars\jline-2.12.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.apache.ant\ant\jars\ant-1.8.4.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.apache.ant\ant-launcher\jars\ant-launcher-1.8.4.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.apache.ant\ant-trax\jars\ant-trax-1.7.1.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.apache.ant\ant-junit\jars\ant-junit-1.8.4.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.apache.ivy\ivy\jars\ivy-2.3.0.jar;
		C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.fusesource.jansi\jansi\jars\jansi-1.11.jar;
		C:\Users\t.richter\.grails\2.3.11\projects\transmart\plugins\tomcat-7.0.54\grails-plugin-tomcat-7.0.54.jar;
		C:\Users\t.richter\.m2\repository\org\apache\tomcat\embed\tomcat-embed-logging-log4j\7.0.53\tomcat-embed-logging-log4j-7.0.53.jar;
		C:\Users\t.richter\.m2\repository\org\apache\tomcat\embed\tomcat-embed-websocket\7.0.53\tomcat-embed-websocket-7.0.53.jar;
		C:\Users\t.richter\.m2\repository\org\apache\tomcat\embed\tomcat-embed-el\7.0.53\tomcat-embed-el-7.0.53.jar;
		C:\Users\t.richter\.m2\repository\org\apache\tomcat\tomcat-catalina-ant\7.0.53\tomcat-catalina-ant-7.0.53.jar;
		C:\Users\t.richter\.m2\repository\org\apache\tomcat\embed\tomcat-embed-core\7.0.53\tomcat-embed-core-7.0.53.jar;
		C:\Users\t.richter\.m2\repository\org\eclipse\jdt\core\compiler\ecj\3.7.2\ecj-3.7.2.jar;
		C:\Users\t.richter\.m2\repository\org\apache\tomcat\embed\tomcat-embed-jasper\7.0.53\tomcat-embed-jasper-7.0.53.jar;
		"
	-Dgrails.home=C:\Users\t.richter\.sdkman\candidates\grails\2.3.11
	-javaagent:C:\Users\t.richter\.sdkman\candidates\grails\2.3.11\lib\org.springframework\springloaded\jars\springloaded-1.2.0.RELEASE.jar
	-noverify
	-Dspringloaded.synchronize=true
	-Djdk.reflect.allowGetCallerClass=true
	-Dspringloaded=profile=grails;cacheDir=C:\Users\t.richter\.grails\2.3.11 org.grails.plugins.tomcat.fork.ForkedTomcatServer
