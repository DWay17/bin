#!/bin/sh
# sorts all csv in current dir 
function sortfile(){ 	
	file="$1"
	if [ -f "$file" ]; then
		if ! [[ $file == *.cfg.* ]]; then
			if ! [[ $file == *_sorted.* ]]; then
				newName=`echo "$file" | sed -Ee 's/.(csv|txt)$/_sorted.\1'/g`
				echo "sort $file"
				sort -t, < "$file" > "$newName"
			fi
		fi
	fi
done

if [ -z "$1" ] ; then
	echo " -z"
	for file in "."/*.{csv,txt} ; do
		sortfile "$file"
	done
else
	echo " ! -z"
	for file in "$@" ; do
		sortfile "$file"
	done
fi
