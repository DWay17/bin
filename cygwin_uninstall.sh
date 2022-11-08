#!/bin/sh

QUERY=$1
INSTALLED_PACKAGES=`cygcheck --check-setup --dump-only | gawk '{print $1}' | grep -Ei $QUERY | tr '[:space:]' '\n' | sort | uniq`
echo "installed packages:"
echo $INSTALLED_PACKAGES | fmt -w 120 

WIDTH=2048
CMD=`echo $INSTALLED_PACKAGES | fmt -w $WIDTH | head -n1 | sed -Ee 's/ +/,/g' -e 's/, /,/g' -e 's/,$//g' -e 's/^, ?//g' -e 's#^#/c/cygwin64/setup-x86_64 -q -n -N -d -x #g'`
echo $CMD
