#!/bin/sh
PWD=$(pwd)
echo "scan for git folders in PWD=$PWD"
DIRS=$(find "$PWD" -maxdepth 2 -iname .git -type d | grep '\.git')
echo "all found DIRS=$DIRS"	
echo
echo
for DIR in $DIRS ; do
	echo "check DIR=$DIR"
	file $DIR
	BDIR=$(dirname $DIR)
	echo "basedir BDIR=$BDIR"
	if [ -d "$BDIR" ] ; then
		echo "is dir"
	else
		echo "no dir"
		continue
	fi
	cd "$BDIR"
	BRANCH=$(cat "./.git/HEAD" | sed -Ee 's#.*/##g')
	echo "branch from HEAD BRANCH=$BRANCH"
	#set -xv
	REMOTE_CNT=$(grep "\[remote " ./.git/config | wc -l)
	#set +vx
	echo "REMOTE_CNT=$REMOTE_CNT"
	case $REMOTE_CNT in
		1)
			echo "got $REMOTE_CNT"
			REMOTE=$(grep "\[remote " ./.git/config | sed -Ee 's/.*remote "//g' -e 's/".*//g')
			echo "REMOTE=$REMOTE"
			;;
		*)
			echo "cat not handle REMOTE_CNT=$REMOTE_CNT"
			continue
	esac
	REMOTE_URL=$(grep -A1 "\[remote " "./.git/config" | grep -E "url ?=" | sed -Ee 's#.*url ?= ?##g')
	echo "remote REMOTE_URL=$REMOTE_URL"
	# git init --initial-branch=master
	if git status 2>&1 >/dev/null ; then
		echo "is initialized"
	else
		echo "is not initialized"
		git init --initial-branch=$BRANCH
	fi
	git fetch --all
	git pull
	echo
done
cd $PWD
