#!/bin/bash
## head in a files
function headinfile(){
	echo
	FILE="$1"
	echo $FILE
	FILENAME=`basename "$FILE"`
	echo "FILENAME $FILENAME"
	DIRNAME=`dirname "$FILE"`
	echo "DIRNAME $DIRNAME"
	EXT="${FILENAME##*.}"
	echo "EXT $EXT"
	BASENAME=`basename -s "."$EXT "$FILENAME"`
	echo "BASENAME $BASENAME"
	NEW_FILE="$BASENAME.head-n$lines.$EXT"
	echo "NEW_FILE $NEW_FILE"
	head -n$lines  "$FILENAME" > "$NEW_FILE"
	echo	
}

declare -i lines
lines=$1
if [ $lines -gt 0 ] ; then
	echo "head lines $lines"
	shift 1	
else
	echo
	echo "1st arg must be an number gt 0"
	exit 1
fi

echo "\$1 is $1"

if [ -z $1 ] ; then
	echo " -z"
	for file in "."/*.{csv} ; do
		headinfile "$file"
	done
else
	echo " ! -z"
	for file in "$@" ; do
		headinfile "$file"
	done
fi
