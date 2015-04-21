#!/bin/sh
### head in all csv in all zips
basedir=/cygdrive/c/Users/t.richter/Dropbox/Caro_Knecht/
out_dir=/v/sysINFLAME/CP01/
echo $out_dir
desc_file="$out_dir"descript.ion
echo $desc_file
#ls -l $basedir
for zip in `ls -1 $basedir*.zip` ; do
	ls -l $zip
	#unzip -p 'c:\Users\t.richter\Dropbox\Caro_Knecht\ILLUMINA_27k_methylation.zip' Illumina_HumanMethylation27_Content.csv | dos2unix -c mac | head -n 9 | wc
	for csv in `unzip -ql $zip | grep ".csv" | gawk '{print $4}' | grep -v '/' ` ; do
		echo $csv
		outfile=`echo $csv | sed -e 's/\.csv$/.head25.csv/g'`
		echo $outfile
		unzip -p $zip $csv | dos2unix -c mac | dos2unix | head -n 25 > /v/sysINFLAME/CP01/$outfile
		# stat 25
		echo -n "$outfile words lines bytes:" >> $desc_file
		unzip -p $zip $csv | dos2unix -c mac | dos2unix | head -n 25 | tr '[;,\t]' ' ' | wc >> $desc_file
		echo >> $desc_file
		# stat
		echo -n "$csv words lines bytes:" >> $desc_file
		unzip -p $zip $csv | dos2unix -c mac | dos2unix | tr '[;,\t]' ' ' | wc >> $desc_file
		echo >> $desc_file
	done
done
unix2dos $desc_file
