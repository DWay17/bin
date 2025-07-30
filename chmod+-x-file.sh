#!/bin/sh
function chmodX {
	#ls -l "$1"
	FT=$(file "$1")
	case "$FT" in
	*script*|*batch*file*)
		chmod -c a+x "$1" ;;
	*executable*)
		chmod -c a+x "$1" ;;
	########################
	*text*)
		chmod -c a-x "$1" ;;
	*Encrypted*|*archive*|*[Ee]xcel*|*excel*|*Excel*|*Composite*Document*)
		chmod -c a-x "$1" ;;
	*PEM*|*Certificate*)
		chmod -c a-x "$1" ;;
	*)
		echo "file $1 has a unknown filetype: $FT" ;;
	esac
}

if [ -z "$1" ] ; then
	#echo " -z"
	for file in "."/* ; do
		chmodX "$file"
	done
else
	#echo " ! -z"
	for file in "$@" ; do
		chmodX "$file"
	done
fi
