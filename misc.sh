#!/bin/sh
#misc.sh
exit 0
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

#uniq awk gawk
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

# file statistics / dates
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

t.richter@ukshikmb-nw106 ~
$ . hgtut.sh until | grep sysi.local | grep -v grep | grep ConnectTimeout=1 | sort -u
until ssh -o ConnectTimeout=1 trichter@ukshsysi-dt001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-dt002.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-pt001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-pt002.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-tt001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-tt002.sysi.local exit ; do :; done

until ssh -o ConnectTimeout=1 trichter@ukshsysi-do001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-do002.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-po001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-po002.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-to001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-to002.sysi.local exit ; do :; done

until ssh -o ConnectTimeout=1 trichter@ukshsysi-di001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-di002.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-pi001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-pi002.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-ti001.sysi.local exit ; do :; done
until ssh -o ConnectTimeout=1 trichter@ukshsysi-ti002.sysi.local exit ; do :; done

/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-dt001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-dt001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-dt002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-dt002.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-pt001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-pt001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-pt002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-pt002.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-tt001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-tt001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-tt002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-tt002.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-do001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-do001.sysi.local exit ; do :; done )

/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-do002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-do002.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-po001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-po001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-po002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-po002.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-to001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-to001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-to002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-to002.sysi.local exit ; do :; done )

/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-di001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-di001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-di002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-di002.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-pi001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-pi001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-pi002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-pi002.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-ti001.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-ti001.sysi.local exit ; do :; done )
/cygdrive/c/Windows/system32/ping -n 1 ukshsysi-ti002.sysi.local && (until ssh -o ConnectTimeout=1 trichter@ukshsysi-ti002.sysi.local exit ; do :; done )

## Aufräumen:
sudo apt-get autoclean; sudo apt-get clean; sudo apt-get autoremove; 
## Aufräumen:
apt-get autoclean; apt-get clean; apt-get autoremove; 

split --number l/50 --verbose --additional-suffix=.log transmart.log transmart.

grep -R jquery.migrate.js transmart.log | grep -i error | - 's/.*[0-9]{3} (DEBUG|ERROR) //g' | gawk '!seen[$0]++'

head -c 256 /dev/urandom > /c/var/tmp/test/`head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`.data
head -c 256 /dev/urandom > `head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`.rsp.tsv
od -vAn -N1 -td1 < /dev/urandom

# owner permission tree
namei -mo /var/spool/splitter_exchange/from/to/inProgress/done/
namei -mo `pwd`

#root@ukshsysi-pt002:/var/lib/tomcat7/webapps/transmart/js# 
find ../ -regextype posix-extended -iregex '.*/jquery([0-9.-]+)?([.-]?min[.-]?)?\.js' -type f -size +0 | sed -Ee 's#(.*)/[^/]+$#\1/#g' | gawk '!seen[$0]++' | sed -Ee 's#^#ln -s *.js #g' | sh

ls -1 transmart*.war | sed -Ee 's/(.*)/\1 \1/g' -e 's/^/mv -v /g' -e 's/$/_`date +%Y-%m-%dT%H.%M.%S`/g' | sh

c:\develop\eclipse\testProj\target\classes>java VerbindungsTester -host web3-ths-ki.med.uni-greifswald.de

su -l -s /bin/bash tomcat8
head -c 256 /dev/urandom > `head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`.rsp.tsv
head -c 256 /dev/urandom > /var/spool/splitter_exchange/PopGen_PatientList/PopGen_DB/var_spool_`head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`.rsp.tsv
head -c 256 /dev/urandom > /home/exchange/var/spool/splitter_exchange/PopGen_PatientList/PopGen_DB/home_exchange_var_spool_`head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`.rsp.tsv

cd ~/MindTerm/ ; find . -iname 'ukshsysi-*t002*.mtp' -type f | grep -- "-[tp]t00" | sed -Ee 's#^#javaw -jar C:/Programme/mindterm/mindterm.jar --e --f #g' -e 's/$/ \&/g' | sh

export PATH="/c/Program Files/Docker Toolbox:/c/Program Files/Oracle/VirtualBox":$PATH

t.richter@ukshikmb-nw106 ~/AppData/Roaming/jEdit/modes (master)
$ /c/Program\ Files/Git/usr/bin/winpty --help
      5 [main] winpty (5376) C:\Program Files\Git\usr\bin\winpty.exe: *** fatal error - cygheap base mismatch detected - 0x1802FD410/0x180301410.
This problem is probably due to using incompatible versions of the cygwin DLL.
Search for cygwin1.dll using the Windows Start->Find/Search facility
and delete all but the most recent version.  The most recent version *should*
reside in x:\cygwin\bin, where 'x' is the drive on which you have
installed the cygwin distribution.  Rebooting is also suggested if you
are unable to find another cygwin DLL.
Segmentation fault

export PATH="/c/Users/t.richter/AppData/Local/Atlassian/SourceTree/git_local/usr/bin":$PATH

echo -e "Ein \033[0;34mblaues Huhn\033[0m. Das ist wieder normaler Text."
echo -e "Ein \e[0;34mblaues Huhn\e[0m. Das ist wieder normaler Text."
echo "Ein ^[[0;34mblaues Huhn^[[0m. Das ist wieder normaler Text."
echo -e "Ein \033[0;34m\033[41mblaues Huhn\033[0m sitzt gerne auf roten Sachen."

#parent dir
dirname .

find /c/ -maxdepth 6 -mindepth 3 -iname .git -type d 2>/dev/null | xargs dirname | grep -Ev '~$|/tmp/|[0-9]{8,16}' | sed -Ee 's/^/cd /g' -e 's/$/ ; git pull/g' | sh

echo '12345678|ABN\|XYZ MED CHEM PTY. LTD.|C||100.00|22|AB"C\|Corp|"XYZ|CDEF"|'| awk 'BEGIN{FS=OFS="|"}{print $1, $4, $2, $3, $7, $8, $9, $5, $6, $10, $11, $12}'
seq 10 | | while read x; do    echo $RANDOM:$x done | sort -t: -k1 -n | sed 's/^[0-9]*://'

alias beep="echo -ne '\007'"
alias beep="echo -ne '\a'"

mv -v tm_batch_done.log tm_batch_done.log~ ; sort < tm_batch_done.log~ | uniq > tm_batch_done.log
history | grep tm_batch | cut -b8- | uniq | grep -Ev 'alias|grep|cat|diff|sort' | sort | sed -Ee 's#\|.*##g' -e 's#^time ##g' -e 's# $##g' | tee -a tm_batch_done.log
find /home/sysinflame/data -iname '*.params' -type f | grep -E 'clinical|anno|expression|rna' | sed -s 's#^#tm_batch -p #g' | sort | tee tm_batch_todo.log
alias tm_batch_n='java -jar -Xms1024m -Xmx4096m /home/sysinflame/transmart-batch/transmart-batch-16.2-capsule_INFO.jar -c /home/sysinflame/transmart-batch/batchdb.properties -n '
alias tm_batch='java -jar -Xms1024m -Xmx4096m /home/sysinflame/transmart-batch/transmart-batch-16.2-capsule_INFO.jar -c /home/sysinflame/transmart-batch/batchdb.properties '

# find broken symlinks
find /home/ -xtype l -exec rm -vrf {} \;

sdk ls grails | grep '\*' | sed -Ee 's# {2,}#\n#g' | grep '\*'
sdk ls groovy | grep '\*' | sed -Ee 's# {2,}#\n#g' | grep '\*' | sed -Ee 's/^ ?> //g' | sort

for f in `find ~/Downloads/ -mindepth 2 -iname '*.exe' | sed -Ee 's#(.*/).*#\1#g' | sort -u` ; do export PATH="$f:$PATH" ; done

for d in `echo -e "sda2\nsdb1\nsdb2"` ; do echo "$d"; mkdir -vp /mnt/$d; mount /dev/$d /mnt/$d; done
for d in `echo -e "sda2\nsdb1\nsdb2"` ; do echo "$d"; mkdir -vp /mnt/$d; mount /dev/$d /mnt/$d; done

mount vm-site-dc01-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs
kpartx -av <image-flat.vmdk>; mount -o /dev/mapper/loop0p1 /mnt/vmdk

find . -type f -name "*.csv" -print0 | while IFS= read -r -d '' file; do echo "file = $file" ; done

############################
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in *
do
  echo "$f"
done
IFS=$SAVEIFS
############################

############################
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
# set me
FILES=/data/*
for f in $FILES
do
  echo "$f"
done
# restore $IFS
IFS=$SAVEIFS
############################

find -type f -iname '*.csv.orig.csv' -print0 | while IFS= read -r -d '' file; do echo "$file" | sed -Ee 's/^\.\/(.*).csv.orig.csv/sort -u < \1.csv.orig.csv > \1.csv/g'; done > tmp.sh

find . -maxdepth 1 -regextype posix-extended -iregex '\./.+ .+\.(csv|tsv)' -type f | xargs scramble.sh
find /var/ -maxdepth 8 -type f -mtime -2 2>/dev/null | xargs dirname | sort -u | xargs ls -ld
find /home/sysinflame/data -iname '*.params' -type f | sed -Ee 's/^/time tm_batch_n -p /g' -e 's#(.* /home/sysinflame/data/(.*))#\1 | tee -a \2.log#g' -e 's###g'

sdk ls | grep -P '(?<=\()\d+\..+(?=\))'

# System settings Think!EHR makes heavy use of mmap. In order to have enough resources the following two settings need to be set:
ulimit -m unlimited
ulimit -v unlimited
# Think!EHR index backend needs to open very many files. It is important to set maximum number of open files to 32k or even better, 64k:
ulimit -n 65536

true && echo "true" || echo "false"
test -d current && echo "true" || echo "false"

find ~/.sdkman/ -iname current | xargs cygpath -w | grep current | sed -Ee 's/(.*candidates\\([a-z]+)\\current)/setx \2_HOME \1/g'

echo $PATH | tr ':' '\n' | xargs -d '\n' cygpath -w
set | grep -E "^[A-Z].*_HOME=.*" | sed -e 's/=.*//g'
set | grep -E "^[A-Z].*_HOME=.*" | sed -e 's/=.*//g' | sed -e 's/^/%/g' -e 's/$/%\\bin/g'| tr '\n' ';' | sed -e 's/^/HOMES_BINS=/g'

setup.exe -q -n -N -d -R c:\cygwin -s http://yourFavoriteMirror -l c:\localPackageDir -P  <comma-separated list of packages to install>
setup-x86_64 -q -n -N -d -P xhost
setup-x86_64 -q -n -N -d -P wget,curl
setup-x86_64 -q -n -N -d -f
#repeat
printf '[0-9a-fA-F]%.0s' {1..32}

cat *.hl7 | tr '[\r\n\f]' '\n' | grep MSH | cut -d'|' -f9 | cut -d'^' -f3

cygcheck -p perl-XML | grep -i perl | grep -v -- -src | sed -Ee 's/Found [0-9]+ matches for [a-z0-9A-Z -]+//g' -e 's/ - .*//g' -e 's/-[0-9.-]+$//g' | uniq2 | sed -e 's/$/,/g' | fmt -w 222 | sed -Ee 's/, /,/g' -e 's/,$//g' -e 's/^, ?//g' -e 's/^/setup-x86_64 -q -n -N -d -P /g'

usermod -a -G examplegroup exampleusername
usermod -a -G group1,group2,group3 exampleusername
usermod -a -G root,postgres,openbis,sysinflame trichter

perl -p -i.bak -e 's/popgen.new.patient/popgenIDAT_to_tempPSN/g'
# grep
perl -wln -e "/RE/ and print;" foo.txt 
# grep -v
perl -wln -e "/RE/ or print;" foo.txt
perl -wln -i.bak -e "/auth-method|port|private-key|server|sftpbridge-host|sftpbridge-hosttype|sftpbridge-port|username/ and print;"

perl -ne 'print unless $seen{$_}++' data.txt # uniq
perl -wln -i.bak -e 'print unless $seen{$_}++' ~/.bash_history # uniq
awk '!seen[$0]++' # uniq

find . -type d -empty -delete

cat ORU.HL7 | tr '\n\r' '\n' | iconv -f iso-8859-1 -t UTF-8 | grep -a OBX | cut -d'|' -f4 | cut -d^ -f 1 | sort | uniq -c | sort -n

ifconfig | grep -A4 eth | grep addr: | sed -Ee 's/\s{2,}/\n/g' | grep inet | egrep '[0-9]+(\.[0-9]+){3}'
ifconfig | grep -A6 eth | grep addr: | egrep '[0-9]+(\.[0-9]+){3}' | tr '[:space:]' '\n' | grep addr

aptitude search '~i postgres'

ls *o00* | sed -e 's/\.mtp//g' | xargs -n1 nslookup | grep -A2 Name

# use DISPLAY=:0.0, rather than DISPLAY=localhost:0.0, DISPLAY=127.0.0.1:0.0, DISPLAY=::1:0.0, etc
export DISPLAY=:0.0 

startxwin -- -listen tcp

perl -wln -i.bak -e '/symlinks = / or print;' /c/develop/eclipse/fdm/.git/config
find /c/develop/ -regextype posix-extended -iregex '.*/.git/config' -type f | xargs perl -wln -i.bak -e '/symlinks = / or print;' 


cp xxx.log xxx.`date +%Y%m%d%H%M%S`.log
cp xxx.log xxx.`date +%Y-%m-%dT%H.%M.%S`.log

export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

sort -k2b,2 -k1,1 <people.txt
sort -t $'\n' -k 1.8,1.11 infile
. hgtut.sh java | grep -i mindterm | grep jar | grep -v find | grep o00 | sort -t $'\n' -rk 1.66,1.66 -nk 1.68,1.69


BASENAME=`basename $FILE`
echo $BASENAME
DIRNAME=`dirname $FILE`
echo $DIRNAME
echo "${FILE#*.}"
#tar.gz
echo "${FILE##*.}"
#gz
mktemp
find jdk_dir -name "*.pack" -exec sh -c 'jdk_dir/bin/unpack200 -r "{}" "$(dirname "{}")/$(basename "{}" .pack).jar"' \;
mv -v splitter.properties splitter.properties.old ; ((echo "# "$(pwd); cat splitter.properties.old ) | uniq ) > splitter.properties

chown -cR tomcat8.tomcat8 /var/lib/tomcat8/
sudo -u tomcat8 bash                                                                                                        
export HOME=/var/lib/tomcat8/

#root@splitter-test:/home/trichter# chown -cR tomcat8.tomcat8 /var/lib/tomcat8/
#changed ownership of '/var/lib/tomcat8/work' from root:root to tomcat8:tomcat8
#changed ownership of '/var/lib/tomcat8/bin/setenv.sh' from root:root to tomcat8:tomcat8
#changed ownership of '/var/lib/tomcat8/bin' from root:root to tomcat8:tomcat8
#changed ownership of '/var/lib/tomcat8/logs' from root:root to tomcat8:tomcat8
#changed ownership of '/var/lib/tomcat8/conf' from root:root to tomcat8:tomcat8
#changed ownership of '/var/lib/tomcat8/' from root:root to tomcat8:tomcat8

openssl x509 -inform PEM -outform DER -in ca_cert.crt -out ca_cert_der.crt
openssl x509 -inform PEM -outform DER -in isrgrootx1.pem -out isrgrootx1.crt

java -Djavax.net.ssl.trustStore=643.jks \
-Djavax.net.ssl.trustStorePassword=password \
-Djavax.net.ssl.keyStore=1203.jks \
-Djavax.net.ssl.keyStorePassword=password \
-classpath bcmail-jdk16-1.46.jar:bcprov-jdk16-1.46.jar:commons-lang-2.4.jar:hapi-base-2.1-alpha1.jar:hapi-hl7overhttp-2.1-alpha1.jar:hapi-structures-v21-2.0.jar:hapi-structures-v22-2.0.jar:hapi-structures-v23-2.0.jar:hapi-structures-v231-2.0.jar:hapi-structures-v24-2.0.jar:hapi-structures-v25-2.0.jar:hapi-structures-v251-2.0.jar:hapi-structures-v26-2.0.jar:hapi-testpanel-2.0.1.jar:jsyntaxpane-0.9.6-hapi2.jar:log4j-1.2.16.jar:org-netbeans-swing-outline-RELEASE701.jar:org-openide-awt-RELEASE701.jar:org-openide-filesystems-RELEASE701.jar:org-openide-util-RELEASE701.jar:org-openide-util-lookup-RELEASE701.jar:slf4j-api-1.6.6.jar:slf4j-log4j12-1.6.6.jar \
ca.uhn.hl7v2.testpanel.App

dpkg -l | tail -n +6 | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r) | grep ii

openssl s_client -showcerts -connect $TARGET < /dev/null 2> /dev/null | sed -n '/^-----BEGIN CERTIFICATE-----$/,/^-----END CERTIFICATE-----$/{/BEGIN /h;/BEGIN /!H};${g;p}'

# show tcp ports
netstat -tulpn | grep LISTEN
netstat -alpn | grep -i docker
lsof -i -P -n | grep LISTEN

ssh-keygen -t rsa

mkdir -p ~/.ssh
#Nun kopieren wir unseren, im ersten Schritt erstellten Schlüssel, auf den Server. Dazu wechseln wir wieder in unser lokales Linux Terminal

cat ~/.ssh/id_rsa.pub | ssh root@server.de 'cat >> .ssh/authorized_keys'
cat ~/.ssh/id_rsa.pub | ssh root@server.de 'cat >> ~/.ssh/authorized_keys'

# random / entropy
sudo apt install rng-tools 
sudo apt install rng-tools5
rngtest -c 1000 </dev/random

apt update && apt -y upgrade
apt autoremove && apt clean

#You can easily solve this using SSLPassPhraseDialog (apache)
#  SSLPassPhraseDialog  exec:/etc/httpd/conf/pwf.sh
# pwf.sh file contents
# #!/bin/sh
echo password

#For example, this shell command will set the window to 100x50 characters: (resize)
printf '\e[8;50;150t'
echo -ne "\e[8;50;150t"

# install ansible cyg dep
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
python -m pip install -U pip wheel setuptools
apt-cyg install binutils curl gcc-core gmp libffi-devel libgmp-devel make git nano openssh openssl openssl-devel

#hen do pkcs8 with -topk8 to convert this key from traditional format to pkcs#8 format.
openssl pkcs8 -topk8 -inform pem -in file.key -outform pem -nocrypt -out file.pem

curl http://myip.dnsomatic.com

openssl pkcs12 -export -out client_certificate.p12 -inkey private-key.pem -in certificate.pem -certfile ca_certificate.pem
openssl pkcs12 -export -out dsf-bpe-test.p12 -inkey dsf-bpe-test.key -in cert-11549486750155167184402693899-dsf-bpe-test.pem

# cygwin url
cmd /c start "https://google.de/"
cygstart "https://google.de/"

curl http://myip.dnsomatic.com

ssh -o ProxyCommand="ssh -W %h:%p trichter@172.26.240.133" 192.168.0.10
ssh -o ProxyCommand="ssh -W %h:%p trichter@172.26.240.133" root@192.168.0.10
ssh -J trichter@172.26.240.133 root@192.168.0.10

zip -q -d log4j-core-*.jar org/apache/logging/log4j/core/lookup/JndiLookup.class

traceroute -T -p 22 172.26.240.83
traceroute -T -p 443 terminology-highmed.medic.medfak.uni-koeln.de

apt install apt-file
apt-file update
apt-file search 50unattended-upgrades
# unattended-upgrades: /usr/share/unattended-upgrades/50unattended-upgrades
dpkg -S 50unattended-upgrades
apt install --reinstall -o Dpkg::Options::="--force-confask,confnew,confmiss" unattended-upgrades
apt-get -o Dpkg::Options::="--force-confmiss" install --reinstall unattended-upgrades

wget --no-check-certificate --certificate=/home/ubuntu/cert-2022-03/dsf-bpe-test.medfdm.uni-kiel.de-geant-ov-rsa-ca-4.cer --private-key=/home/ubuntu/cert-2022-03/dsf-bpe-test.medfdm.uni-kiel.de-geant-ov-rsa-ca-4.pkcs8 https://terminology-highmed.medic.medfak.uni-koeln.de/fhir/metadata

# line end newline cr
tail -c 2 file | od -An -vtc

# variab replace
taskfile=task.data-send.xml
id=$1
sed -i -r "s;/fhir/Patient/([-[:alnum:]]+);/fhir/Patient/${id};" ${taskfile}

ls *.log | sed -Ee 's/(.+)\.(.+)/mv -v \1.\2 \1.$(date +%Y%m%d%H%M%S).\2/g'

curl -H "Accept: application/fhir+xml" -H "Content-Type: application/fhir+xml" -d @fhir_transaction_bundle_decentral.xml https://127.0.0.1:8081/fhir

echo "n" | sdk upgrade | sed_removeesc_format.sh | grep -v java | grep local | col -bx | sed -Ee 's/[ \t].*/ ; /g' -e 's/^/echo y | sdk upgrade /g' | tr '\n' ' ' 

'while /bin/true; do ; done'

apt dist-upgrade 
fuser -vki /var/lib/dpkg/lock #?
apt purge snapd
dpkg --configure -a
apt update
apt upgrade
apt dist-upgrade # 
apt install xxx

# mailx
apt update && apt install -y msmtp msmtp-mta bsd-mailx
echo -e "root: th.richter@uksh.de\ndefault: th.richter@uksh.de\n" > /etc/aliases
cat <<EOF > /etc/msmtprc
account default
host alfa3210.alfahosting-server.de
port 587
auth on
tls  on
tls_starttls on
from sysmail+$HOSTNAME@mi-ki.eu
user web25942223p11
password (s. KEEPASS)
aliases /etc/aliases
syslog on
EOF
echo -e "set mta=/usr/bin/msmtp\n" >> /etc/mail.rc
cat /etc/lsb-release | mail -s test th.richter@uksh.de
mkdir -pv /root/bin/ && touch /root/bin/daily_report.sh && chmod -c u+x /root/bin/daily_report.sh
0 */4 * * * * /root/bin/daily_report.sh | mailx -s "misc-Prod: Daily report" th.richter@uksh.de

docker logs --details --since=7d -t fhir_proxy_1

# remove escape seq
ansifilter
sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"

#
#--data @start-ping.json \
curl -vv --cert certs/client.crt --key certs/client.key -k --data @getOrCreatePseudonymFor01.xml https://psn01-test/gpas/gpasService?wsdl

docker ps --format "table {{.Image}}\t{{.Status}}\t{{.RunningFor}}\t{{.Names}}\t{{.Ports}}"
watch docker ps --format \"table {{.Image}}\\t{{.Status}}\\t{{.RunningFor}}\\t{{.Names}}\\t{{.Ports}}\"
#"

#timedatectl
timedatectl
sudo timedatectl set-timezone Europe/Berlin
timedatectl

# wirksam?
export MSYS=winsymlinks:nativestrict

tar --delete --wildcards -f gpas-v2023.1.0-compose-wildfly.tar '*/*.{war,ear}'

#ntp date time
timedatectl 
sudo timedatectl set-ntp true
systemctl status systemd-timesyncd.service
sudo systemctl restart systemd-timesyncd.service

usermod -a -G root,docker,fhir,bpe trichter

echo quit | openssl s_client -showcerts -servername server -connect server:443 > cacert.pem
echo quit | openssl s_client -showcerts -servername pseudonymize.distan.medicsh.de -connect pseudonymize.distan.medicsh.de:443 > ca_pseudonymize.distan.medicsh.de.pem

systemctl stop msmtpd
systemctl edit msmtpd
systemctl cat msmtpd
systemctl daemon-reload
systemctl enable msmtpd
#systemctl reload msmtpd
#systemctl restart msmtpd
systemctl start msmtpd
systemctl status msmtpd

find / -maxdepth 3 -iname docker-compose.yml -type f | xargs grep -i image | sed -Ee 's/    image: "?/docker pull /g' -e 's/:.*"?/:latest/g'

# rename docker volume
docker volume create --name new_volume && \
  docker run --rm -it -v old_volume:/from -v new_volume:/to alpine ash -c 'cd /from ; cp -av . /to' && \
  docker volume rm old_volume

#Use the following command to truncate the log file of the specified Docker container.
truncate -s 0 $(docker inspect --format='{{.LogPath}}' <container_name_or_id>) 

curl 
wget -v  --no-check-certificate --user=th.richter@uksh.de --password=$PW https://portal.popgen.de/transfer_requests/full_pdf/349.pdf

curl -v --cert client_certificate.pem --key client_certificate_private_key.pem https://dsf-fhir-ext.medicsh.de/fhir/metadata

diff -yW 240 --color bpe_0.9/docker-compose.yml bpe/docker-compose.yml | less

sdk list java | grep -iE "zulu|open|oracle|amzn"

#
read PASS
export PASS
export USER=lkasjdlksa
curl --user $USER:$PASS

cat metadata | sed -Ee 's/,/,\n/g' | grep -iE '^"fhirversion"|^"status"|^"version"'

ls *.log | grep -Ev '[0-9]{10,12}' | sed -Ee 's/(.+)\.(.+)/mv -v \1.\2 \1.$(date +%Y%m%d%H%M%S).\2/g' | sh

while true; do docker compose logs -ft; done

pip install --upgrade referencing --no-input --no-color --no-python-version-warning --no-cache

# [notice] A new release of pip is available: 24.1 -> 24.1.1
# [notice] To update, run: 
python.exe -m pip install --upgrade pip

pip-review --auto

(pslist java; pslist TOS_) | grep : | grep -v information | gawk '{print $2}' | sed -Ee 's/^/jcmd /g' -e 's/$/ GC.run/g'  | sh



