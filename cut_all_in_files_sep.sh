#!/bin/sh

function getSepCnt() {
	sep=$(echo "$2" | sed -E 's/(.)/\1\n/g' | grep -E "$1" | sort | uniq -c | sort -nr | head -n1 | awk '{print $1}')
	echo -n "$sep"
}
sep=$1
shift
for FILE in "$@" ; do
	echo
	echo $FILE
	FILETYPE=$(file "$FILE")
	if [[ $FILETYPE == *"text"* ]]; then
		#echo "filetype is $FILETYPE"
		if [[ $FILETYPE == *"XML"* ]] ; then
		echo "filetype is $FILETYPE"
			echo "skip file"
			continue
		else
			echo "filetype is $FILETYPE"
		fi
	else
		echo "filetype is $FILETYPE"
		echo "skip file"
		continue
	fi
	FILENAME=`basename "$FILE"`
	echo "FILENAME $FILENAME"
	DIRNAME=`dirname "$FILE"`
	echo "DIRNAME $DIRNAME"
	EXT="${FILENAME##*.}"
	echo "EXT $EXT"
	BASENAME=`basename -s "."$EXT "$FILENAME"`
	echo "BASENAME $BASENAME"
	heads=`cat "$FILE" | head -n1`
	echo "heads $heads"
	#sep=$(getSep "$heads")
	echo "sep $sep"
	declare -i sepCnt
	sepCnt=$(getSepCnt "$sep" "$heads")
	#sepCnt=1
	echo "sepCnt $sepCnt"
	sepCnt+=1
	echo "sepCnt $sepCnt"
	echo ""
	for fieldNo in $(seq 1 $sepCnt); do
		echo "fieldNo $fieldNo"
		#fieldName=$(echo "$heads" | cut -d"$sep" -f"$fieldNo")
		#echo "fieldName $fieldName"
		#fieldName=$(echo "$fieldName")
		#echo "fieldName $fieldName"
		NEW_FILE="$BASENAME.$fieldNo.$EXT"
		#echo "NEW_FILE $NEW_FILE"
		#echo "$NEW_FILE" | od -t x1 -c
		NEW_FILE="$(echo $NEW_FILE | sed -Ee 's/[^a-zA-Z0-9 _\.()-]//g')"
		echo "NEW_FILE $NEW_FILE"
		#echo "$NEW_FILE" | od -t x1 -c
		cut -d"$sep" -f"$fieldNo" "$FILENAME" > "$NEW_FILE"
		echo ""
	done
	echo
done

