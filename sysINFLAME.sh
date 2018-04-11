#!/bin/sh
APPS="splitter merger"
for APP in $APPS ; do
	BDIR=/c/var/spool/$APP
	cd $BDIR
	mkdir -vp ./PopGenPatientList/PopGenDB/
	mkdir -vp ./p2n/i2b2/
	
	FN=$APP.properties
	dirs=".
	./PopGenPatientList/
	./PopGenPatientList/PopGenDB
	./p2n/
	./p2n/i2b2/
	"
	for dir in $dirs ; do
		cd $BDIR
		cd $dir
		if [[ -f $FN ]] ; then
			cp $FN $FN.bak
			(pwd | sed -e 's/^/# /g'; cat $FN.bak ) | sed -e 'sx# /c/x# /xg' | uniq2 > $FN
		else
			pwd | sed -e 's/^/# /g' -e 'sx# /c/x# /xg' > $FN
			echo >> $FN
		fi
	done
done
