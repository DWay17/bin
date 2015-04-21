#!/bin/sh
# filedescript.ion.sh
file * | sed -e 's/: \{1,\}/ /g' \
	-e 's/, with very /, /g' \
	-e 's/, with \(\w\{2,4\}\) line terminators/, \1/g' \
	-e 's/text$/test, LF/g' \
	-e 's/text, long lines$/text, long lines, LF/g' \
	-e 's/$/;/g' \
	>> descript.ion
unix2dos descript.ion
