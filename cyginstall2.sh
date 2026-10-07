#!/bin/sh

UNIQ_PACKAGES_FILE=~/tmp/cygwin_uniq_packages.tmp
INSTALLED_PACKAGES_FILE=~/tmp/cygwin_installed_packages.tmp
INSTALLED_PACKAGES_REGEX_FILE=~/tmp/cygwin_installed_packages_regex.tmp
PACKAGES_TO_INSTALL_FILE=~/tmp/cygwin_install_packages.tmp

#fmt: ungültige Zeilenbreite: „4096“: Numerical result out of range
WIDTH=1024
WIDTH=8192
WIDTH=4096
WIDTH=2048

CMD=`cat $PACKAGES_TO_INSTALL_FILE | fmt -w $WIDTH | head -n1 | sed -Ee 's/ +/,/g' -e 's/, /,/g' -e 's/,$//g' -e 's/^, ?//g' -e 's#^#/c/cygwin64/setup-x86_64 -q -n -N -d -P #g'`
echo $CMD
$CMD
cat $PACKAGES_TO_INSTALL_FILE | fmt -w $WIDTH | head -n1 | tr '[:space:]' '\n' >> $INSTALLED_PACKAGES_FILE
cat $INSTALLED_PACKAGES_FILE | tr '[:space:]' '|' | sed -Ee 's/\|$//g' -e 's/^/\\b(/g' -e 's/$/)\\b/g' > $INSTALLED_PACKAGES_REGEX_FILE
PACKAGES_TO_INSTALL=`cat $UNIQ_PACKAGES_FILE | tr '[:space:]' '\n' | grep -vf $INSTALLED_PACKAGES_FILE`
echo $PACKAGES_TO_INSTALL | tr '[:space:]' '\n' > $PACKAGES_TO_INSTALL_FILE
