#!/bin/sh
# find /c/ -maxdepth 6 -mindepth 3 -iname .git -type d 2>/dev/null | xargs dirname | grep -Ev '~$|/tmp/|[0-9]{8,16}' | sed -Ee 's/^/cd /g' -e 's/$/ ; git pull/g' | sh
DIRS=$(find /c/ -maxdepth 6 -mindepth 3 -iname .git -type d 2>/dev/null | xargs dirname | grep -Ev '~$|/tmp/|[0-9]{8,16}')
for DIR in $DIRS ; do
	echo
	echo "DIR = $DIR"
	cd $DIR
	for REMOTE in $(git remote) ; do
		CMD="git fetch $REMOTE"
		echo "CMD = $CMD"
		$CMD
	done
	echo
	echo
done