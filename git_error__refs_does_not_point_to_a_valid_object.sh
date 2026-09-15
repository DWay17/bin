#!/bin/sh
# error: refs... does not point to a valid object!
git gc
git fsck --full
git reflog expire --expire=0 --all
# git update-ref -d 0d998c99b6d01e8aabca72b1934802acf90b8fc9
git gc --aggressive
git remote update --prune
