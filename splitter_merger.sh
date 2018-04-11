#!/bin/sh

sudo -u tomcat7 find /var/log/fdm/ -mtime +3 -exec rm -fv {} \; 
sudo -u tomcat7 find /var/ -regextype posix-extended -iregex '.*/.*\.(csv|txt|tsv|log)' -daystart -mtime +1 -delete
