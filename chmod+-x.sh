#!/bin/sh
find . -maxdepth 1 -type f -regextype posix-extended -regex '.*\.(txt|csv|md|sql|zip|pdf|xlsx?|ini|log|xsl|kdbx?|mail)' -exec chmod -c a-x {} \; 
find . -maxdepth 1 -type f -regextype posix-extended -regex '.*/#.*#' -exec chmod -c a-x {} \; 
find . -maxdepth 1 -type f -regextype posix-extended -regex '.*/.*~' -exec chmod -c a-x {} \; 
find . -maxdepth 1 -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat)' -exec chmod -c ug+x {} \; 
find . -maxdepth 1 -type d -exec chmod -c ug+x {} \; 
