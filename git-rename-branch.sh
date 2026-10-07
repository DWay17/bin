#!/bin/sh
GIT_OPTS=" --verbose"
OLD_NAME=$1
NEW_NAME=$2
REMOTE=`git remote -v | grep push | cut -f1`
echo "rename $OLD_NAME to $NEW_NAME"
echo
echo
echo "use REMOTE=$REMOTE"
echo

function bpp () {
	echo "rename local branch"
	git branch -m $OLD_NAME $NEW_NAME $GIT_OPTS
	echo
	echo "Delete the $OLD_NAME remote branch and push the $NEW_NAME local branch."
	git push $REMOTE :$OLD_NAME $NEW_NAME $GIT_OPTS
	echo
	echo "Reset the upstream branch for the $NEW_NAME local branch."
	echo "Switch to the branch and then:"
	git push $REMOTE -u $NEW_NAME $GIT_OPTS
	echo
}

# delete is missing?
function pbrp () {
	echo "First make a $NEW_NAME branch in the $REMOTE repository, based off of the $OLD_NAME commit in the local repository"
	git push $REMOTE $OLD_NAME:$NEW_NAME         $GIT_OPTS
	echo
	echo "Create a new local branch for this new $REMOTE/$NEW_NAME branch (which will automatically be set up properly as a tracking branch)."
	git branch $NEW_NAME $REMOTE/$NEW_NAME   $GIT_OPTS
	echo
	echo "Now point your local $OLD_NAME to whichever commit you want it to point to."
	git reset --hard $new_master_commit       $GIT_OPTS
	echo
	echo "Finally, force-change $OLD_NAME in the $REMOTE repository to reflect your new local $OLD_NAME."
	git push -f $REMOTE                        $GIT_OPTS
	echo
}

function my (){
	echo "First make a $NEW_NAME branch in the $REMOTE repository, based off of the $OLD_NAME commit in the local repository"
	git push $REMOTE $OLD_NAME:$NEW_NAME         $GIT_OPTS
	echo
	echo "Create a new local branch for this new $REMOTE/$NEW_NAME branch (which will automatically be set up properly as a tracking branch)."
	git branch $NEW_NAME $REMOTE/$NEW_NAME   $GIT_OPTS
	echo
	#echo "Now point your local $OLD_NAME to whichever commit you want it to point to."
	#git reset --hard $new_master_commit      
	#echo
	echo "Finally, force-change $OLD_NAME in the $REMOTE repository to reflect your new local $OLD_NAME."
	git push -f $REMOTE $GIT_OPTS
	CUR_BRU=`git branch | grep \* | sed -Ee 's/^\*\s+//g'`
	if [[ $CUR_BRU == $OLD_NAME ]] ; then
		echo "switching to $NEW_NAME"
		git checkout $NEW_NAME
	fi
	echo
	echo "delete local branch"
	git branch -D $OLD_NAME $GIT_OPTS
	echo
	echo "delete remote branch (push deleted branch to $REMOTE)"
	#git push $REMOTE :refs/heads/$OLD_NAME
	git push $REMOTE :$OLD_NAME $GIT_OPTS
	git branch -D -r $REMOTE/$OLD_NAME $GIT_OPTS
	echo
	echo "prune branch"
	git remote prune $REMOTE
	echo
}

#pbrp
#bpp
my
