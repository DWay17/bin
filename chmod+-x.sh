#!/bin/sh
find . -type f -regextype posix-extended -regex '.*\.(txt|csv|md)' -exec chmod -c a-x {} \; 
find . -type f -regextype posix-extended -regex '.*/#.*#' -exec chmod -c a-x {} \; 
find . -type f -regextype posix-extended -regex '.*/.*~' -exec chmod -c a-x {} \; 
find . -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat)' -exec chmod -c ug+x {} \; 
find . -type d -exec chmod -c ug+x {} \; 
