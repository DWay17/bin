#!/bin/sh
PROFILE_REGISTRY=/c/Users/t.richter/.p2/org.eclipse.equinox.p2.engine/profileRegistry/
PROFILE_INFO=/c/Users/t.richter/.p2/profiles.info

for EXE in $(find /c/Programme/eclipse/ -maxdepth 3 -mindepth 2 -type f -iname eclipse.exe) ; do
	DIR=$(dirname $EXE)
	echo $DIR
	PROFILE_NAME=$(cygpath -w $DIR | sed -Ee 's/[:\\]/_/g')
	echo $PROFILE_NAME                                                                            
	DIR_W_Q=$(cygpath -w $DIR | sed -e 's#\\#\\\\#g')
	DIR_W=$(cygpath -w $DIR)
	grep -i -- $PROFILE_NAME $PROFILE_INFO 2>&1 >/dev/null
	if [ $? -eq 0 ] ; then
		true # echo "profiles.info filled"
	else
		echo "creating profiles.info"
		echo $PROFILE_NAME"|""Installation""|"'C:\\Users\\t.richter\\.p2\\pool'"|"$DIR_W_Q"|" >> $PROFILE_INFO
	fi
	DIR_PROFILE=$PROFILE_REGISTRY$PROFILE_NAME".profile/"
	DIR_SETTINGS=$DIR_PROFILE"/.data/.settings/"
	mkdir -vp $DIR_SETTINGS
	DIR_EA=$DIR_PROFILE"/.data/org.eclipse.equinox.internal.p2.touchpoint.eclipse.actions/"
	mkdir -vp $DIR_EA
	#echo $DIR_EA
	#ls -l $DIR_EA
	if [[ -f $DIR_EA"/jvmargs" ]] ; then
		true # echo "jvmargs exists"
	else
		echo "#"`(unset LANG;date)` >> $DIR_EA"/jvmargs"
	fi                            
	PREFS_FILES="org.eclipse.equinox.p2.artifact.repository.prefs org.eclipse.equinox.p2.metadata.repository.prefs org.eclipse.equinox.p2.ui.sdk.scheduler.prefs"
	#ls -l $DIR_SETTINGS
	for PREFS_FILE in $PREFS_FILES; do
		if [[ -f $DIR_SETTINGS$PREFS_FILE ]] ; then
			true # echo "exists: $DIR_SETTINGS$PREFS_FILE ";
		else
			echo "eclipse.preferences.version=1" >> $DIR_SETTINGS$PREFS_FILE
		fi
	done
	ls -l $DIR_PROFILE/*profile* 2>&1 >/dev/null
	if [ $? -eq 0 ] ; then
		echo "profile exists"
	else
		echo "profile doesn't exists"
		DATE=$(date +%s)
		DATE=$DATE"000"
		echo $DATE
		PROFILE=$DIR_PROFILE$DATE".profile"
		echo "$PROFILE"
		echo "<?xml version='1.0' encoding='UTF-8'?>" > $PROFILE
		echo "<?profile version='1.0.0'?>" >> $PROFILE
		echo "<profile id='"$PROFILE_NAME"' timestamp='"$DATE"'>" >> $PROFILE
		echo "  <properties size='7'>" >> $PROFILE
		echo "    <property name='org.eclipse.equinox.p2.cache' value='C:\Users\t.richter\.p2\pool'/>" >> $PROFILE
		echo "    <property name='org.eclipse.update.install.features' value='true'/>" >> $PROFILE
		echo "    <property name='org.eclipse.equinox.p2.roaming' value='true'/>" >> $PROFILE
		echo "    <property name='org.eclipse.equinox.p2.environments' value='osgi.os=win32,osgi.arch=x86_64,osgi.ws=win32'/>" >> $PROFILE
		echo "    <property name='org.eclipse.oomph.p2.profile.type' value='Installation'/>" >> $PROFILE
		echo "    <property name='org.eclipse.oomph.p2.profile.shared.pool' value='true'/>" >> $PROFILE
		echo "    <property name='org.eclipse.equinox.p2.installFolder' value='"$DIR_W"'/>" >> $PROFILE
		echo "  </properties>" >> $PROFILE                 
		echo "</profile>" >> $PROFILE
	fi
	echo
done

