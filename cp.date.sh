#!/bin/sh
for fileName in "$@"; do
	if [ -s "$fileName" ]; then
		s1=`ls --full-time "$fileName" | gawk '{print $6 "T" $7}'`
		#echo $s1
		s2=`date -d "$s1" +%Y%m%d%H%M%S`
		#echo $s2
		newName=`echo $fileName | sed -e "s/\.\([^.]*\)$/.$s2.\1/g"`
		#echo $newName
		cp -v "$fileName" "$newName"
		#touch "$fileName"
	else
		echo "doesn't exsist or is empty: "$fileName 
	fi
done
