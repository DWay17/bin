#!/bin/sh
#  ioe.sh
DIR=C:\Programme\IDRT_IOE\de.umg.mi.idrt.product.id-win32.win32.x86_64\IOE.ini
cd '%DIR'
date >> IOE.log
nohup IOE.exe 2>&1 >> IOE.log &
date >> IOE.log
