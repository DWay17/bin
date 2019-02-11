REM both apps/wars on one server
mkdir c:\var\spool\exchange\
mklink /j c:\var\spool\splitter_exchange c:\var\spool\exchange\
mklink /j c:\var\spool\merger_exchange c:\var\spool\exchange\
REM use one time communication (splitter intermediate result (*.mrg) as merger result) 
mklink /j c:\var\spool\merger c:\var\spool\merger_exchange\

REM 172.16.4.228:/mnt/exchange
REM 172.16.4.228:/mnt/exchange on /var/spool/splitter_exchange type nfs (rw,relatime,sync,vers=3,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=172.16.4.228,mountvers=3,mountport=38765,mountproto=udp,local_lock=none,addr=172.16.4.228)
REM mount [Optionen] //[Servername oder IP-Adresse]/[Freigabe] [Laufwerksbuchstabe]
mount //172.16.4.228//mnt/exchange X:
mount -o timeout=600 -o rsize=131072 -o wsize=131072 -o casesensitive=yes -o sec=sys -o anon //172.16.4.228//mnt/exchange X:
REM Ungültiger timeout-Wert. Die Zeitüberschreitung (in Sekunden) muss entweder 0,8 oder 0,9 betragen bzw. zwischen 1 und 60 liegen.
mount -o timeout=60 -o rsize=131072 -o wsize=131072 -o casesensitive=yes -o sec=sys -o anon //172.16.4.228//mnt/exchange X:
REM Ungültiger rsize-Wert. Lesepuffergröße (in KB) muss entweder 1, 2, 4, 8, 16 oder 32 betragen.
mount -o timeout=60 -o rsize=32 -o wsize=32 -o casesensitive=yes -o sec=sys -o anon //172.16.4.228//mnt/exchange X:
telnet 172.16.4.228 111
telnet 172.16.4.228 694
telnet 172.16.4.228 2049
nmap -sU -sV -v 172.16.4.228
nmap -sU -sV -v 172.21.98.211
mkdir c:\etc\
mkdir c:\var\log\fdm
mkdir c:\var\tmp\splitter\PopGen_PatientList\PopGen_DB
mkdir c:\var\tmp\splitter\PopGen_DB\fdm_i2b2

%JAVA_HOME%  