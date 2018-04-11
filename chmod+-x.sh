#!/bin/sh
if [ -n "$1" ]; then
	MAXDEPTH=$1
else
	MAXDEPTH=1
fi
# echo "u+r"
# find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+r {} \;
# echo "u+w"
# find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+w {} \;
echo "u+rw"
find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+rw {} \;
echo "files -x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended \
   -iregex '.*\.(apk|asc|bak|bash_.*|bashrc|bz2|cfg|classpath|conf|config|crt|crx|csv|dat|data|db|diff|docx?l|eps|gpg|gif|gitconfig|gitignore|gz|html?|ics|index|ini|inputrc|iso|java|jpe?g|js|jsp|json|kdbx?|lnk|lock|log|mail|map|md|mf|mdb|mtp|muttrc|ods|owl|pdf|ped|phe|png|pptx?|profile|project|properties|prop|rdf|reg|rtf|sql|sqlite|tar|tgz|tsv|txt|xlsx?|xml|xpi|xsd|xsl|zip)$' \
   -exec chmod -c a-x {} \;
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended \
   -iregex '.*/(config|FETCH_HEAD|HEAD|index|ORIG_HEAD|packed-refs|sourcetreeconfig)$' \
   -exec chmod -c a-x {} \;
echo "backup -x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*/#.*#$' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*/.*~$' -exec chmod -c a-x {} \;
echo "executable files +x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat|exe|com|pl|php)' -exec chmod -c g+rx {} \;
find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat|exe|com|pl|php)' -exec chmod -c u+wrx {} \;
echo "directories +x"
find . -maxdepth $MAXDEPTH -mindepth 1 -type d -exec chmod -c g+rx {} \; 
find . -maxdepth $MAXDEPTH -mindepth 1 -type d -exec chmod -c u+rxw {} \; 
