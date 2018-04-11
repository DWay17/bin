#!/bin/sh
# c:\windows\infpub.dat and c:\Windows\cscc.dat.

#files=c:/windows/infpub.dat c:/Windows/cscc.dat
#for file in $files ; do
#	touch -v "$file"
#	chmod -c a-w "$file"
#done
touch 'c:\windows\infpub.dat'
touch 'c:\Windows\cscc.dat'
chmod -c a-rwx 'c:\windows\infpub.dat'
chmod -c a-rwx 'c:\Windows\cscc.dat'
attrib +R 'c:\windows\infpub.dat'
attrib +R 'c:\Windows\cscc.dat'
