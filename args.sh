#!/bin/sh
echo "Anzahl $#"
for i in "$*" ; do
	echo $i
done
for i in "$@" ; do
	echo $i
done
