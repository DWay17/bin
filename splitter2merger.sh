#!/bin/sh

for fromdir in `find /c/var/ -maxdepth 4 -mindepth 4 -iregex .*merger.*_exchange.* -type d` ; do
	echo -n "fromdir=" ; ls -d $fromdir
	todir=`echo $fromdir | sed -e 's#/merger_#/splitter_#g'`
	echo -n "todir=" ; ls -d $todir
	for file in `find $fromdir -maxdepth 1 -regextype posix-extended -iregex '.*/.*\.(csv|txt|tsv|log)' -type f ` ; do
		ls -l $file
		mv -v $file $todir | sed -e 's# -> # -> \n#g'
	done
	echo
done
