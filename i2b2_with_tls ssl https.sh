#!/bin/sh
# i2b2_with_tls ssl https
cd /opt/jboss-as-7.1.1.Final/standalone/configuration
keytool -genkey -alias i2b2 -keyalg RSA -keystore i2b2.keystore -validity 10950

# /var/www/html/webclient ?
