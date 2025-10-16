#!/bin/sh
function getSep() {
	sep=$(echo "$1" | sed -E 's/(.)/\1\n/g' | grep -E $'[;,|\t]' | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')
	if [ -z $sep ]; then
		sep=$(echo "$1" | sed -E 's/(.)/\1\n/g' | grep -E $'\t' | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')
		if echo "$1" | sed -E 's/(.)/\1\n/g' | grep -E $'\t' | sort | uniq -c | sort -nr | head -n1 | grep $'\t' ; then
			echo -ne "\t"
		else
			echo -n ""
		fi
		echo -n "$sep"
	else
		echo -n "$sep"
	fi
}

function getSepCnt() {
	#echo "\$1 is $1"
	if [ "$1" = "|" ] ; then
		sep="\|"
	else
		sep="$1"
	fi
	sepCnt=$(echo "$2" | sed -E 's/(.)/\1\n/g' | grep -E "$sep" | grep -v "^$"| sort | uniq -c | sort -nr | head -n1 | awk '{print $1}')
	echo -n "$sepCnt"
}

GRP_EXP=$1
shift
echo "GRP_EXP $GRP_EXP"

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
	sep=$(getSep "$heads")
	if [ -z "$sep" ]; then
		echo "sep is '"$sep"'"
		echo "sep not found"
		continue
	else
		echo "sep $sep"
	fi
	declare -i sepCnt
	sepCnt=$(getSepCnt "$sep" "$heads")
	echo "sepCnt $sepCnt"
	sepCnt+=1
	echo "sepCnt $sepCnt"
	echo ""
	for fieldNo in $(seq 1 $sepCnt); do
		echo "fieldNo $fieldNo"
		fieldName=$(echo "$heads" | cut -d"$sep" -f"$fieldNo")
		#echo "fieldName $fieldName"
		fieldName=$(echo "$fieldName")
		echo "fieldName $fieldName"
		echo "$fieldName" | grep -iE -- "$GRP_EXP"
		if [ $? -eq 0 ] ; then
			echo "$fieldName matches $GRP_EXP"
			true
		else 
			echo "$fieldName doesn't matches $GRP_EXP"
			continue
		fi
		NEW_FILE="$BASENAME.$fieldName.$EXT"
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

