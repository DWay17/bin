#!/bin/sh
# /cygdrive/c/Users/trichter/bin/ndjson-split.sh

#function splitf() { # not POSIX
splitf() {
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
	  --additional-suffix=.json --suffix-length=$len "$FILE" "$DIRNAME/""$BASENAME."
	split --lines=1 --elide-empty-files --verbose --numeric-suffixes \
	  --additional-suffix=.json --suffix-length=$len "$FILE" "$DIRNAME/""$BASENAME."
}

STARTDIR="."
EXTENSION="ndjson"
MAXDEPTH=1

# 
# take file names from 
# * commandline or 
# * pipe and call for each file 
# * or find files in STARTDIR with EXTENSION and call for each file
if [ "$#" -gt 0 ] ; then
    for FILE in "$@" ; do
        echo "FILE $FILE"
        splitf "$FILE"
    done
elif [ ! -t 0 ] ; then
    while IFS= read -r FILE; do
        echo "FILE $FILE"
        splitf "$FILE"
    done
else
    for FILE in $(find "$STARTDIR" -maxdepth "$MAXDEPTH" -type f -name "*.$EXTENSION" ) ; do
        echo "FILE $FILE"
        splitf "$FILE"
    done
fi
