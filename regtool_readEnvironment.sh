#!/bin/sh
for e in `regtool list /HKEY_CURRENT_USER/Environment` ; do
	echo $e"="`regtool get /HKEY_CURRENT_USER/Environment/$e`	
done
