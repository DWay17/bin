#!/bin/sh
# /cygdrive/c/Users/trichter/bin/fhir-bundle-split.sh

function splt() {
	echo -ne "splt $1\t"
	FILE="$1"
	if [ ! -f "$1" ] ; then
		echo " no file"
		return 1
	fi
	FILENAME=`basename "$FILE"`
	# echo "FILENAME $FILENAME"
	DIRNAME=`dirname "$FILE"`
	# echo "DIRNAME $DIRNAME"
	EXT="${FILENAME##*.}"
	# echo "EXT $EXT"
	BASENAME=`basename -s "."$EXT "$FILENAME"`
	# echo "BASENAME $BASENAME"
	# return 1 if no file
	FILETYPE=$(file -b -- "$FILE")
	echo -ne "$FILETYPE\t"
	# grep for bundle
    if ! grep -Eiq '"resourceType": ?"Bundle"' "$FILE" ; then
		echo "no bundle"
    	return 1
    fi
	echo "found bundle"
	# split bundle into files
	jq -c '.entry[] | .resource' "$FILE" | while read -r RESOURCE ; do
		# get resourceType and id
		RTYPE=$(echo "$RESOURCE" | jq -r .resourceType)
		RID=$(echo "$RESOURCE" | jq -r .id)
		# create filename
		FNAME="${DIRNAME}/${BASENAME}_${RTYPE}_${RID}.json"
		echo "writing $FNAME"
		echo "$RESOURCE" > "$FNAME"
    	echo
	    # echo
	done
	echo
}

STARTDIR="."
EXTENSION="json"
MAXDEPTH=1

# 
# take file names from 
# * commandline or 
# * pipe and call splt for each file 
# * or find files in STARTDIR with EXTENSION and call splt for each file
if [ "$#" -gt 0 ] ; then
    for FILE in "$@" ; do
        echo "FILE $FILE"
        splt "$FILE"
    done
elif [ ! -t 0 ] ; then
    while IFS= read -r FILE; do
        echo "FILE $FILE"
        splt "$FILE"
    done
else
    for FILE in $(find "$STARTDIR" -maxdepth "$MAXDEPTH" -type f -name "*.$EXTENSION" ) ; do
        echo "FILE $FILE"
        splt "$FILE"
    done
fi

