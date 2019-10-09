#!/bin/sh
# filedescript.ion.sh
main() {
	file * | sed -e 's/: \{1,\}/" /g' \
	-e 's/^/"/g' \
	-e 's/, with very /, /g' \
	-e 's/, with \(\w\{2,4\}\) line terminators/, \1/g' \
	-e 's/text$/test, LF/g' \
	-e 's/text, long lines$/text, long lines, LF/g' \
	-e 's/$/;/g' \
	| sort > descript.ion.tmp
	touch descript.ion
	dos2unix descript.ion
	cp -v descript.ion descript.ion.bak
	#mv -v descript.ion descript.ion.old
	cat descript.ion | sed -Ee 's/^([^"].+) (.*)/\"\1\" \2/g' -e 's/""/"/g' | sort > descript.ion.old
	echo "start join"
	join -a 1 -a 2 descript.ion.old descript.ion.tmp > descript.ion.new
	echo "done join"
	echo "start rm dupl"
	sed -Ee 's/\b(.+)[ ,$]\1/\1/g' < descript.ion.new > descript.ion
	echo "done rm dupl"
	unix2dos descript.ion
}
OLD_IFS="$IFS"
IFS=$'\n'
if [ -n "$1" ]; then
	for DIR in $@ ; do
		pushd "$DIR"
		if [ $? -eq 0 ] ; then
			echo -n "do "
			pwd
			main
			popd
		else
			echo -n "else "
		fi
	done
else
	main
fi
exit 0
IFS=$OLD_IFS
