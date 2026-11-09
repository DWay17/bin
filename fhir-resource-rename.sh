#!/bin/sh
# /cygdrive/c/Users/trichter/bin/fhir-resource-rename.sh
function add2fn () {
	IN="$1"
    echo "add2fn  IN $IN" >&2
	ADD="$2"
    echo "add2fn ADD $ADD" >&2
	ADD2=$(echo "$ADD" | sed -Ee 's#[^A-Za-z0-9._-]#-#g')
	if [[ $IN == *"$ADD"* ]] ; then
		OUT="${IN}";
	else
		OUT="${IN}_${ADD2}"
	fi
    echo "add2fn OUT $OUT" >&2
	echo "$OUT"
}

function rnmr () {
	# echo -ne "rnmr $1\t"
	# FILE="$1"
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
	# echo -ne "$FILETYPE\t"
    if [[ "$FILETYPE" != *"JSON"* ]]; then
        echo "no JSON"
        return 1
    fi
    CNT_RT=$(jq . < "$FILE" | grep '"resourceType"' | wc -l)
    # accept only 1 resourceType
    if [ $CNT_RT -ne 1 ]; then
        # echo "found $CNT_RT resourceTypes in $FILE"
        return 1
    fi
    RTYPE=$(jq -r .resourceType "$FILE")
    # echo "NEWFILENAME $NEWFILENAME"
    NEWFILENAME="${DIRNAME}/${BASENAME}"
    #echo "NEWFILENAME $NEWFILENAME"
    # add RTYPE in not already in NEWFILENAME
	#NEWFILENAME=$(add2fn "$NEWFILENAME" "$RTYPE")
	# echo "NEWFILENAME $NEWFILENAME"
    case "$RTYPE" in
		Task)
            # echo "found resourceType $RTYPE"
            META_PROFILE=$(jq -r .meta.profile[0] "$FILE" | sed -Ee 's#.*\/([^/]+)$#\1#g')
            # echo "META_PROFILE $META_PROFILE"
            # echo "NEWFILENAME $NEWFILENAME"
			NEWFILENAME=$(add2fn "$NEWFILENAME" "$META_PROFILE")
            MESSAGE_NAME=$(jq -r '.input[] | select(.type.coding[].code == "message-name") | .valueString' "$FILE")
            # echo "MESSAGE_NAME $MESSAGE_NAME"
            NEWFILENAME=$(add2fn "$NEWFILENAME" "$MESSAGE_NAME")
			;;
        *)
            echo "unknown resourceType $RTYPE"
            return 1
            ;;
    esac
    mv -v "$FILE" ${DIRNAME}/$NEWFILENAME.$EXT
}

STARTDIR="."
EXTENSION="json"
MAXDEPTH=1

# 
# take file names from 
# * commandline or 
# * pipe and call rnmr for each file 
# * or find files in STARTDIR with EXTENSION and call rnmr for each file
if [ "$#" -gt 0 ] ; then
    for FILE in "$@" ; do
        echo "FILE $FILE"
        rnmr "$FILE"
    done
elif [ ! -t 0 ] ; then
    while IFS= read -r FILE; do
        echo "FILE $FILE"
        rnmr "$FILE"
    done
else
    for FILE in $(find "$STARTDIR" -maxdepth "$MAXDEPTH" -type f -name "*.$EXTENSION" ) ; do
        echo "FILE $FILE"
        rnmr "$FILE"
    done
fi

