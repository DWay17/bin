#!/bin/sh
GRP=$1
echo "GRP $GRP"
FILE=$2
echo "FILE $FILE"
FILENAME=`basename "$FILE"`
echo "FILENAME $FILENAME"
DIRNAME=`dirname "$FILE"`
echo "DIRNAME $DIRNAME"
EXT="${FILENAME##*.}"
echo "EXT $EXT"
BASENAME=`basename -s ".""$EXT" "$FILENAME"`
echo "BASENAME $BASENAME"
GRP_F=$(echo $GRP | sed -Ee 's/[^A-Za-z0-9_.-]/./g')
echo "GRP_F $GRP_F"
NEW_FILE="$BASENAME.-v-$GRP_F.$EXT"
echo "NEW_FILE $NEW_FILE"
grep --text -E -- "$GRP" < "$FILE" > "$NEW_FILE"
