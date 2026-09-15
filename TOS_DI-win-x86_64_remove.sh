#!/bin/sh
basepath="/cygdrive/c/develop"
workspaces="tos53di
talend_workspace_di_demo"
dirs="
.Java/classes
.Java/src
.JETEmitters/runtime
.JETEmitters/src"
for workspace in $workspaces ; do
	for dir in $dirs ; do
		ddir="$basepath/$workspace/$dir"
		echo "delete $ddir"
		rm -rfv $ddir/*
		mkdir -p $ddir
		touch $ddir 
	done
done
