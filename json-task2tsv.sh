#!/usr/bin/env sh
for F in $(ls -1 Task_*-*-*.json) ; do
#	ls -l $F
	BN=$(basename $F .json)
	echo "check $BN"
	ls -1 $BN*
	cnt=$(ls -1 $BN* | wc -l)
	echo "found $cnt"
	if [ $cnt -eq 2 ] ; then
		echo "skip"
	else
		json-task2tsv.jq < "$BN.json" > "$BN.tsv"
		touch -r "$F" "$BN.tsv"
		ls -1 $BN*
	fi
	echo
done
