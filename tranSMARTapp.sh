#!/bin/sh
ACCOUNT=sysINFLAME
ACCOUNT=transmart 
ACCOUNT=Medical-Informatics-Goettingen
BRANCH=master
BRANCH=release-16.2-TraIT
BRANCH=release-16.2
BRANCH=release-16.2-UMG

cd /c/tmp/
FOLDER=$ACCOUNT-$BRANCH-$(date "+%Y-%m-%dT%H.%M.%S")
mkdir -v $FOLDER
cd $FOLDER
#graiIsWorkDir grails.work.dir $USER_HOME/.graiIs/<grailsVersion>
#HOME=$FOLDER
#USER_HOME=$FOLDER
#grailsWorkDir=$FOLDER
#GRAILS_WORK_DIR=$FOLDER
mv -v /c/Users/t.richter/.grails /c/Users/t.richter/.grails_$(date "+%Y-%m-%dT%H.%M.%S")
pwd
URL="git@github.com:$ACCOUNT/transmartApp.git"
echo "clone url"
git clone $URL
cd transmartApp
pwd
echo "checkout branch $BRANCH"
git checkout -b $BRANCH
pwd
time grails --stackstrace war | tee  grails_war_`date +%Y-%m-%dT%H.%M.%S`.log
mv -v target/transmart.war target/$ACCOUNT-$BRANCH-transmart.war

exit 0

cd /var/lib/tomcat7/webapps/transmart/js
ln -s jQuery jquery
chown -c tomcat7.tomcat7 jquery
#su tomcat7 ln -s jQuery jquery
#su tomcat7 -c ln -s jQuery jquery
sudo -u tomcat7 ln -s jQuery jquery
