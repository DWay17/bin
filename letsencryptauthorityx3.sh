#!/bin/sh
cp -v "$JAVA_HOME/jre/lib/security/cacerts" "$JAVA_HOME/jre/lib/security/cacerts"_`date +%Y-%m-%dT%H.%M.%S`
wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.der
keytool -delete -alias letsencryptauthorityx3 -keystore "$JAVA_HOME/jre/lib/security/cacerts" -storepass changeit
keytool -trustcacerts -keystore "$JAVA_HOME/jre/lib/security/cacerts" -storepass changeit -noprompt -importcert -alias letsencryptauthorityx3 -file lets-encrypt-x3-cross-signed.der
