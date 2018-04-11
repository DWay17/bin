#!/bin/sh
APPS="splitter merger"
declare -A HOSTS
HOSTS["splitter"]=172.21.99.42
HOSTS["merger"]=172.21.99.43
DIR=/c/Users/t.richter/.m2/repository/de/cau/med/fdm
USER=trichter
TOMCATV="tomcat8"
REMOTEBASEDIR=/var/lib/$TOMCATV/webapps/
LSCMD="ls -lad $REMOTEBASEDIR*"
GREP_VERSION="grep 0.2.1"
GREP_VERSION="grep -v 0.4.0"
GREP_VERSION="grep ."
GREP_SNAPSHOT="grep -v SNAPSHOT"
GREP_SNAPSHOT="grep SNAPSHOT"
for APP in $APPS; do
	HOST=${HOSTS[$APP]}
	echo 
	echo "deploying $APP to $HOST"
	echo
	echo
	#until ping -c1 $HOST &>/dev/null; do :; done
	#until /c/Windows/SysWOW64/PING.EXE -n 1 172.21.99.42 ; do :; done
	echo 
	CONNECTION=$USER@$HOST
	until ssh -o ConnectTimeout=1 $CONNECTION exit ; do :; done
	#WARFILE=`find $DIR -iname $APP*.war -type f | $GREP_VERSION | $GREP_SNAPSHOT | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | tail -n1`
	WARFILE=`find $DIR -iname $APP*.war -type f | $GREP_VERSION | $GREP_SNAPSHOT | sort -V | tail -n1`
	ls -l $WARFILE
	FILE=`echo $WARFILE | sed -e 's#.*/##g'`
	REMOTEFILE=$REMOTEBASEDIR$FILE
	#echo $WARFILE
	#OLDVER=`ssh $CONNECTION find $REMOTEBASEDIR -iname $APP* -type d`
	#echo "OLDVER=$OLDVER"
	ssh $CONNECTION $LSCMD
	ssh $CONNECTION rm -vf "$REMOTEBASEDIR$APP*.war" 
	ssh $CONNECTION rm -vf $REMOTEFILE
	ssh $CONNECTION $LSCMD
	echo -n "waiting for undeploy of $REMOTEBASEDIR$APP "
	#until ! ssh $CONNECTION ls -1d "$OLDVER" ; do echo -n "."; done
	sleep 17
	echo
	ssh $CONNECTION $LSCMD
	scp $WARFILE $CONNECTION:$REMOTEBASEDIR
	ssh $CONNECTION chmod -c a+wr $REMOTEFILE
	#ssh $CONNECTION chown -c $TOMCATV.$TOMCATV $REMOTEFILE
	ssh $CONNECTION chgrp -c $TOMCATV $REMOTEFILE
	ssh $CONNECTION chmod -c o= $REMOTEFILE
	ssh $CONNECTION touch $REMOTEFILE
	ssh $CONNECTION $LSCMD
	echo -n "waiting for deploy"
	sleep 17
	echo
	ssh $CONNECTION $LSCMD
done
