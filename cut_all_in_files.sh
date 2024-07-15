#!/bin/sh
function getSep() {
	sep=$(echo "$1" | sed -E 's/(.)/\1\n/g' | grep -E '[;,]' | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')
	echo -n "$sep"
}

function getSepCnt() {
	sep=$(echo "$2" | sed -E 's/(.)/\1\n/g' | grep -E "$1" | sort | uniq -c | sort -nr | head -n1 | awk '{print $1}')
	echo -n "$sep"
}

for FILE in "$@" ; do
	echo
	echo $FILE
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
	sep=$(getSep "$heads")
	echo "sep $sep"
	declare -i sepCnt
	sepCnt=$(getSepCnt "$sep" "$heads")
	echo "sepCnt $sepCnt"
	sepCnt+=1
	echo "sepCnt $sepCnt"
	for fieldNo in $(seq 1 $sepCnt); do
		echo "fieldNo $fieldNo"
		fieldName=$(echo "$heads" | cut -d"$sep" -f"$fieldNo")
		echo "fieldName $fieldName"
		NEW_FILE="$BASENAME.$fieldName.$EXT"
		echo "NEW_FILE $NEW_FILE"
		cut -d"$sep" -f"$fieldNo" "$FILENAME" > "$NEW_FILE"
	done
	echo
done

