#!/bin/sh
echo "Anzahl $#"
# all at once
for i in "$*" ; do
	echo $i
done
# single args
for i in "$@" ; do
	echo $i
done
