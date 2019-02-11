#!/bin/sh
mv.date.sh /c/cygwin/setup-x86.exe
wget "http://www.cygwin.com/setup-x86.exe" -O /c/cygwin/setup-x86.exe
chmod -c a+rwx /c/cygwin/setup-x86.exe
mv.date.sh /c/cygwin64/setup-x86_64.exe
wget "http://www.cygwin.com/setup-x86_64.exe" -O /c/cygwin64/setup-x86_64.exe
chmod -c a+rwx /c/cygwin64/setup-x86_64.exe
