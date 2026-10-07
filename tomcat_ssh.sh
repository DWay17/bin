#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/
$JAVA_HOME/bin/keytool -version
$JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA -keypass changeit -storepass changeit -keystore /usr/share/tomcat7/.keystore -dname CN=ukshsysi-dt002 -ext SAN=dns:ukshsysi-dt002.sysi.local,ip:172.21.109.59,dns:localhost,ip:127.0.0.1
