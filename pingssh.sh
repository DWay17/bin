#!/bin/sh
echo "until ssh -o ConnectTimeout=1 $1 exit ; do :; done"
until ssh -o ConnectTimeout=1 $1 exit ; do :; done
