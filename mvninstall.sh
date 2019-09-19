#!/bin/sh
# maven
BASEDIR=$1
for DIR in $(find $BASEDIR -maxdepth 2 -name pom.xml | grep -v target | gawk '!seen[$0]++' | xargs dirname) ; do
	echo $DIR
	cd $DIR
	mvn -s 'C:\Users\t.richter\.m2\settings.xml' install 
done
