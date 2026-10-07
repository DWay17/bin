#!/bin/sh
#cleanup_maven_repository.sh

M2_REPO=${HOME}/.m2
#M2_REPO=$M2_REPO/repository/org/apache/camel/camel-core
#M2_REPO=$M2_REPO/repository/org/apache/camel/camel-csv
M2_REPO=$M2_REPO/repository/
KEEP_COUNT=2

for ARTI_FOLDER in `find $M2_REPO -iname '*.jar' -type f | xargs dirname | xargs dirname | sort -u` ; do
	echo $ARTI_FOLDER
	cd $ARTI_FOLDER
	find . -maxdepth 1 -mindepth 1 -type d | sed -Ee 's#^\./##g' | \
		grep -v '\${' | \
		grep -v '[()]' | \
		grep -Ev '\[|\]' | \
		sort -V | tail -n $KEEP_COUNT > dont_dirs.txt
	echo -n 'keep: '
	cat dont_dirs.txt | fmt 
	find . -maxdepth 1 -mindepth 1 -type d | sed -Ee 's#^\./##g' | grep -vf dont_dirs.txt > dirs.txt
	echo -n 'remove : '
	cat dirs.txt | fmt 
	for VERSION in `cat dirs.txt` ; do
		find $VERSION -iname '*.jar' -type f -exec rm -f {} \;
	done
done
