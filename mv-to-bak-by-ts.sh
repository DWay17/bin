#!/bin/sh

TSS=$(/bin/ls -1 *.csv | grep -- '-202.-' | sed -Ee 's/[a-z]-/\n/g' -e 's/\./\n/g' -e 's/-[a-z]/\n/g' | grep -- '202.-' | grep -v pol | sort | uniq)
for TS in $TSS ; do
	#echo "TS: $TS"
	for F in $(find . -maxdepth 1 -iname "*$TS*" -type f ) ; do
		mkdir -vp bak/"$TS"
		#ls -l $F
		# mv without overwrite to bak
		# case on file name
		F=$(basename "$F")
		case $F in
			trpStammCons-*.orbis.csv)
				cp -n -v "$F" bak/"$TS"/
				;;
		    encounters-*.csv)
				cp -n -v "$F" bak/"$TS"/
				;;
			*.csv)
				mv -n -v "$F" bak/"$TS"/
				;;
			*.xlsx)
				cp -n -v "$F" bak/"$TS"/
				;;
			*)
				mv -n -v "$F" bak/"$TS"/
				;;
		esac

	done
done