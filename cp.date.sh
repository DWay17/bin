#!/bin/sh
function dosmtg() {
	FILE="$1"
	echo "FILE $FILE"
	FILE="${FILE%/}"
	echo "FILE $FILE"
	FILENAME=`basename "$FILE"`
	echo "FILENAME $FILENAME"
	DIRNAME=`dirname "$FILE"`
	echo "DIRNAME $DIRNAME"
	EXT="${FILE##*.}"
	echo "EXT $EXT"
	BASENAME=`basename -s "."$EXT "$FILE"`
	echo "BASENAME $BASENAME"
	if [ -f "$FILE" ]; then
		s1=`ls -d --full-time -- "$FILE" | gawk '{print $6 "T" $7}'`
		#echo $s1
		s2=`date -d "$s1" +%Y%m%d%H%M%S`
		#echo $s2
		newName=`echo $FILENAME | sed -e "s/\.\([^.]*\)$/.$s2.\1/g"`
		#echo $newName
		cp -v "$FILE" "$newName"
		#touch "$FILE"
	elif [ -d "$FILE" ] ; then
		s1=`ls -d --full-time -- "$FILE" | gawk '{print $6 "T" $7}'`
		#echo $s1
		s2=`date -d "$s1" +%Y%m%d%H%M%S`
		#echo $s2
		# newName=$(`echo $FILE | sed -Ee "s#\.([^.]*)/?$#.$s2.\1#g"`)
		newName="$DIRNAME/$BASENAME.$s2.$EXT"
		echo $newName
		if [ -d "$newName" ] ; then
			echo "dir exists"
		else 
			cp -rv "$FILE" "$newName"
		fi
		#touch "$FILE"
	else
		echo "doesn't exist: "$FILE 
	fi
}

STARTDIR="."
MAXDEPTH=0
EXTENSION="xxx"

# take file names from 
# * commandline or 
# * pipe and call for each file 
# * or find files in STARTDIR with EXTENSION and call for each file
if [ "$#" -gt 0 ] ; then
    for FILE in "$@" ; do
        # echo "FILE $FILE"
        dosmtg "$FILE"
    done
elif [ ! -t 0 ] ; then
    while IFS= read -r FILE; do
        # echo "FILE $FILE"
        dosmtg "$FILE"
    done
else
    for FILE in $(find "$STARTDIR" -maxdepth "$MAXDEPTH" -type f -name "*.$EXTENSION" ) ; do
        # echo "FILE $FILE"
        dosmtg "$FILE"
    done
fi
