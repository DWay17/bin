#!/bin/sh
#Thomas_Richter_2019-09-30_medinfo.p12
#-rw-------+ 1 t.richter       Kein  6,8K  1. Okt 09:51  Thomas_Richter_2019-09-30_uksh.p12
echo "medinfo"
openssl pkcs12 -in Thomas_Richter_2019-09-30_medinfo.p12 -clcerts -nokeys -out Thomas_Richter_2019-09-30_medinfo-cert.pem
openssl pkcs12 -in Thomas_Richter_2019-09-30_medinfo.p12 -nocerts -out Thomas_Richter_2019-09-30_medinfo-key.pem           
openssl pkcs12 -export -in Thomas_Richter_2019-09-30_medinfo-cert.pem -inkey Thomas_Richter_2019-09-30_medinfo-key.pem -out Thomas_Richter_2019-09-30_medinfo_new.p12
echo "uksh"
openssl pkcs12 -in Thomas_Richter_2019-09-30_uksh.p12 -clcerts -nokeys -out Thomas_Richter_2019-09-30_uksh-cert.pem
openssl pkcs12 -in Thomas_Richter_2019-09-30_uksh.p12 -nocerts -out Thomas_Richter_2019-09-30_uksh-key.pem           
openssl pkcs12 -export -in Thomas_Richter_2019-09-30_uksh-cert.pem -inkey Thomas_Richter_2019-09-30_uksh-key.pem -out Thomas_Richter_2019-09-30_uksh_new.p12

