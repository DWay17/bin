#!/bin/sh
git clone

git clone git@github.com:sysINFLAME/Rmodules.git
git clone git@github.com:sysINFLAME/SmartR.git
git clone git@github.com:sysINFLAME/transmartApp.git
git clone git@github.com:sysINFLAME/transmart-core-db.git

find `pwd` -iname .git -type d | sed -Ee 's/^/cd /g' -e 's/\.git$/ \&\& git pull/g' | sh

git -c diff.mnemonicprefix=false -c core.quotepath=false push -v --tags bitbucket master:master
git -c diff.mnemonicprefix=false -c core.quotepath=false push -v --tags --set-upstream ikmb master:master
git status | grep modified | grep '/' | sed -Ee 's/.*:\s+//g' -e 's/(.*)/mv -v \1 \1~/g' | sh
git pull 2>&1 | grep -E '^\s+' | sed -Ee 's/^\s+//g' -e 's/(.*)/mv -v \1 \1~/g' | sh
setup-x86_64.exe -q -P git,make,gcc-core,gcc-g++,cmake
git -c diff.mnemonicprefix=false -c core.quotepath=false revert --no-edit 3f3a0f29cb834a303342ffaacc49c1403cc1362b

git checkout --theirs *
git status | grep "both modified" | gawk '{print $3}' | xargs -n1 git checkout --theirs
git status | grep "both modified" | gawk '{print $3}' | sed -e 's/^/git checkout --theirs /g'

git merge --strategy-option theirs
git reset --hard HEAD

git -c filter.lfs.smudge= -c filter.lfs.required=false -c diff.mnemonicprefix=false -c core.quotepath=false clone --branch master git@github.com:tmfev/Dockerbank.git C:\Users\t.richter\git\Dockerbank
git clone --branch master git@github.com:tmfev/Dockerbank.git Dockerbank

git --work-tree=where/my/code/is --git-dir=some/path/to/my/.git status

git --work-tree=/cygdrive/c/Users/t.richter/AppData/Roaming/jEdit/modes --git-dir=/cygdrive/c/Users/t.richter/git/jedit-docker-mode/.git

git update-index
git prune
git repack

git push --set-upstream git@cau-git.rz.uni-kiel.de:suktm428/$(git rev-parse --show-toplevel | xargs basename).git $(git rev-parse --abbrev-ref HEAD)

