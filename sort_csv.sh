#!/bin/sh
for file in "."/*.csv ; do
	if [ -f "$file" ]; then
		if ! [[ $file == *.cfg.* ]]; then
			newName=`echo "$file" | sed 's/.csv//g'`"_sorted.csv"
			sort < "$file" > "$newName"
		fi
	fi
done
