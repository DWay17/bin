#!/bin/sh
PRG=$1
CYGWIN=winsymlinks:lnk
PRGS=/c/Programme/
LNK_P=/c/Users/t.richter/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs
echo "searching for $PRG"
CANDS=`find $PRGS -maxdepth 2 -iname "*$PRG*" -type d`
echo "found candidates: $CANDS"
for CAND in $CANDS ; do
	echo "checking cand $CAND"
	BASENAME=$(basename $CAND)
	echo "basename $BASENAME"
	echo "search in $LNK_P for $BASENAME"
	LNK_DS=$(find "$LNK_P" -maxdepth 1 -iname "*$BASENAME*" -type d )
	echo "LNK_DS $LNK_DS"
	LINE_COUNT=$(echo $LNK_DS | wc -l 2>/dev/null)
	echo "line count $LINE_COUNT"
	case "$LINE_COUNT" in
	"0"|0)
		LNK_D="$LNK_P$BASENAME"
		echo "creating dir $LNK_D"
		#mkdir -vp $LNK_D 
		;;
	"1"|1)
		LNK_D="$LNK_DS"
		echo "use $LNK_D out of $LNK_DS" 
		;;
	*)
		echo "other line count $LINE_COUNT"
		exit 1
	esac
	exit 99
	ls -la $LNK_D
	EXES=`find $CAND -maxdepth 1 -iname '*.exe' -type f`
	for EXE in $EXES ; do
		echo "linking $EXE"
		echo ln -v
	done
done
CYGWIN=winsymlinks:nativestrict
