#!/bin/sh
# drive links
for drive in `ls -1 /cygdrive/`; do
	echo "drive $drive"
	ls -l "/$drive"
	if [[ -a "/$drive" ]]; then
		echo "drive $drive exists" 
	else
		echo "drive $drive doesn't exists"
		ln -vs "/cygdrive/$drive" "/$drive"
	fi
	echo
done