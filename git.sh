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
