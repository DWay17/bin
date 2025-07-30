#!/bin/sh
if [ -n "$1" ]; then
	MAXDEPTHD=$1
else
	MAXDEPTHD=0
fi
REGEX_FILEMX1="(LICENSE|README|config|FETCH_HEAD|HEAD|index|ORIG_HEAD|packed-refs|sourcetreeconfig)"
REGEX_FILEMX21="7z|apk|asc|bak|bash_.*|bashrc|bz2|cfg|classpath|conf|config|crt|crx|csv|dat|data|db|diff|docx?|eps|eml|gpg"
REGEX_FILEMX21="$REGEX_FILEMX21|gif|gitconfig|gitignore|gz|html?|ics|index|ini|inputrc|ion|iso|jar|java|jks|jpe?g|js|jsp|json"
REGEX_FILEMX21="$REGEX_FILEMX21|kdbx?|lnk|lock|log|mail|map|md|mf|mdb|mp3|mp4|mtp|muttrc|new|ods|old|owl|p12|pdf|ped|pem|pfx|phe|pig|png"
REGEX_FILEMX21="$REGEX_FILEMX21|pptx?|profile|project|properties|prop|pub|rdf|reg|rtf|sql|sqlite|tar|tmp|tgz|tsv|txt|tiff?"
REGEX_FILEMX21="$REGEX_FILEMX21|vmdk|war|xlsx?|xml|xpi|xsd|xsl|yml|zip"
REGEX_FILEMX2="(.*\.($REGEX_FILEMX21))"
REGEX_FILEMX=".*/$REGEX_FILEMX1|$REGEX_FILEMX2\$"
for dir in `find . -maxdepth $MAXDEPTHD -type d` ; do
	echo "proc $dir"
	echo "file count "`find $dir -maxdepth 1 -type f | wc -l`
	#echo $REGEX_FILEMX
	# echo "u+r"
	# find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+r {} \;
	# echo "u+w"
	# find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+w {} \;
	MAXDEPTH=1
	echo "u+rw"
	find . -maxdepth $MAXDEPTH -mindepth 1 -exec chmod -c u+rw {} \;
	echo "files -x"
	find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended \
	   -iregex $REGEX_FILEMX \
	   -exec chmod -c a-x {} \;
	#find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended \
	#   -iregex '.*/(config|FETCH_HEAD|HEAD|index|ORIG_HEAD|packed-refs|sourcetreeconfig)$' \
	#   -exec chmod -c a-x {} \;
	echo "backup -x"
	find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*/#.*#$' -exec chmod -c a-x {} \; 
	find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*/.*~$' -exec chmod -c a-x {} \;
	echo "executable files +x"
	find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat|exe|com|pl|php)' -exec chmod -c g+rx {} \;
	find . -maxdepth $MAXDEPTH -mindepth 1 -type f -regextype posix-extended -regex '.*\.(sh|bash|cmd|bat|exe|com|pl|php)' -exec chmod -c u+rwx {} \;
	echo "directories +x"
	find . -maxdepth $MAXDEPTH -mindepth 1 -type d -exec chmod -c g+rx {} \; 
	find . -maxdepth $MAXDEPTH -mindepth 1 -type d -exec chmod -c u+rxw {} \;
	echo
done
