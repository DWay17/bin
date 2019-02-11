#!/bin/sh
CLASS=NetTest
CLASS_BIN=$CLASS."class"
ECLIPSE_DIR=/c/develop/eclipse
CLASS_BIN_DIR=`find $ECLIPSE_DIR -iname $CLASS_BIN`
echo "CLASS_BIN_DIR=$CLASS_BIN_DIR"
CLASS_DIR=`dirname $CLASS_BIN_DIR`
echo "CLASS_DIR=$CLASS_DIR"
cd $CLASS_DIR
pwd
#array
#declare -a JAVA_DIRS
#JAVA_DIRS=(
#	'/c/Program Files/Java'
#	'/c/Program Files (x86)/Java'
#	'/c/Program Files (x86/Common Files/Oracle/Java'
#	)
OIFS="$IFS"
IFS=$' \t\n'
IFS=$'\n'
JAVA_DIRS[0]="/c/Program Files/Java"
JAVA_DIRS[1]="/c/Program Files (x86)/Java"
JAVA_DIRS[2]="/c/Program Files (x86/Common Files/Oracle/Java"
echo -ne "JAVA_DIRS *\t"
echo ${JAVA_DIRS[*]}
echo -ne "JAVA_DIRS @\t"
echo ${JAVA_DIRS[@]}
echo "for"
for JAVA_DIR in ${JAVA_DIRS[@]}; do
	echo
	echo "JAVA_DIR=$JAVA_DIR"
	ls -d "$JAVA_DIR"
	JAVA_EXES=$(find "$JAVA_DIR" -maxdepth 6 -mindepth 4 -regextype posix-extended -iregex '/c/.*javaw?\.exe' -type f 2>/dev/null)
	echo "JAVA_EXES=$JAVA_EXES"
	for JAVA_EXE in $JAVA_EXES; do
		echo "JAVA_EXE=$JAVA_EXE"
		"$JAVA_EXE" $CLASS
	done
	echo
	echo
done
IFS="$OIFS"
