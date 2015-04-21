#!/bin/sh
#misc.sh
iconv -f "windows-1252" -t "UTF-8" labs_final_new.csv > labs_final_new_utf8.csv
mkdir -p 'w:\Freigegebene Dokumente\Projekte\CP1-AP\'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP01'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP02'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP03'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP04'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP05'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP06'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP07'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP08'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP09'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP10'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP01'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP01'
mkdir -p 'w:\Freigegebene Dokumente\Projekte\Projektfortschritt'
mkdir -p 'w:\Freigegebene Dokumente\Dokumente\Berichte'
mkdir -p 'w:\Freigegebene Dokumente\Dokumente\Protokolle'
mkdir -p 'w:\Freigegebene Dokumente\Dokumente\Vorlagen'
perl -MCPAN -e shell
grep :: < ~/cpan.log | sort -u | tr ' "();,*./$&_^?' '\n' | tr "\'" '\n' | sed -s 's/^-M//g' | grep :: | grep -v ^main:: | grep -v ::[a-i] | sort -u | fmt | sed 's/^/install /g'
# repeated command execution
watch -n 7 -d 
find . -perm /u+x -maxdepth 1 -type f -exec ls -1 {} \; | grep "\." | sed -e 's#\./###g' | grep "\." | sed -e 's/.*\.//g' | sort | niq -c | sort -nr
 
