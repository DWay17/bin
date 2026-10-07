#!/bin/sh
IN_FILE=$1
SUFFIX=log
DIR=$(dirname $IN_FILE)
#split --number l/50 --verbose --additional-suffix=.log transmart.log transmart.
cd $DIR
pwd
BASENAME=$(basename $IN_FILE ".$SUFFIX")
#echo $BASENAME
echo split --verbose --numeric-suffixes --additional-suffix ".$SUFFIX" "$BASENAME.$SUFFIX" "$BASENAME."
split --verbose --numeric-suffixes --additional-suffix ".$SUFFIX" "$BASENAME.$SUFFIX" "$BASENAME."
echo $FILE
#ls -l "$DIR/$BASENAME"'*'".$SUFFIX"
echo ls -l "$DIR/$BASENAME"'*'".$SUFFIX" | sh
#ls -l "$BASENAME*$SUFFIX"
#ls -l '$BASENAME*$SUFFIX'
#ls -l "$BASENAME"'*'"$SUFFIX"
