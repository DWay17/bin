#!/bin/sh
# sorts all csv in current dir 
for file in "."/*.{csv,txt} ; do
	if [ -f "$file" ]; then
		if ! [[ $file == *.cfg.* ]]; then
			newName=`echo "$file" | sed 's/.csv//g'`"_sorted.csv"
			echo "sort $file"
			sort -t, < "$file" > "$newName"
		fi
	fi
done
