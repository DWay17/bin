#!/bin/sh
echo $1
FILE_NAME=~/bin/$1.sh
echo $FILE_NAME
if [[ -f $FILE_NAME ]] ; then
	ls -l $FILE_NAME
	chmod -c a+x $FILE_NAME
	vi $FILE_NAME
else
	touch $FILE_NAME
	echo "#!/bin/sh" > $FILE_NAME
	echo "# $FILE_NAME" >> $FILE_NAME
	chmod -c a+x $FILE_NAME
	vi $FILE_NAME
fi
