#!/bin/sh
# pskillall needs pskill from sysinternals
for process in "$@"; do
	pskill "$process"
done
