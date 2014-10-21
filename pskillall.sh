#!/bin/sh
for process in "$@"; do
	pskill "$process"
done
