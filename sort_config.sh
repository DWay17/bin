#!/bin/sh
BASEDIR=/c/Programme/eclipse
FILENAME=config.ini
FILENAME=bundles.info
for FILE in $(find $BASEDIR -iname $FILENAME -type f) ; do
	ls -l $FILE*
	FILENAME=`basename $FILE`
	#echo $FILENAME
	DIRNAME=`dirname $FILE`
	#echo $DIRNAME
	EXT="${FILENAME##*.}"
	#echo $EXT
	BASENAME=`basename -s "."$EXT $FILENAME`
	#echo $BASENAME
	BACKNAME=`mktemp -u -p $DIRNAME --suffix="."$EXT $BASENAME".XXX"`
	#echo $BACKNAME
	cp -v $FILE $BACKNAME
	sort < $BACKNAME > $DIRNAME"/"$FILENAME
	ls -l $DIRNAME/$BASENAME*
	echo ""
done
