#!/bin/sh
#find "$1" -type f | sed -e 's#.*/##g' -e 's/.*?\.\(\([^.\s]{1,4}\.\)?[^.\s]+\)$/\1/' | grep -v '~.*~$' | grep -v '~$' | sort | uniq -c | sort -nr 
find "$1" -type f | sed -e 's#.*/##g' | perl -pe 's/.*?\.(([^.\s]{1,4}\.)?[^.\s]+)$/\1/' | grep -v '~.*~$' | grep -v '~$' | sort | uniq -c | sort -nr
