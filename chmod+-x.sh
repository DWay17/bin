#!/bin/sh
if [ -n "$1" ]; then
	MAXDEPTH=$1
else
	MAXDEPTH=1
fi
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*\.(asc|bak|cfg|csv|dat|db|ini|js|json|kdbx?|lock|log|mail|md|pdf|properties|rdf|sql|sqlite|txt|xlsx?|xml|xsl|xpi|zip|gitignore|project|TXT|MDB|CSV)' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*/#.*#' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*/.*~' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat)' -exec chmod -c ug+x {} \; 
find . -maxdepth $MAXDEPTH -type d -exec chmod -c ug+x {} \; 
