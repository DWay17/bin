#!/bin/sh
fileName=$1
baseName=$(basename $fileName)
#echo baseName=$baseName
fname="${baseName%.*}"
#echo fname=$fname
ext="${baseName##*.}"
#echo ext=$ext

tail -n +2 $baseName | split --verbose -l 5000 --additional-suffix=".$ext" - --filter='sh -c "{ head -n1 $baseName; cat; } > $FILE"' "$fname"_
wc -l $baseName "$fname"_*
