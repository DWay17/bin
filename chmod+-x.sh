#!/bin/sh
if [ -n "$1" ]; then
	MAXDEPTH=$1
else
	MAXDEPTH=1
fi
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*\.(asc|csv|ini|kdbx?|log|mail|md|pdf|properties|sql|txt|xlsx?|xml|xsl|zip)' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*/#.*#' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*/.*~' -exec chmod -c a-x {} \; 
find . -maxdepth $MAXDEPTH -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat)' -exec chmod -c ug+x {} \; 
find . -maxdepth $MAXDEPTH -type d -exec chmod -c ug+x {} \; 
