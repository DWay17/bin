#!/bin/sh
#misc.sh
iconv -f "windows-1252" -t "UTF-8" labs_final_new.csv > labs_final_new_utf8.csv
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\CP1-AP\'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP01'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP02'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP03'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP04'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP05'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP06'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP07'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP08'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP09'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Unterprojekte\CP10'
mkdir -vp 'w:\Freigegebene Dokumente\Projekte\Projektfortschritt'
mkdir -vp 'w:\Freigegebene Dokumente\Dokumente\Berichte'
mkdir -vp 'w:\Freigegebene Dokumente\Dokumente\Protokolle'
mkdir -vp 'w:\Freigegebene Dokumente\Dokumente\Vorlagen'
perl -MCPAN -e shell
grep :: < ~/cpan.log | sort -u | tr ' "();,*./$&_^?' '\n' | tr "\'" '\n' | sed -s 's/^-M//g' | grep :: | grep -v ^main:: | grep -v ::[a-i] | sort -u | fmt | sed 's/^/install /g'
# repeated command execution
watch -n 7 -d 
find . -perm /u+x -maxdepth 1 -type f -exec ls -1 {} \; | grep "\." | sed -e 's#\./###g' | grep "\." | sed -e 's/.*\.//g' | sort | niq -c | sort -nr

dig 
export CLASSPATH=$(echo $CLASSPATH | sed -e 's/;/\n/g' -e 's#/#\\#g' -e 's#\\\\#\\#g' | uniq2 | tr '\n' ';' | sed -e 's/^;//g' -e 's/;$//g')
export CLASSPATH=$(echo "`find /c/develop/ -iname AnalyseCsv.class | sed -Ee 's#(.*/classes/).*#\1#g' | xargs cygpath -w`;"$CLASSPATH | sed -e 's/;/\n/g' -e 's#/#\\#g' -e 's#\\\\#\\#g' | uniq2 | tr '\n' ';' | sed -e 's/^;//g' -e 's/;$//g')
find /c/Users/t.richter/.m2/repository -regextype posix-extended -iregex '.*/.*(opencsv).*\.jar' -type f | grep -iEv -- '-(javadoc|sources)\.jar'

file -i * | sed -Ee 's/.*charset=(.*)/\1/g' | sort | uniq -c | sort -nr | head -n 2
export LC_ALL=de_DE.ISO-8859-1 ; export LANG=de_DE.ISO-8859-1 ; locale
(find /c/Users/t.richter/ -maxdepth 4 -iregex '.*\.log$' -type f -size +0 ; find /c/Programme/ -maxdepth 6 -regextype posix-extended -iregex '.*(tos|ioe|idrt|i2b2|eclipse|sql|imt).*\.log$' -type f -size +0  ; find /c/Programme/ -mindepth 2 -iname log.log -type f -size +0 )  | grep -ivE '\.[0-9]{14}\.' | grep -iv '/temp/' | sed -e 's/^\(.*\)$/"\1"/g' | xargs mv.date.sh
find /u/Downloads -maxdepth 1 -iname '*.jmx' -type f | grep -ivE '\.[0-9]{14}\.' | sed -e 's/^/mv.date.sh "/g' -e 's/$/"/g' | sh
touch -d 2099-12-31T23:59:59 "C:\Users\t.richter\AppData\Local\Temp\TEMP_20991231T235959.tmp"
apt-get install postgresql-client
apt-get install pgAdmin3
bash --help	
sh --help
#internal field separator = IFS
#OIFS="$IFS"; IFS=$'\n'; gpgconf --list-dirs | cut -d: -f2 | sed -e 's/%3a/:/g' -e 's#[/\\]#/#g' | xargs cygpath -w ; IFS="$OIFS"
OIFS="$IFS"
IFS=$' \t\n'
IFS=$'\n'
IFS="$OIFS"
unset IFS
cd 'C:\Users\t.richter\AppData\Local\Temp\'
cd ~/AppData/Local/Temp
cd /cygdrive/c/Users/t.richter/AppData/Local/Temp
nmap -p389,636 -oG - 10.140.223.101/24 | grep open
#Host: 10.140.223.75 ()  Ports: 389/open/tcp//ldap///, 636/open/tcp//ldapssl///
#Host: 10.140.223.97 (sbdclp01.zad.local)        Ports: 389/open/tcp//ldap///, 636/open/tcp//ldapssl///

for $part in `split --verbose -l 400 --additional-suffix=.csv 99_20150928-syinflame-CED_Anamnese.csv 99_20150928-syinflame-CED_Anamnese_ | sed -Ee 's/.*„(.*)“.*/\1/g'` ; do cat <(head -n1 99_20150928-syinflame-CED_Anamnese.csv) $part > $part; done
export CLASSPATH=$(echo "`find /c/Users/t.richter/.m2/repository -regextype posix-extended -iregex '.*/.*(opencsv|commons-csv-1.2).*\.jar' -type f | grep -iEv -- '-(javadoc|sources)\.jar' | xargs cygpath -w`;"$CLASSPATH | sed -e 's/;/\n/g' -e 's#/#\\#g' -e 's#\\\\#\\#g' | uniq2 | tr '\n' ';' | sed -e 's/^;//g' -e 's/;$//g')
export CLASSPATH=$(echo "`find /c/Users/t.richter/.m2/repository -regextype posix-extended -iregex '.*/.*(slf4j|logback|logging|lang3).*\.jar' -type f | grep -iEv -- '-(javadoc|sources)\.jar' | xargs cygpath -w`;"$CLASSPATH | sed -e 's/;/\n/g' -e 's#/#\\#g' -e 's#\\\\#\\#g' | uniq2 | tr '\n' ';' | sed -e 's/^;//g' -e 's/;$//g')
export CLASSPATH=$(echo "`find /c/Users/t.richter/.m2/repository -regextype posix-extended -iregex '.*/.*(oro).*\.jar' -type f | grep -iEv -- '-(javadoc|sources)\.jar' | xargs cygpath -w`;"$CLASSPATH | sed -e 's/;/\n/g' -e 's#/#\\#g' -e 's#\\\\#\\#g' | uniq2 | tr '\n' ';' | sed -e 's/^;//g' -e 's/;$//g')
pslist 2>/dev/null | gawk '{print $7" "$2" "$1}' | grep -v '0:00' | grep -v Idle | sed -e 's/[:.]//g' | sort -nr | head -n 1 | gawk '{print $2}' | xargs pskill
pslist 2>/dev/null | gawk '{print $7" "$2" "$1}' | grep -v '0:00' | grep -v Idle | sed -e 's/[:.]//g' | sort -nr | grep -Evi 'eclipse|SearchIndexer|svchost|System' | head -n 2 | gawk '{print $2}' | xargs -n 1 pskill

ipconfig | grep -Ei "adapter|ipv4-Adresse" | tr '\n' ' '| sed -Ee 's/([a-z0-9_-]+adapter)/\n\1/ig' | grep -Ei '[0-9]+(\.[0-9]+){3}'
ipconfig | grep -Ei "adapter|ipv4-Adresse" | tr '\n' ' '| sed -Ee 's/([a-z0-9_-]+adapter)/\n\1/ig' | grep -Ei '[0-9]+(\.[0-9]+){3}' | grep -i lan | sed -re 's/.*\b([0-9]+(\.[0-9]+){3}).*/\1/g'
# komprimieren
export LOGDIR='C:\Users\t.richter\logs\'
compact /c /a /s /i /q 'C:\Windows\winsxs\*' >> $LOGDIR/compact.log
compact /c /a /s /i /q 'C:\Windows\winsxs\' >> $LOGDIR/compact.log
compact /c /a /i /q 'C:\Windows\winsxs\*' >> $LOGDIR/compact.log
compact /c /a /i /q 'C:\Windows\winsxs' >> $LOGDIR/compact.log

net use z: '\\mucosasafe.mucosalab.de\Nutzer\t.richter' /PERSISTENT:YES
net use v: '\\mucosasafe.mucosalab.de\projects2\proj_I2B2' /PERSISTENT:YES
net use y: '\\ukshikmb-sl027.i-kmb.de\Alfresco' /PERSISTENT:YES
net use x: '\\ukshikmb-sl027.i-kmb.de\Alfresco\Sites\fdmmf' /PERSISTENT:YES

usermod --append -G tomcat7 root
usermod --append -G tomcat7 trichter
usermod --append -G root trichter
usermod --append -G postgres trichter

•	eine Adresse angepasst (TempPSN-to-TargetPSN->CallToken):
"HOST:PORT/ki-ths/rest/psn/request2/TOKEN_ID" -> "HOST:PORT/ki-ths/rest/psn/request/TOKEN_ID"

find . -iname '*.properties' -print0 | xargs -0 perl -p -i.bak -e 's/popgen.new.patient/popgenIDAT_to_tempPSN/g'
date "+%Y-%m-%d %H:%M:%S"
date -d "$s1" +%Y%m%d%H%M%S
cp -v `find . -iname '*.tsv' | xargs ls -lrt | tail -n1 | sed -e 's/.* //g'` ./`date +%Y%m%d%H%M%S`.tsv 

trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG
trap 'printf "\033]0;%s\007" "${BASH_COMMAND//[^[:print:]]/}"' DEBUG
function settitle () {
    export PREV_COMMAND=${PREV_COMMAND}${@}
    printf "\033]0;%s\007" "${BASH_COMMAND//[^[:print:]]/}"
    export PREV_COMMAND=${PREV_COMMAND}' | '
}

export PROMPT_COMMAND=${PROMPT_COMMAND}';export PREV_COMMAND=""'

trap 'settitle "$BASH_COMMAND"' DEBUG

ps | cut -b2-10,69- | grep bash | cut -b1-9 | xargs kill

chown -c tomcat8.tomcat8 *.properties
sudo -u tomcat8 mkdir -vp /var/spool/splitter/p2n/i2b2/
sudo -u tomcat8 mkdir -vp /var/spool/merger/p2n/i2b2/

find /var/ -mindepth 2 -regextype posix-extended -iregex '.*/(spool|tmp)/(splitter|merger)/.*..*' -type d -exec chmod -c ug=rwx,o= {} \;
find /var/spool/ -iname '*.properties' -type f -exec chmod -c ug=rw,o= {} \;
find /var/spool/ -iname '*.properties' -type f -exec chown -c tomcat8.tomcat8 {} \;
find /var/spool/ -maxdepth 2 -mindepth 1 -regextype posix-extended -iregex '.*/(spool|tmp)/(splitter|merger)/.*..*' -type d -exec chmod -c o=x {} \;
find /var/spool/ -maxdepth 3 -mindepth 3 -regextype posix-extended -iregex '.*/(spool|tmp)/(splitter|merger)/.*..*' -type d -exec chown -c tomcat8.popgen-in {} \;

# ip
lynx -dump http://wasistmeineip.de/ | grep -iE '[0-9]{1,3}(\.[0-9]{1,3}){3}'

ntpdate 0.pool.ntp.org 1.pool.ntp.org
grep -v "^#" /home/sysinflame/openbis_1605/servers/openBIS-server/jetty/etc/service.properties  | grep -i ldap | grep -iE '= ?.{2,}'

# find syslinks
find -L /home/ -samefile .
find -L /home/ -samefile /var/spool/splitter/PopGenPatientList/PopGenDB

find /var/ -maxdepth 4 -mindepth 4 -regextype posix-extended -iregex '.*/(spool|tmp)/(splitter|merger)(_exchange)?/.*' -type d 

#dns
nslookup ukshikmb-sl046 | grep -v '#53' | grep -iE '(Name|Address):' | tr '\n' '\t' | sed -Ee 's/\w+:\s//g'

#uniq
awk '!seen[$0]++'

net use | tr '\r\n' '\\n' | sed -Ee 's/ \\n +/\t/g' -e 's/\\n/\n/g'

cd /c/develop/eclipse/fdm/kairos/target/generated-sources/jaxb/de/kairos/centraxx/model/service/xml
find . -type f -iname '*.java' | sed -Ee 's#^./##g' -e 's/.java$//g' | sort -u > ../../../../../../../../../src/main/resources/de/kairos/centraxx/model/service/xml/jaxb.index
cd /c/develop/eclipse/fdm/kairos
find . -type f -iname '*.java' | sed -Ee 's#^.*/##g' -e 's/.java$//g' | sort -u > src/main/resources/de/kairos/centraxx/model/service/xml/jaxb.index 

keytool -importkeystore -srckeystore splitter-test.uksh.de.pfx -srcstoretype pkcs12 -destkeystore splitter-test.uksh.de.jks -deststoretype JKS
keytool -importkeystore -srckeystore merger-test.uksh.de.pfx -srcstoretype pkcs12 -destkeystore merger-test.uksh.de.jks -deststoretype JKS

sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n

sort -t: -k3n

sudo -u tomcat8 for d in `find /var/spool/splitter -mindepth 1 -maxdepth 2 -type d` ; do echo "# $d" >> $d/splitter.properties; done
sudo -u tomcat8 for d in `find /var/spool/merger -mindepth 1 -maxdepth 2 -type d` ; do echo "# $d" >> $d/merger.properties; done

cd /etc/ && cp group group~ && sort -t: -k3n < group~ > group && rm group~
cd /etc/ && cp passwd passwd~ && sort -t: -k3n < passwd~ > passwd && rm passwd~

join --header -t $'\t' -1 1 -2 5 <(sort -t$'\t' -k1 2018-01-11T11.32.51.log.tsv) <(sort -t$'\t' -k5 2018-01-11T11.32.51.tsv) | tee 2018-01-11T11.32.51.join.tsv
join <(sed 1d file1 | sort -k 1b,1) <(sed 1d file2 | sort -k 1b,1) | sort -n

X=foo
Y=X
eval "Z=\$$Y"

tail -n +2 TC.tsv | split --verbose -l 10000 --additional-suffix=.tsv - --filter='sh -c "{ head -n1 TC.tsv; cat; } > $FILE"' TC_

perl -p -i .bak -e "s/-t-mig16/-dev/g" /etc/host* /etc/ssh/*

# file duplicates
fdupes . | tr '\n' ' ' | sed -Ee 's/  /\n/g' | sed -Ee 's/^/mv -v /g' | sh

stat * | grep -v Uid: | grep -iE '(File|Access|Modify|Change):' | tr '\n' '\t' | sed -Ee 's/  File: /\n  File: /g'

setup-x86_64.exe -q -P git,make,gcc-core,gcc-g++,cmake

#error: commit 3f3a0f29cb834a303342ffaacc49c1403cc1362b is a merge but no -m option was given.
#fatal: revert failed
#Completed with errors, see above.

echo -e "\e[37m\e[40"
echo -ne "\033]11;#53186f\007"
echo -ne "\033]10;#ffffef\007"
echo -ne "\033]10;#ffffef\007\033]11;#53186f\007"
echo -ne "\033]10;#ffe0e0\007\033]11;#002000\007" # hellrosa auf dunkelgrün

find . -type f -exec file {} \; | grep -v '~:' | grep -i text | sed -e 's/:.*//g' | xargs cygpath -w | sed -Ee "s#^#sleep 3 \&\& '/c/Program\ Files/jEdit/jedit.exe' '#g" -e "s/$/\' \&/g"
find -iname 'ukshsysi-*t00*.mtp' -type f | sed -Ee 's#^#javaw -jar C:/Programme/mindterm/mindterm.jar --f #g' -e 's/$/ \&/g' | sh

# rserve daemon mode
R CMD Rserve --quiet --vanilla

cat ajksdlk | awk '!seen[$0]++'

. hgtut.sh ssh | grep -v grep | grep sysi | sort | sed -Ee 's/xterm -e //g' -e 's/-X/-Y/g' -e 's/ -l (\w+) / \1@/g' -e 's/ssh /ssh -Y /g' -e 's/ -Y -Y / -Y /g' | sort -u

diff -u -B <(grep -vE '^\s*(#|$)' test1)  <(grep -vE '^\s*(#|$)' test2)

cygpath -u 'C:\Users\t.richter\.grails\2.3.11\projects\transmart\plugins\xnat-viewer-16.2\lib\' | sed -Ee 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' -e 's#((.*)/.*)#\1\n\2#' | sort -u | xargs ls -dl



































