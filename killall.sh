#!/bin/sh
PIDS=$(ps | grep $1 | gawk '{print $1}')
echo -n "PIDS of $1 "
echo "$PIDS" | fmt
for PID in $PIDS ; do
	kill -s HUP $PID
done
