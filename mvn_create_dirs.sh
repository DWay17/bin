#!/bin/sh
SCOPES="main test"
TYPES="java resources"
for DIR in $(find . -name pom.xml | grep -v target | xargs dirname) ; do
	#./utils/src/main/java/de/cau/med/fdm/utils
	#./utils/src/main/resources
	echo "DIR=$DIR"
	for SCOPE in $SCOPES ; do
		for TYPE in $TYPES ; do
			#echo "SCOPE=$SCOPE"
			#echo "TYPE=$TYPE"
			#echo mkdir -vp "$DIR/src/$SCOPE/$TYPE"
			mkdir -vp "$DIR/src/$SCOPE/$TYPE"
		done
	done
	echo "DIR=$DIR done"
	echo 
done
