#!/bin/sh
chmodX() {
	if [ ! -e "$1" ] && [ ! -L "$1" ]; then
		printf 'file not found: %s\n' "$1" >&2
		return 1
	fi

	case "$1" in
	*~)
		chmod -c a-x -- "$1"
		return
		;;
	esac

	#ls -l "$1"
	FT=$(file -b -- "$1") || return 1
	case "$FT" in
	*script*|*batch*file*)
		chmod -c ug+x -- "$1" ;;
	*executable*)
		chmod -c ug+x -- "$1" ;;
	########################
	*text*)
		chmod -c a-x -- "$1" ;;
	*xml*)
		chmod -c a-x -- "$1" ;;
	*word*)
		chmod -c a-x -- "$1" ;;
	*Encrypted*|*archive*|*[Ee]xcel*|*excel*|*Excel*|*Composite*Document*)
		chmod -c a-x -- "$1" ;;
	*PEM*|*Certificate*)
		chmod -c u+rw,go-rw,a-x -- "$1" ;;
	*empty*)
		chmod -c a-x -- "$1" ;;
	*directory*)
		chmod -c ug+x -- "$1" ;;
	*image\ data*)
		chmod -c a-x -- "$1" ;;
	*compressed*data*)
		chmod -c a-x -- "$1" ;;
	*Keepass*|*KDBX*)
		chmod -c u+rw,a-x -- "$1" ;;
	*private\ key*|*PGP\ signature*|*Java\ KeyStore*|*OpenSSH*key*)
		chmod -c u+rw,go-rw,a-x -- "$1" ;;
	*document*)
		chmod -c ug+rw,a-x -- "$1" ;;
	*)
		printf 'file %s has an unknown filetype: %s\n' "$1" "$FT" >&2
		return 1
		;;
	esac
}

status=0
if [ "$#" -eq 0 ]; then
	for file in ./*; do
		[ -e "$file" ] || [ -L "$file" ] || continue
		chmodX "$file" || status=1
	done
else
	for file in "$@"; do
		chmodX "$file" || status=1
	done
fi

exit "$status"
