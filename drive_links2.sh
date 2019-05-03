#!/bin/sh
# drive links
for drive in echo {a..z} ; do
	echo "drive $drive"
	ls -ld "/$drive"
	if [[ -a "/$drive" ]]; then
		echo "link to drive $drive exists" 
	else
		echo "drive $drive doesn't exists"
		ln -vs "/cygdrive/$drive" "/$drive"
	fi
	echo
done