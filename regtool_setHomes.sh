#!/bin/sh
for key in `set | grep = | grep -E "\w+HOME=" | sed -e 's/=.*//g'` ; do
	echo
	echo key=$key
	regKey="/HKCU/Environment/$key"
	echo regKey=$regKey
	regVal=""
	regVal=`regtool get $regKey 2>/dev/null`
	echo regVal=$regVal
	if test -z "$regVal" ; then
		echo "doesn't exists"
		unixPath=${!key}
		echo unixPath=$unixPath
		winPath=$(cygpath -w $unixPath)
		echo winPath=$winPath
		winPath2=$(echo $unixPath | sed -Ee "s#/cygdrive/([a-z])/#\1:\\\#g" -e "s#/#\\\#g")
		echo winPath2=$winPath2
		echo "set $regKey to $winPath2"
		regtool --string set $regKey $winPath2
	else
		echo "exists"
	fi
	echo
done
