#!/bin/sh

TSS=$(/bin/ls -1 *.csv | grep -- '-202.-' | sed -Ee 's/[a-z]-/\n/g' -e 's/\./\n/g' -e 's/-[a-z]/\n/g' | grep -- '202.-' | grep -v pol | sort | uniq)
for TS in $TSS ; do
	#echo "TS: $TS"
	for F in $(find . -maxdepth 1 -iname "*$TS*" -type f ) ; do
		mkdir -vp bak/"$TS"
		#ls -l $F
		# cp without overwrite to bak
		cp -n -v "$F" bak/"$TS"/
	done
done