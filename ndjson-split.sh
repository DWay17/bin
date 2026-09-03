#!/bin/sh
# /cygdrive/c/Users/trichter/bin/ndjson-split.sh

function splitf () {
	FILE="$1"
	echo "FILE $FILE"
	FILENAME=`basename "$FILE"`
	echo "FILENAME $FILENAME"
	DIRNAME=`dirname "$FILE"`
	echo "DIRNAME $DIRNAME"
	EXT="${FILENAME##*.}"
	echo "EXT $EXT"
	BASENAME=`basename -s "."$EXT "$FILENAME"`
	echo "BASENAME $BASENAME"
	# skik if ext != ndjson
	if [ "$EXT" != "ndjson" ] ; then
		echo "skipping $FILE"
		return
	fi
	lineNumbers=$(wc -l "$FILE" | sed -Ee 's# .*##g')
	echo "lineNumbers $lineNumbers"
	len=${#lineNumbers}
	echo "len $len"
	echo split --lines=1 --elide-empty-files --verbose --numeric-suffixes \
	  --additional-suffix=.json --suffix-length=$len "$FILE" "$BASENAME"
	split --lines=1 --elide-empty-files --verbose --numeric-suffixes \
	  --additional-suffix=.json --suffix-length=$len "$FILE" "$DIRNAME/""$BASENAME."
}

if [ -z "$1" ] ; then
	#echo " -z"
	for file in "."/*.ndjson ; do
		splitf "$file"
	done
else
	#echo " ! -z"
	for file in "$@" ; do
		splitf "$file"
	done
fi
