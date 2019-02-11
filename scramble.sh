#!/bin/bash
# (c) Kusalananda

for FILE_IN in "$@" ; do
	echo "$FILE_IN"
	
	COL_COUNT=$( awk -F '\t' '{ print NF; exit }' <"$FILE_IN" )
	
	cp -v "$FILE_IN" "$FILE_IN".orig
	
	#FILE_RESULT=$(mktemp)
	FILE_RESULT="$FILE_IN".res
	#FILE_TMP=$(mktemp)
	FILE_TMP="$FILE_IN".tmp
	
	echo > "$FILE_RESULT"
	echo > "$FILE_TMP"
	
	#trap 'rm -vf "$FILE_RESULT" "$FILE_TMP"' EXIT
	
	for ((i = 1; i <= COL_COUNT; ++i)); do
		cut -f "$i" <"$FILE_IN" |
		{ IFS= read -r header; printf '%s\n' "$header"; shuf; } |
		paste "$FILE_RESULT" - >"$FILE_TMP"
	
		mv "$FILE_TMP" "$FILE_RESULT"
	done
	#sed 's/^[[:blank:]]//' <"$FILE_RESULT"
	sed 's/^[[:blank:]]//' <"$FILE_RESULT" > "$FILE_IN"
	ls -l "$FILE_IN"*
	diff -u "$FILE_IN".orig "$FILE_IN" | cut -b1-120 | head
done
