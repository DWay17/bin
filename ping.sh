#!/bin/sh
EXE="/c/Windows/System32/PING.EXE"
EXE="/c/Windows/SysWOW64/PING.EXE"
$EXE -t $1
