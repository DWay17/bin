#!/bin/sh
#zipinfo ojdbc14-9i.jar | cut -b38-52 | uniq2 | grep : | grep -- - | grep -vE -- '-2[0-9] ' | sed -E -e 's/$/:00"/g' -e 's/^/"/g' | xargs -n1 date "+%Y-%m-%d %H:%M:%S" -d | sort -n | tail -n1
export LANG=C 
for file in `find . -maxdepth 1 -iregex '.*\.\(zip\|jar\)$' -type f -size +0` ; do
	ls -l $file
	#newdate=`zipinfo $file | cut -b38-52 | uniq2 | grep : | grep -- - | grep -vE -- '-2[0-9] ' | grep -vE -- '-3[0-9] ' | sed -E -e 's/$/:00"/g' -e 's/^/"/g' | xargs -n1 date "+%Y-%m-%d %H:%M:%S" -d | sort -n | tail -n1`
	newdate=`date -d '1970-01-01 00:00:00'`
	echo "$newdate"
	for adate in `zipinfo $file | cut -b38-52 | uniq2 | grep : | grep -- - | cut -d' ' -f1`; do
		echo "newdate=$newdate"
		echo -ne "adate=$adate\t"
		if [[ `date +%Y%m%d%H%M%S -d "$adate"` -lt `date +%Y%m%d%H%M%S` ]] ; then
			echo "past"
			if [[ `date +%Y%m%d%H%M%S -d "$adate"` -gt `date +%Y%m%d%H%M%S -d "$newdate"` ]] ; then
				newdate=$adate
				#echo "$newdate"
			fi
		else
			echo "future"
			true
		fi
		#echo -e '\n\n'
	done
	echo "$newdate"
	touch -d "$newdate" $file
	#echo -e '\n\n\n'
done
