#!/bin/sh
if [ -d ".git" ]; then
	echo ".git exists"
else
	echo init git
	git init
fi
# setup .gitignore
echo "*.screenshot" >> .gitignore
echo "/.settings/org.eclipse.core.resources.prefs" >> .gitignore
echo "/code/routines/system/" >> .gitignore
echo "/sqlPatterns/" >> .gitignore
echo "/temp" >> .gitignore
echo "Copy_of_*" >> .gitignore
sort -u < .gitignore > .gitignore

dirs="businessProcess
code
context
metadata
process
lib"

for dir in $dirs; do
	if [ -d $dir ]; then
		git add "$dir/*"
	fi
done
