#!/bin/sh
JAVA=$(cygpath -a -w `which javaw`)".exe"
if [ -L "$JAVA" ] ; then
	#JAVA="'"`ls -l "$JAVA" | sed -e 's/.*-> //g'`"'"
	JAVA=`ls -l "$JAVA" | sed -e 's/.*-> //g' -e 's/ /\\ /g'`
fi
JAVA=javaw
echo $JAVA 
D_OPTS="-Dfile.encoding=Cp1252" 
CLASSPATH="C:\develop\eclipse-ws\testProj\target\classes"
CLASSPATH="C:\develop\eclipse-mars\testProj\target\classes"
CLASSPATH=$CLASSPATH";C:\Users\t.richter\.m2\repository\oro\oro\2.0.8\oro-2.0.8.jar;C:\Users\t.richter\.m2\repository\org\apache\commons\commons-csv\1.0\commons-csv-1.0.jar;C:\Users\t.richter\.m2\repository\org\jmock\jmock-junit4\2.6.0\jmock-junit4-2.6.0.jar;C:\Users\t.richter\.m2\repository\org\jmock\jmock\2.6.0\jmock-2.6.0.jar;C:\Users\t.richter\.m2\repository\org\hamcrest\hamcrest-core\1.1\hamcrest-core-1.1.jar;C:\Users\t.richter\.m2\repository\org\hamcrest\hamcrest-library\1.1\hamcrest-library-1.1.jar;C:\Users\t.richter\.m2\repository\junit\junit-dep\4.4\junit-dep-4.4.jar;C:\Users\t.richter\.m2\repository\au\com\bytecode\opencsv\2.4\opencsv-2.4.jar"

#echo "CLASSPATH="$CLASSPATH
dir=$(cygpath -a -w $1)
echo "dir=$dir"
include='*.tsv'
include='*.csv'
exclude='*.cfg.*'
ARGS="'$dir' '$include' '$exclude'"
echo "ARGS=$ARGS"
CLASS="de.uksh.zfdm.AnalyseCsv"
CMD="$JAVA $D_OPTS -cp $CLASSPATH $CLASS $ARGS"
echo "CMD="$CMD
chmod -c u+rw descript.ion 
$CMD
