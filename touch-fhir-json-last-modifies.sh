#!/bin/sh
# touch-json-last-modifies.sh

function tch {
    FILE="$1"
    echo -ne "func touch for FILE $FILE\t"
    # check for file
    if [ ! -f "$FILE" ]; then
        echo "skipping $FILE (not a file)"
        return 1
    fi
    TYPE=$(file "$FILE")
    if [[ "$TYPE" != *"JSON"* ]]; then
        echo "skipping file $FILE (not JSON -> $TYPE)"
        return 1
    fi
    # count lastUpdated authoredOn print hits and skip if more then 1 hit each 
    CNT_LU=$(jq . $FILE | grep lastUpdated | wc -l)
    CNT_AO=$(jq . $FILE | grep authoredOn | wc -l)
    echo -ne "CNT_LU $CNT_LU CNT_AO $CNT_AO\t"
    if [ $CNT_LU -gt 1 ]; then
        echo "more then 1 lastUpdated found in $FILE"
        return 1
    fi
    if [ $CNT_AO -gt 1 ]; then
        echo "more then 1 authoredOn found in $FILE"
        return 1
    fi
    # get timestamp from meta.lastUpdated or if not exists from meta.authoredOn
    if [ $CNT_LU -eq 1 ]; then
        TS=$(jq -r .meta.lastUpdated $FILE )
    elif [ $CNT_AO -eq 1 ]; then
        TS=$(jq -r .meta.authoredOn $FILE)
    else
        echo "no lastUpdated or authoredOn found in $FILE"
        return 1
    fi
    # echo "touching $FILE with timestamp $TS"
    echo "use timestamp $TS"
    touch -d "$TS" "$FILE" 
    # ls -l "$FILE"
}

STARTDIR="."
EXTENSION="json"
MAXDEPTH=1

# 
# take file names from 
# * commandline or 
# * pipe and call for each file 
# * or find files in STARTDIR with EXTENSION and call for each file
if [ "$#" -gt 0 ] ; then
    for FILE in "$@" ; do
        echo "FILE $FILE"
        tch "$FILE"
    done
elif [ ! -t 0 ] ; then
    while IFS= read -r FILE; do
        echo "FILE $FILE"
        tch "$FILE"
    done
else
    for FILE in $(find "$STARTDIR" -maxdepth "$MAXDEPTH" -type f -name "*.$EXTENSION" ) ; do
        echo "FILE $FILE"
        tch "$FILE"
    done
fi

