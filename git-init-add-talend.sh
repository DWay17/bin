#!/bin/sh
if [ -d ".git" ]; then
	echo ".git exists"
else
	echo init git
	git init
fi
# setup .gitignore
cat << EOF >> .gitignore
**/system/
**/target/
*.screenshot
/.settings/org.eclipse.core.resources.prefs
/poms/code/routines/
/poms/jobs/process/
/temp
Copy_of_*
EOF
  
mv -v .gitignore .gitignore.bak
sort -u < .gitignore.bak > .gitignore

dirs="businessProcess
code
context
lib
metadata
poms
process
sqlPatterns"

for dir in $dirs; do
	if [ -d $dir ]; then
		git add "$dir/*"
	fi
done

git add .gitignore
git add .project
git add talend.project
