#!/bin/sh
#/bin/ls -1 Task_*.json | grep -vE '[0-9]{12,}' | grep -Ev 'anon|_test_' | grep -E '[0-9a-f]{12}' 
# | xargs grep -H lastUpdated | sed -Ee 's/(Task_.*\.json)/mv -v \1 \1/g' 
# -e 's/.json:.*"lastUpdated": "/./g' -e 's#,.*##g' -e 's/\.[0-9+:.,",]+$/.json/g' 
# -e 's/([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})/\1\2\3\4\5\6/g' | sh

function insTS() {
    for FILE in "$@" ; do
    	echo "process FILE $FILE"
        # skip if match timestamp already
        if echo "$FILE" | grep -E '([0-9-]{8,10}T[0-9:.]{6,9})|[0-9]{12,14}' > /dev/null ; then
            echo "File $FILE already has timestamp, skipping."
            continue
        fi
        LAST_UPDATED_O=$(grep -E '"lastUpdated" ?: ?"[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}' "$FILE" | \
          sed -Ee 's/.*"lastUpdated": ?"([^"]+)".*/\1/g')
        echo "LAST_UPDATED_O ("${#LAST_UPDATED_O}"):$LAST_UPDATED_O"
		EFFECTIVE_DATE_TIME_O=$(grep -E '"effectiveDateTime" ?: ?"[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}' "$FILE" | \
          sed -Ee 's/.*"lastUpdated": ?"([^"]+)".*/\1/g')
        echo "EFFECTIVE_DATE_TIME_O ("${#EFFECTIVE_DATE_TIME_O}"):$EFFECTIVE_DATE_TIME_O" 
        LAST_UPDATED=$(echo $LAST_UPDATED_O | sed -Ee 's#([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2}).*#\1\2\3\4\5\6#g')
        EFFECTIVE_DATE_TIME=$(echo $EFFECTIVE_DATE_TIME_O | sed -Ee 's#.*([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2}).*#\1\2\3\4\5\6#g')
        echo "LAST_UPDATED ("${#LAST_UPDATED}"):$LAST_UPDATED"
        echo "EFFECTIVE_DATE_TIME ("${#EFFECTIVE_DATE_TIME}"):$EFFECTIVE_DATE_TIME"
        DATE=""
        # use LAST_UPDATED or EFFECTIVE_DATE_TIME if possible
        if [ ${#LAST_UPDATED} -gt 0 ] ; then
            DATE=$LAST_UPDATED
        elif [ ${#EFFECTIVE_DATE_TIME} -gt 0 ] ; then
            DATE=$EFFECTIVE_DATE_TIME
        fi
        echo "DATE ("${#DATE}"):$DATE"
        # skipp if length > 29
        if [ ${#DATE} -gt 29 ] ; then
            echo "Extracted timestamp \"$DATE\" is too long, skipping."
            continue
        fi
        if [ -n "$DATE" ] ; then
            NEW_FILE=$(echo $FILE | sed -Ee "s/(.*)\.json/\1_${DATE//[:\-T]/}.json/g")
            if [ "$FILE" != "$NEW_FILE" ] ; then
            	echo "Renaming $FILE to $NEW_FILE"
            	mv -v "$FILE" "$NEW_FILE"
            fi
		else
            	echo "No date found in $FILE, skipping."
        fi
        echo ""
    done
}

# use either file from command line of find them
if [ "$#" -gt 0 ] ; then
    insTS "$@"
else
    #find . -maxdepth 1 -type f -name 'Task_*.json' | grep -vE '[0-9]{12,}' | grep -Ev 'anon|_test_' | grep -E '[0-9a-f]{12}' 
    for FILE in $(ls -1 *.json | grep -vE '[0-9]{12,}') ; do
        insTS "$FILE"
    done
fi
