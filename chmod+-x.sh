#!/bin/sh
if [ -n "$1" ]; then
	MAXDEPTH=$1
else
	MAXDEPTH=1
fi
echo "u+r"
find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+r {} \;
echo "u+w"
find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+w {} \;
echo "files -x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -iregex '.*\.(apk|asc|bak|bash_.*|bashrc|bz2|cfg|crt|crx|csv|dat|db|diff|docx?l|eps|gif|gitconfig|gitignore|gz|html?|ics|ini|inputrc|iso|jpe?g|js|json|kdbx?|lnk|lock|log|mail|map|md|mdb|muttrc|ods|owl|pdf|ped|phe|png|pptx?|profile|project|properties|rdf|reg|rtf|sql|sqlite|tar|tgz|tsv|txt|xlsx?|xml|xpi|xsl|zip)$' -exec chmod -c a-x {} \;
echo "backup -x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*/#.*#$' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*/.*~$' -exec chmod -c a-x {} \;
echo "executable files +x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat|exe|com)' -exec chmod -c g+rx {} \;
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat|exe|com)' -exec chmod -c u+wrx {} \;
echo "directories +x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type d -exec chmod -c g+rx {} \; 
find . -maxdepth $MAXDEPTH -mindepth 1 -type d -exec chmod -c u+rxw {} \; 
