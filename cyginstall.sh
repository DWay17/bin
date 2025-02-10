#!/bin/sh
QUERY=$1

UNIQ_PACKAGES_FILE=~/tmp/cygwin_uniq_packages.tmp
INSTALLED_PACKAGES_FILE=~/tmp/cygwin_installed_packages.tmp
INSTALLED_PACKAGES_REGEX_FILE=~/tmp/cygwin_installed_packages_regex.tmp
PACKAGES_TO_INSTALL_FILE=~/tmp/cygwin_install_packages.tmp

echo "query $QUERY"
UNIQ_PACKAGES=`cygcheck -p $QUERY | grep -i $QUERY | grep -v -- -src | grep -Ev -- "-debuginfo|-plugins?-|-devel" | grep -Ev "^(lib|mingw64|cygwin)" | sed -Ee 's/Found [0-9]+ matches for [a-z0-9A-Z -]+//g' -e 's/ - .*//g' -e 's/\+[0-9]{8}//g' -e 's/\+git[0-9a-f]{6,}//g' -e 's/-[0-9.-][a-z]?+(r[0-9]+)?(\+pre[0-9])?$//g' -e 's/-?[0-9]+(\.[0-9]+){1,}$//g' | sort | uniq | tr '[:space:]' '\n'`
echo "uniq packages:"
echo $UNIQ_PACKAGES #| fmt -w 120
echo $UNIQ_PACKAGES | tr '[:space:]' '\n' > $UNIQ_PACKAGES_FILE

INSTALLED_PACKAGES=`cygcheck --check-setup --dump-only | gawk '{print $1}' | grep -i $QUERY | tr '[:space:]' '\n' | sort | uniq`
echo "installed packages:"
echo $INSTALLED_PACKAGES #| fmt -w 120
echo $INSTALLED_PACKAGES | tr '[:space:]' '\n' > $INSTALLED_PACKAGES_FILE
if [ -z "${INSTALLED_PACKAGES}" ]; then
	echo " ... empty ... skip ..."
	echo "" > $INSTALLED_PACKAGES_REGEX_FILE
	PACKAGES_TO_INSTALL="$UNIQ_PACKAGES"
else
	cat $INSTALLED_PACKAGES_FILE | tr '[:space:]' '|' | sed -Ee 's/\|$//g' -e 's/^/\\b(/g' -e 's/$/)\\b/g' > $INSTALLED_PACKAGES_REGEX_FILE
	PACKAGES_TO_INSTALL=`cat $UNIQ_PACKAGES_FILE | tr '[:space:]' '\n' | grep -vf $INSTALLED_PACKAGES_FILE`
fi

echo "packages to install "
echo $PACKAGES_TO_INSTALL #| fmt -w 120
echo $PACKAGES_TO_INSTALL | tr '[:space:]' '\n' > $PACKAGES_TO_INSTALL_FILE


