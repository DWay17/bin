#!/bin/sh
if [ -n "$1" ]; then
	MAXDEPTH=$1
else
	MAXDEPTH=1
fi
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -iregex '.*\.(apk|asc|bak|bash_.*|bashrc|bz2|cfg|crt|crx|csv|dat|db|diff|docx?|eps|gif|gitconfig|gitignore|gz|html?|ics|ini|inputrc|iso|jpe?g|js|json|kdbx?|lock|log|mail|md|mdb|muttrc|ods|owl|pdf|png|pptx?|profile|project|properties|rdf|reg|rtf|sql|sqlite|tar|tgz|tsv|txt|xlsx?|xml|xpi|xsl|zip)$' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*/#.*#' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*/.*~' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat)' -exec chmod -c ug+x {} \; 
find . -maxdepth $MAXDEPTH -type d -exec chmod -c ug+x {} \; 
