#!/bin/sh
for fileName in "$@"; do
	echo -en "$fileName:\t" | tr ' ' '_'
	needle="\t"
	var=`head -n1 "$fileName"`
	#num=$(grep -o "$needle" <<< "$var" | wc -l)
	num=$(echo "$var" | tr -cd '\t' | wc -m)
	echo -en "$num\n"
	#echo $var
done
