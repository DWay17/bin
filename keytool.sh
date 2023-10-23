
keytool -import -alias TeleSec_GlobalRoot_Class_2 -keystore cacerts -trustcacerts -file TeleSec_GlobalRoot_Class_2.cer
keytool -import -alias TeleSec_GlobalRoot_Class_2 -keystore splitter-test.uksh.de.jks -trustcacerts -file TeleSec_GlobalRoot_Class_2.cer
keytool -import -alias dfn-ca-global-g2 -keystore splitter-test.uksh.de.jks -trustcacerts -file cdp1.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert.crt
keytool -import -alias dfn-ca-global-root-g2 -keystore splitter-test.uksh.de.jks -trustcacerts -file cdp1.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert.crt
keytool -import -alias ErnstMoritzArndtUniversitaetGreifswald-G02 -keystore splitter-test.uksh.de.jks -trustcacerts -file ErnstMoritzArndtUniversitaetGreifswald-G02.crt
keytool -importkeystore -srckeystore splitter-test.uksh.de.jks -destkeystore splitter-test.uksh.de.pkcs12 -deststoretype pkcs12                                                                            
keytool -importkeystore -srckeystore splitter-test.uksh.de.jks -destkeystore splitter-test.uksh.de.pem -deststoretype pem
root@splitter-test:/home/trichter# find / -iname '*splitter-test.uksh.de*' -type f -size +0 -exec ls -l {} \; 
-rw-r--r-- 1 root tomcat8 10314 Dec  5  2017 /etc/tomcat8/splitter-test.uksh.de.pkcs12
-rw-r--r-- 1 trichter tomcat8 9522 Dec  5  2017 /etc/tomcat8/splitter-test.uksh.de.jks~
-rw-r--r-- 1 trichter tomcat8 4170 Dec  8  2017 /etc/tomcat8/splitter-test.uksh.de.jks                                                                                                                                               
-rw-r--r-- 1 trichter tomcat8 4537 Nov 28  2017 /etc/tomcat8/splitter-test.uksh.de.pfx
-rw-r--r-- 1 root tomcat8 14719 Dec  5  2017 /etc/tomcat8/splitter-test.uksh.de.pem
-rw-r--r-- 1 root tomcat8 14543 Dec  5  2017 /etc/tomcat8/splitter-test.uksh.de.pem.2
-rw-r--r-- 1 trichter trichter 4170 Dec  8  2017 /home/trichter/splitter-test.uksh.de.jks
-rw-r--r-- 1 trichter trichter 4537 Dec  8  2017 /home/trichter/splitter-test.uksh.de.pfx
keytool -importkeystore -srckeystore "C:\Program Files\Apache Software Foundation\Tomcat 7.0\conf\splitter-test.uksh.de.jks" -destkeystore  "C:\Program Files\Java\jdk1.8.0_172\jre\lib\security\cacerts"
keytool -importkeystore -srckeystore "C:\Program Files\Apache Software Foundation\Tomcat 7.0\conf\splitter-test.uksh.de.jks" -destkeystore  "C:\Program Files\Java\jre1.8.0_172\lib\security\cacerts"
                        
"%JAVA_HOME%\bin"\keytool                                
-deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias cdp1.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert  -trustcacerts -file cdp1.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert.crt  -destkeystore  "C:\Program Files\Java\jdk1.8.0_172\jre\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias cdp1.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert -trustcacerts -file cdp1.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert.crt -destkeystore  "C:\Program Files\Java\jdk1.8.0_172\jre\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias cdp2.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert  -trustcacerts -file cdp2.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert.crt  -destkeystore  "C:\Program Files\Java\jdk1.8.0_172\jre\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias cdp2.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert -trustcacerts -file cdp2.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert.crt -destkeystore  "C:\Program Files\Java\jdk1.8.0_172\jre\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias ErnstMoritzArndtUniversitaetGreifswald-G02          -trustcacerts -file ErnstMoritzArndtUniversitaetGreifswald-G02.crt          -destkeystore  "C:\Program Files\Java\jdk1.8.0_172\jre\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias TeleSec_qualified_Root_CA_1                         -trustcacerts -file TeleSec_qualified_Root_CA_1.crt                         -destkeystore  "C:\Program Files\Java\jdk1.8.0_172\jre\lib\security\cacerts" -deststorepass changeit

"%JAVA_HOME%\bin"\keytool -import -alias cdp1.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert  -trustcacerts -file cdp1.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert.crt  -destkeystore  "C:\Program Files\Java\jre1.8.0_172\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias cdp1.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert -trustcacerts -file cdp1.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert.crt -destkeystore  "C:\Program Files\Java\jre1.8.0_172\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias cdp2.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert  -trustcacerts -file cdp2.pca.dfn.de_dfn-ca-global-g2_pub_cacert_cacert.crt  -destkeystore  "C:\Program Files\Java\jre1.8.0_172\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias cdp2.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert -trustcacerts -file cdp2.pca.dfn.de_global-root-g2-ca_pub_cacert_cacert.crt -destkeystore  "C:\Program Files\Java\jre1.8.0_172\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias ErnstMoritzArndtUniversitaetGreifswald-G02          -trustcacerts -file ErnstMoritzArndtUniversitaetGreifswald-G02.crt          -destkeystore  "C:\Program Files\Java\jre1.8.0_172\lib\security\cacerts" -deststorepass changeit
"%JAVA_HOME%\bin"\keytool -import -alias TeleSec_qualified_Root_CA_1                         -trustcacerts -file TeleSec_qualified_Root_CA_1.crt                         -destkeystore  "C:\Program Files\Java\jre1.8.0_172\lib\security\cacerts" -deststorepass changeit

scp ~/Downloads/splitter.uksh.de.pfx trichter@172.21.98.233:/etc/tomcat8/
scp ~/Downloads/merger.uksh.de.pfx trichter@172.21.98.218:/etc/tomcat8/

scp ~/Downloads/splitter.uksh.de.pfx trichter@172.21.98.233:/home/trichter/
scp ~/Downloads/merger.uksh.de.pfx trichter@172.21.98.218:/home/trichter/

keytool -importkeystore -srckeystore splitter.uksh.de.pfx -srcstoretype pkcs12 -destkeystore splitter.uksh.de.jks -deststoretype JKS
keytool -importkeystore -srckeystore merger.uksh.de.pfx -srcstoretype pkcs12 -destkeystore merger.uksh.de.jks -deststoretype JKS
