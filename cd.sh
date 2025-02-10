#!/bin/sh
PARAMS="$@"
echo "PARAMS $PARAMS"
if [ -d "$PARAMS" ] ; then
	cd "$PARAMS"
else
	UPATH=$(echo "$PARAMS" | sed -Ee 's#\\#/#g' | xargs cygpath -u | sed -Ee 's#/cygdrive/#/#g' )
	echo "UPATH $UPATH"
	if [ -d "$UPATH" ] ; then
		cd "$UPATH"
	else
		DIRNAME=$(dirname "$UPATH")
		echo "DIRNAME $DIRNAME"
		if [ -d "$DIRNAME" ] ; then
			. cd "$DIRNAME"
		else
			echo "no idea"
		fi
	fi	
fi
