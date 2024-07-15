#!/bin/sh
INAME='*.xsd'
for f in $(find . -iname $INAME -type f) ; do
	echo -n "found $f -> "
	target=$(echo "$f" | sed -Ee 's#^\./##g' -e 's#(.*)/(.*)\.xsd#\2.\1.xsd#g' -e 's#/#_e#g')
	ln -vs "$f" "$target"
	echo "$target"
done