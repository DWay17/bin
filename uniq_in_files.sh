#!/bin/sh
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
	NEW_FILE="$BASENAME.uniq.$EXT"
	echo "NEW_FILE $NEW_FILE"
	cat "$FILENAME" | awk '!seen[$0]++' > "$NEW_FILE"
	echo
done

