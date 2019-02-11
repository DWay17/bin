#
# HOME NEWS ARTIKEL EVENTS VIDEOS JAVA MAGAZIN W-JAX 2018 SUCHE
#
# Java DevOps Microservices Docker Blockchain Internet of Things
# Eclipse Android Agile Machine Learning Happy Birthday, Linux:
# Am 17. September 1991 erblickte Linux 0.01 das Licht der Welt
#
# W-JAX 2018: 5. bis 9. November in München
#
#
# Grundkurs Docker: Eine praktische Einführung in die Welt der
# Container
#
#
# Blockchain Technology Conference: 19. bis 21.11, Berlin
#
# Docker in production Grundkurs Docker: Eine praktische Einführung
# in die Welt der Container #Container #Docker #Tutorial
#  6. September 2017  Gianluca Arbezzano
# © Shutterstock / MicroOne © Shutterstock / MicroOne
#
# Keine andere Technologie hat die IT in den letzten Jahren so geprägt
# wie Docker. Doch warum ist das so? Was macht Docker so besonders,
# wie funktioniert die Technologie unter der Haube und wie können
# Sie vom Trend profitieren? In unserem Grundkurs Docker lernen Sie
# anhand praktischer Beispiele, Docker und die Container-Technologie
# richtig einzusetzen.
#
# In diesem mehrteiligen Tutorial gibt Docker Captain Gianluca
# Arbezzano eine Einführung in die Container-Technologie
# Docker. Behandelt werden die grundlegenden Mechanismen der
# Linux-Container, die Funktionsweise der Docker Engine und die
# Container-Orchestrierung in verteilten Systemen. Erfahren Sie in
# diesem Kurs alles, was Sie zum Einstieg in Docker wissen müssen.
#
# Dieser Kurs ist Teil des Buchprojektes „Docker in Production“, das
# aktuell unter scaledocker.com entsteht. Im ersten Kapitel ging es
# darum, welche technologischen Grundlagen aus dem Linux-Ökosystem
# jeder kennen sollte, der mit Docker arbeiten möchte. In diesem
# Teil zeigt unser Autor, wie man Docker auf den unterschiedlichen
# Betriebssystemen zum Laufen bringt und wie die Docker Engine an
# sich eigentlich architektonisch aufgebaut ist. Im praktischen Teil
# führt er die Leser an die wichtigsten und am häufigsten genutzten
# Befehle heran und stellt unter anderem das Command Line Interface
# anhand von Beispielen vor.
#
# Kann ich noch immer über zwei oder drei Männer springen, so ich es
# früher konnte? Nein. Bin ich noch immer so schnell, wie ich es mal
# war? Nein. Aber ich beherrsche noch immer die Grundlagen und die
# Technik. So kann ich das Spiel weiterhin dominieren. Schon als Kind
# habe ich nie einen Schritt auf dem Weg übersprungen – ich habe mir
# eine Basis erarbeitet, weil Sportlichkeit eine flüchtige Sache ist.
#
# Kobe Bryant
#
# Fangen wir also an, die große Docker-Welt zu erkunden. Warum hat
# Docker eine so große Revolution ausgelöst; warum revolutionieren
# Container überhaupt die gegenwärtige IT-Szene? Diese Fragen wollen
# wir nun beantworten. In diesem Kapitel befassen wir uns mit der
# Docker Engine, denn sie ist die zentrale Anwendung, die es uns
# ermöglicht, Docker Container zu erstellen und zu managen. Die
# Docker Engine ist Open Source und wurde in der Programmiersprache Go
# geschrieben – mit mehr als 27.000 Commits und rund 1.500 Contributors
# handelt es sich hierbei um eines der größten Open-Source-Projekte
# der Welt.
#
#
# Docker Container Virtualization / Quelle: Docker Inc.
#
# Die Abbildung zeigt grob, wie die Docker Engine funktioniert:
# Sie befindet sich zwischen dem Betriebssytem (OS) und unseren
# Anwendungen. Docker Container basieren auf Linux, sodass ein
# Linux-Kernel nötig ist, um mit Docker zu arbeiten. Bei mir bildet
# ein MacBook Pro die lokale Umgebung; viele der Beispiele in diesem
# Buch laufen darauf in einer virtuellen Maschine, die ich mit Virtual
# Box betreibe.
#
# Docker auf Ubuntu installieren Dies ist eine interaktive Anleitung;
# neben der Lektüre können alle hier erklärten Arbeitsschritte direkt
# auch selbst mitgemacht werden. Darum beginnen wir damit, wie man
# Docker auf dem eigenen Laptop installiert. Auf Ubuntu geht es mit
# ein paar einfachen Schritten los; es gibt aber auch Implementierungen
# für andere Linux-Distributionen.
#
# 1. Repositories aktualisieren


sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
   --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# 2. Wenn die Datei nicht existiert, kann man sie mit seinem
# bevorzugten Editor erstellen


/etc/apt/sources.list.d/docker.list

# 3. Folgende Zeile muss in die Datei kopiert werden:

deb https://apt.dockerproject.org/repo ubuntu-xenial main

# 4. APT Index aktualisieren

sudo apt-get update

# 5. Docker installieren

sudo apt-get purge lxc-docker
sudo apt-get install linux-image-extra-$(uname -r) \
   linux-image-extra-virtual docker-engine

# 6. Docker Daemon starten

sudo service docker start

# 7. Den ersten Container starten

sudo docker run hello-world

# Docker stellt grundsätzlich eine gute Dokumentation für die
# Installation auf Linux bereit; wer aber mit einem MacBook oder
# unter Windows arbeitet, findet in den nächsten zwei Absätzen eine
# Installationsanleitung [1].

# Docker auf dem Mac installieren Docker for Mac [2] ist ein Tool,
# das die Verwendung der Docker Engine unter MAC OS X erleichtert. Es
# handelt sich um eine einfache dmg, die direkt von der Seite
# heruntergeladen und auf dem MacBook installiert werden kann.

# Sobald das Programm läuft, kann Docker auf dem Terminal genutzt
# werden. Hierzu wird es einfach geöffnet, anschließend wird folgender
# Befehl ausgeführt:

sudo docker run hello-world

# Docker auf Windows installieren Auf Windows kann man sich die
# Benutzung von Docker in der Entwicklungsumgebung auf die gleiche
# Weise vereinfachen: Man muss lediglich das Tool Docker for Windows
# herunterladen [3], es als klassische Anwendung installieren und
# schon kann man anfangen, mit Docker zu spielen.

# Man sollte allerdings im Kopf behalten, dass Docker, trotz dieser
# beiden Lösungen, Linux benötigt, um zu funktionieren. Sowohl Docker
# for Mac als auch Docker for Windows arbeiten mit einer virtuellen
# Maschine und einem gemeinsamen Layer, der die Arbeit mit Docker
# genauso gestaltet wie unter Linux.

# Die erste HTTP-Anwendung ausführen Micro [4] ist ein in der
# Programmiersprache Go geschriebener Dienst, der in Form einer sehr
# kleinen Anwendung, zwei HTTP-Zugangspunkte zur Verfügung stellt. Der
# Index zeigt die Container-IP an; außerdem kann über /health überprüft
# werden, ob der Service wie erwartet funktioniert. Der Dienst läuft
# auf Port 8000.

docker run -p 8000:8000 gianarb/micro:1.0.0

# run ist einer der wichtigsten Befehle in der Docker Engine. Er
# startet einen neuen Container in Form eines Images, das in diesem
# Fall auf gianarb/micro version 1.0.0 basiert. Mit -p kann ein
# Port vom Container an den Host weitergegeben werden. In diesem
# Fall kontaktieren wir so den HTTP-Server. Jetzt ist die Seite
# localhost:8000 im Browser erreichbar.

# Die Architektur der Docker Engine Wir haben bereits die Begriffe des
# Images, der Container, der Command Line und des Daemons benutzt;
# bevor wir weitermachen, schauen wir uns nun an, wie die Docker
# Engine aufgebaut ist, um die Architektur und Terminologie zu
# verstehen. Docker besteht aus zwei zentralen Bestandteilen, nämlich:

# dem HTTP-Server, der in der Praxis das Backend bildet, das ein REST
# API zur Integration von Anwendungen in die Engine zur Verfügung
# stellt und dem Docker CLI, einem Command Line Tool, das das API
# verwendet, um alle Funktionen leicht benutzbar zu machen.

# Die Docker-Architektur / Quelle: Docker Inc.

# Seit Docker 1.11 sind der Daemon und das CLI getrennte Binaries,
# die man zusätzlich zur Engine installieren oder weglassen kann, je
# nach eigenem Bedarf. Diese Lösung ist auch gut für die Produktion
# geeignet, wo es möglich ist, nur der Daemon zu installieren.

# Der Docker Daemon kann unmittelbar mit dem Kommando
# dockerd aufgerufen werden. Er unterstützt verschiedene
# Kommunikationsprotokolle und öffnet standardmäßig einen Unix Socket
# unter unix:///var/run/docker.sock. Es gibt zahlreiche Möglichkeiten,
# dem Befehl etwas anzuhängen, zum Beispiel:

# -D, um den Debug-Modus freizugeben, -H, zur Konfiguration des
# tcp-Hosts, beispielsweise tcp://192.168.1.3:2376 und -tls, um TLS
# zu aktivieren bzw. zu deaktivieren. Der Standardwert lautet false;
# für die Produktion ist die Aktivierung aber sehr empfehlenswert.

dockerd -D -H tcp://192.168.1.3:2376 --tls=false

# Denkt daran, dass ein Prozessmanager die beste Lösung für
# das Management von Prozessen und Services darstellt. Jede
# Linux-Distribution bringt ihr eigenes Tool dafür mit; für Ubuntu,
# Fedora und CentOS sind das Upstart und systemd.

# Während des Setups auf den verbreiteten Linux-Distributionen,
# beispielsweise im Fall der drei vorgenannten, richtet Docker ein
# allgemeines Init-Standardskript ein, das nachfolgend an die eigenen
# Anwendungsfälle angepasst werden kann. In Ubuntu 15.04 kann die
# Datei unter in /etc/init.d/docker gefunden werden. Sie enthält alle
# notwendigen Funktionen zum Prozessmanagement wie start, restart
# und stop.

# Image und Registry Um das Innenleben von Docker zu verstehen,
# müssen wir uns nun zwei weitere Konzepte genauer anschauen: Image
# und Registry. Jeder Container wird aus einem Basis-Image erstellt,
# einem Read-Only Template, das beispielsweise die Anwendung oder eine
# Basisversion von Ubuntu enthält. Images können aus Containern oder
# anderen Images mit einem Dockerfile erstellt werden. In folgendem
# Beispiel ziehen wir nginx aus dem offiziellen Repository:

docker pull nginx

# Wir laden jetzt ein offizielles Image aus dem Hub herunter; davon
# stehen dort viele zur Verfügung. Offiziell bedeutet in diesem
# Fall, dass bestimmte Organisationen oder Unternehmen die Images
# erstellt haben und pflegen, etwa für nginx, Ubuntu, Debian, Redis,
# Apache, PHP plus, und dass sie diese Images zur Erstellung von
# Containern freigegeben haben. Aus diesen Schichten wird dann das
# Dateisystem zusammengestellt – die Downloads werden von Docker
# parallel verwaltet,was den Pull unterm Strich effizienter und
# schneller macht..

docker run -d --name demo_nginx -p 80:80 nginx
docker ps

# Nun haben wir das Image, das jemand anderes erstellt hat und
# haben daraus einen neuen Container erstellt. Wenn man jetzt den
# Browser öffnet und localhost:80 aufruft, sieht man, dass dort nginx
# läuft. Den Container selbst können wir wie folgt direkt aufrufen:

docker exec -it demo_nginx /bin/bash

# Änderungen an index.html müssen gespeichert werden, damit sie
# erhalten bleiben. Dazu wird eine neue Schicht auf Basis der aktuellen
# erstellt. Wird auf das Speichern verzichtet, gehen alle Änderungen,
# die in einem laufenden Container gemacht wurden, verloren. Das
# Kommando zum Speichern kann außerhalb des vorherigen Containers
# ausgeführt werden:

docker commit demo_nginx my/nginx

# Nun haben wir eine neue Schicht erstellt. Das Image my/nginx kann als
# Ausgangspunkt für andere Images dienen oder auf den Server deployed
# werden. Die geänderten Images werden von oben nach unten gelesen;
# wenn wir index.html zweimal verändern und committen, wird nur die
# neueste Version angezeigt.

# UnionFS [5] ist ein Filesystem-Dienst für Linux, der einen
# Union Mount für andere Dateisysteme erstellt, um Dateien und
# Verzeichnisse als Branches zu mergen und ein virtuelles Dateisystem
# zu erstellen. Docker nutzt diese Technologie, um Images zu splitten
# und zu mounten. Jedes Image baut auf etwas anderem auf; die so
# entstandenen Schichten werden nicht kopiert, sondern wiederverwendet,
# wenn sie notwendig sind. Auf der obersten Schicht kann geschrieben
# werden. Sie wird beim Start des Containers hinzugefügt und stellt
# den zentralen Unterschied zwischen Images und Containern dar,
# denn Images haben keine solche Schicht. Loggt man sich in einen
# Container ein und nimmt dort via su Änderungen vor, die man ohne
# Commit löscht, gehen diese Änderungen verloren.

# DevOpsCon Whitepaper 2018 Free: 40+ pages of DevOps expert knowledge
# Learn about Containers,Continuous Delivery, DevOps Culture, Cloud
# Platforms & Security with articles by experts like Kai Tödter
# (Siemens), Nicki Watt (OpenCredo), Tobias Gesellchen (Europace AG)
# and many more.

# Download whitepaper for free Images können auch auf eine andere
# Art erstellt werden. Am besten ist die Verwendung von Dockerfiles,
# weil darin alle nötigen Kommandos und Informationen enthalten
# sind. Wenn ein Container ohne Dockerfile aus dem interaktiven
# Modus heraus erstellt wird, müssen alle Kommandos direkt in den
# Container eingefügt werden. Der Container muss dann bereits nach
# kurzer Zeit committed werden und kann danach nicht repliziert oder
# aktualisiert werden. Das Dockerfile ist im VCS normalerweise in der
# Nähe der Anwendung zu finden, beispielsweise in der Anwendung Micro
# [6]. Alternativ kann man ein Repository mit einem Set Dockerfiles
# erstellen, um daraus die eigenen Standard-Images zu erstellen [7].

# Dockerfile im Repository der Anwendung

# Dockerfiles nah bei der Anwendung zu speichern hilft Entwicklern
# dabei, eine Entwicklungsumgebung zu erstellen. Dockerfiles im
# Repository sind eine gute Option, um neuen Entwicklern den Einstieg
# in die Arbeit an der Anwendung zu ermöglichen, ohne dass sie Zeit
# für die Konfiguration des Laptops mit allen Services der Anwendung
# brauchen. Außerdem verändern sich das Dockerfile und die Anwendung
# parallel, das kann über Git nachverfolgt werden. Der letzte Aspekt
# ist darum relevant, weil so auch Rollbacks oder QA nicht nur für
# den Code, sondern auch für das Dockerfile möglich sind.

# Ein Dockerfile ist praktisch nur eine Textdatei, die die Befehle und
# Anweisungen enthält, die Docker zur Erstellung von Images braucht.

# FROM ubuntu:15.04

# RUN apt-get update RUN apt-get install -y php5 RUN echo "<?php echo
# ’Hello folks!’;" > /var/index.php

# WORKDIR /var

# CMD ["php", "-S", "0.0.0.0:9090", "-t", "."]  Dieses Dockerfile
# hier enthält ein PHP-Skript, das „Hello folks!“ ausgibt. Mit diesem
# Dockerfile spezifizieren wir das Basis-Image.

# FROM ubuntu:15.04 Mit dem entsprechenden Kommando wird Apache2
# installiert und der Index erstellt. CMD beschreibt das Kommando,
# das den Prozess im laufenden Container startet. In diesem Beispiel
# fangen wir damit an, den integrierten PHP Web-Server zu starten.

docker build -t php-example .

# build ist ein Befehl, mit dem ein Image aus einem Dockerfile
# erstellt wird. -t gibt den Namen des Images an und . gibt den Pfad
# des Verzeichnisses an, der das Dockerfile beinhaltet. Aus diesem
# Image können Container erstellt werden; mit dem run-Befehl kann
# man die Anwendung starten.

docker run -it -p 9090:9090 php-example

# Als nächstes öffnen wir localhost:9090 in einem Browser.

# In der echten Welt wird die index.php der Anwendung nicht mit dem
# Container erstellt, sondern mit der ADD-Anweisung hinzugefügt.

# ADD ./directory/to/add/ /path/into/the/container Wenn, wie in
# unserem Beispiel hier, die Datei index.php im gleichen Ordner wie
# das Dockerfile liegt, kann folgender Befehl

# RUN echo "<?php echo ’Hello folks!’;" > /var/index.php durch

# ADD ./index.php /var/index.php ersetzt werden.

# Eine ./index.php-Datei ist ein PHP-Script, das folgendes enthält:

# <?php echo ’Hello folks!’; > Nun wird das Image noch einmal
# erstellt; sobald es fertig ist, wird index.php aus dem Dateisystem
# entfernt. Danach versuchen wir erneut, einen Container zu starten:

docker build -t your-username/php-example .
rm -rf index.php
docker run -it -p 9090:9090 your-username/php-example

# Wie man nun im Browser sieht, wird die richtige Seite auch ohne
# die Datei angezeigt, weil ein neuer Container erstellt wurde,
# der die Anwendung enthält. Das bedeutet, dass die Anwendung nun
# wie ein Artefakt geteilt und deployed werden kann.

# Die Registry ist in diesem Kontext ein weiteres wichtiges Tool,
# das von Docker zur Verfügung gestellt wird. Die Registry hilft beim
# Verwalten der Distribution unserer Images. Es gibt sowohl öffentliche
# als auch private Registries; die bekannteste ist hub.docker.com. Sie
# enthält viele öffentlich zugängliche Images; registrierte Nutzer
# können dort aber auch private Images verwalten. Wer noch nicht auf
# dem Hub registriert ist, sollte das jetzt tun – es ist nämlich an
# der Zeit, your-username/php-example dorthin zu pushen.

docker login

# Mithilfe dieses Befehls erlaubt man dem Docker Daemon, mit dem
# eigenen Hub-Account zu kommunizieren. Der Name des Images bestimmt
# ein spezifisches Verhalten, so wird etwa unter my-username der
# eigene Nutzername eingesetzt – in meinem Fall gianarb, da dies mein
# Username in Docker Hub ist.

docker push gianarb/php-example

# Jetzt ist unser Image öffentlich im Hub zugänglich und wir können
# all unsere Images auf der Profilseite sehen.

docker rmi -f gianarb/php-example
docker pull gianarb/php-example

# Der erste Befehl löscht das Image vom Laptop; der zweite zieht
# es aus dem Hub. Das ist ein sehr einfaches Beispiel, das zeigt,
# was eine Registry ist und wie sie eure Images verwaltet. Docker
# kann auch Tags verwalten und stellt Tools zur Verfügung, mit
# denen der Unterschied zwischen den Images und den Containern im
# Repository markiert wird. So weiß man, womit man arbeitet, bevor
# der Versuch unternommen wird, ein neues Image aus einem Container
# zu erstellen. Im nächsten Kapitel sehen wir uns diese Funktionen
# in der Praxis an.

# Docker Command Line Tool Die Command Line ist ein vollständiges
# und mächtiges Tool, um mit dem Daemon zu interagieren. Der sichere
# Umgang damit hilft dabei, Container zu erstellen und zu verwalten.

# Mit dem Befehl docker -help können wir uns eine Liste von Kommandos
# anzeigen lassen. Viele davon sind uns bereits über den Weg gelaufen,
# aber diese Übersicht ist ganz gut, um sich die am meisten verwendeten
# Kommandos noch einmal anzeigen zu lassen.

# run

docker run hello-world

# Dieser Befehl benutzt das hello-world-Image, um einen neuen Container
# zu starten. Es stehen viele Optionen dafür zur Verfügung, mit
# denen Ports geteilt, Volumes gemounted, Container in spezifischen
# Netzwerken ausgeführt und der Ressourcenverbrauch für einzelne
# Container limitiert werden können. Was das in der Praxis bedeutet,
# zeigt folgendes langes Beispiel für einen solchen Befehl:

docker run -i -t -p 8000:8000 \
   -v /home/gianarb/.ssh/id_rsa:/root/.ssh/id_rsa \
   -v $PWD:/opt \
   --network front-tier \
   --memory 10M \
   --name site \
   gianarb/micro
# -i hält das STDIN offen -t weist ein tty zu -p teilt einen Port
# aus dem Container mit dem Host; in diesem Fall Port 8000 bis
# 8000. Dieser Wert ist ein Array, es können also auch mehrere
# Ports geteilt werden. Es müssen dafür einfach nur weitere -p-Werte
# spezifiziert werden.  -v teilt Dateien und Verzeichnisse wie Volumes
# aus dem Host mit dem Container. Dieser Wert ist ebenfalls ein Array;
# in diesem Beispiel werden zwei Volumes geteilt. Das erste ist mein
# ssh-key, der vom Host unter dem Pfad /home/gianarb/.ssh/id_rsa
# im Container /root/.ssh/id_rsa gespeichert wird.  -network fügt
# diesen Container dem Front-Tier-Netzwerk hinzu. Was das bedeutet,
# werden wir später sehen.  -memory beschränkt das durch den Container
# verwendbare RAM auf 10 Megabyte -name ist der Name des Containers
# gianarb/micro ist der Name des Images ps

docker ps

# Dieser Befehl zeigt die Nummer der Container an, die aktuell laufen,
# mit der Option -a kann die Liste der gestoppten Container angezeigt
# werden. Jeder Container hat eine ID oder einen Namen; zur Ausführung
# von Befehlen, die eine Container ID brauchen, kann der vollständige
# Name oder eine partielle ID genutzt werden (es reicht sogar der
# erste Buchstabe, wenn er nur einmalig verwendet wird).

# exec

docker exec container_name ls -lsa

# Damit wird ein Befehl ausgeführt (hier: ls -lsa); in diesem Fall
# in einem laufenden Container (container_name).

# logs

docker logs container_name

# Damit lassen sich die Logs anzeigen, die ein Container geschrieben
# hat. Mit der Option -f kann man die Logs verfolgen.

# push and pull

docker pull gianarb/micro:1.0.0
docker push gianarb/micro

# Diese beiden Befehle werden benutzt, um Images zu verwalten und
# sie in eine Remote Registry zu schieben oder daraus zu beziehen.

# tags

docker tag 5wgs46h gianarb/micro:1.0.1

# Jedem Image kann ein Tag zugewiesen werden, dabei handelt es sich
# um ein Label, das dem Image zugeordnet wird. Der Standard-Tag
# ist latest, man kann aber auch dem Best Practice folgen und
# beispielsweise wie in einer normalen Code-Basis mit SemVer [8]
# versionieren. In diesem Beispiel taggen wir das Image mit der ID
# 5wgs46h durch etwas wie example:1.0.1. Außerdem kann der Befehl tag
# zur Vorbereitung des Pushs eines Images in die eigene Registry
# genutzt werden. Der Standard ist hier registry-1.docker.io,
# allerdings kann auch ein anderes Ziel definiert werden, um das
# Image in eine private Registry zu pushen.

docker tag 5wgs46h registry.gianarb.it:gianarb/micro:1.0.1

# inspect

docker inspect 4645shgre

# inspect gibt Informationen über Images und laufende Container
# aus. Eine sehr nützliche Option ist -format, das den typischen
# CLI-Output in ein rohes JSON-Format konvertiert, inklusive
# Informationen zu Volumes, Ports, IP und allem anderen, was der Daemon
# über den Container weiß. Das ist sehr nützlich, um grundlegende
# Automatisierungen mit Tools wie jq [9] einzurichten. Diese erlauben,
# JSON-Dateien direkt an den Bash zu übergeben.

# start, stop, restart, kill

docker start 464gts4

# Ein Docker Container führt Prozesse aus und verwaltet diese. Darum
# kann er genau wie ein normaler Prozess gestartet, gestoppt, gekillt
# und neu gestartet werden.

# save, import

docker save gianarb/micro > micro.tar.gz
cat micro.tar.gz | docker import - my/micro:new
docker import http://example.exampleapp.com/micro.tar.gz

# Wie bereits erwähnt ist die Registry der beste Weg, um Images
# auszuliefern und zu verteilen; Docker unterstützt jedoch auch den
# Befehl save, mit dem ein tarball des Images erstellt wird, sowie
# den Befehl import, mit dem Docker Images aus dem tarball erstellt
# werden. Dieses Vorgehen ist beim Entwickeln von Anwendungen gut
# geeignet, besonders wenn man etwas mit jemandem teilen möchte. Wenn
# es hingegen um die Verwaltung der Produktions-Releases und um das
# Deployment geht, ist die Registry die beste Option zur Auslieferung
# und Verteilung von Images.

# Volumes und Dateisysteme Wie wir bereits wissen, hat jeder Container
# sein eigenes isoliertes Dateisystem. Wir wissen außerdem, dass der
# Container aus verschiedenen Schichten besteht. Mit den Volumes haben
# wir uns aber noch nicht beschäftigt. Ein Data Volume ermöglicht es
# dem Container, das Union-Dateisystem zu umgehen. Volumes werden
# initialisiert, wenn ein Container erstellt wird; sie stellen
# Funktionen für das Persistieren und Teilen von Daten bereit. Jedes
# Volume hat einen Mount Point und falls bereits Daten vorliegen,
# werden diese in das Container-Volume kopiert und sind dort verfügbar
# bzw. nutzbar:

docker run -it -v /tmp ubuntu /bin/bash

# Mit der Option -v werden neue Volumes erstellt und dem Container
# hinzugefügt:

docker run -it -v /tmp -v /opt ubuntu /bin/bash

# Man kann auch mehrere Volumes miteinander verbinden, um sie alle
# demselben Container anzuhängen.

# Ein Volume zu erstellen ist nützlich, wenn eine Anwendung Daten
# enthält, die mit in anderen Container gemounted werden sollen. Ein
# und dasselbe Volume kann von mehreren Containern verwendet
# werden. Wenn der aktuelle Container stirbt oder gelöscht wird,
# sind alle im Volume gespeicherten Dateien weiterhin verfügbar und
# können an den nächsten Container angehängt werden. Volumes werden
# normalerweise genutzt, um beispielsweise Logs und den Cache zu
# verwalten. Sie können mit dem Keyword VOLUME auch im Dockerfile
# beschrieben werden:

# VOLUME /tmp Auch spezifische Verzeichnisse aus dem Host können direkt
# in den Container -v /tmp:/temporary gemapt werden. Der erste Pfad
# ist das Verzeichnis im Host; der zweite der Mount Point für den
# Container. Dauerhafte Änderungen an einem Volume werden innerhalb
# und außerhalb des Containers geteilt, weshalb dieses Feature perfekt
# für die Entwicklung geeignet ist. So kann das Projekt in einen
# Container gemounted und die Produktionsumgebung eben dort simuliert
# werden. Es ist allerdings wichtig zu bedenken, dass Daten innerhalb
# eines Volumes persistiert werden, auch wenn der Container abläuft.

# Wenn ein Volume nicht gemapt wird, aber man wissen möchte, wo es
# sich auf dem Host befindet, kann der Befehl docker inspect genutzt
# werden. Das Feld Mounts gibt Auskunft:

 {
    ...
        "Mounts": [
            {
                "Name": "0f83dc",
                "Source": "/var/lib/docker/volumes/0f83dc/_data",
                "Destination": "/tmp",
                "Driver": "local",
                "Mode": "", "RW": true,
                "Propagation": ""
            }
        ],
    ...
 }

# Außerdem können CLI-Befehle genutzt werden, um Volumes zu erstellen,
# zu persistieren oder zu löschen:

docker volume ls
docker volume create
docker volume rm

# Diese Funktion stellt eine der Kernfunktionen für die Verwendung
# von Containern in der Entwicklung und im Deployment dar. Aus diesem
# Grund stellt Docker auch eine gute Abstraktionsschicht zur Verfügung,
# auf der eigene Plug-ins zum Mounten verschiedener Dateisysteme wie
# NFS oder eigens entwickelter Lösungen verwendet werden können. Es
# gibt zahlreiche Plug-ins, die das Mounten dezentraler Speicherdienste
# erlauben, beispielsweise Flocker [10]. Infinit [11] ist ein weiteres
# spannendes Projekt, das eine Docker-Integration für die Verwaltung
# dezentralisierter Volumes auf verschiedenen Plattformen anbietet,
# beispielsweise für Amazon S3 und Azure. Das Projekt bietet einen
# Dienst für die Verwendung von persistiertem und skalierbarem Speicher
# verschiedener Cloud-Anbieter an. Wenn man mit einem Cluster von
# Docker Engines arbeitet, wird das Volume auf dem gleichen Host
# erstellt, auf dem der Container gestartet wird. Wenn man Container
# auf verschiedenen Servern aufsetzt, bedeutet das, dass die anderen
# Maschinen keinen Zugriff auf die Volumes haben. Infinit schafft
# hier Abhilfe und kümmert sich um die Migration von Volumes in
# einem Cluster.

# volume kann außerdem zur Erstellung von Backups verwendet werden. Ein
# Volume, das in einem anderen Container erstellt wurde, kann mit
# -volumes-from <volume-name> angehängt werden, wie das Beispiel zeigt:

docker run --rm --volumes-from img_avatar -v \
  $PWD:/backup ubuntu tar cvf /backup/backup.tar \
  /var/www/front/public/avatar
# Wie bereits gezeigt, kann das gleiche Volume zugleich in mehr
# als einem Container eingesetzt werden. Allerdings muss man dabei
# in Erinnerung behalten, dass zwei Anwendungen, die in dieselben
# Dateien schreiben, zu fehlerhaften Daten führen können. Das ist
# ganz insgesamt ganz nützlich, man muss allerdings auch wissen,
# wann und wo man es nutzt.

# Network und Links Volumes helfen also dabei, Daten zu
# verwalten. Genauso nützlich sind die Features Network und Links,
# die dazu da sind, Container miteinander zu verbinden und die
# Kommunikation zwischen unseren Anwendungen zu ermöglichen. Das ist
# darum so wichtig, weil es zumeist zu den primären Anforderungen an
# eine Anwendung gehört, dass sie mit anderen Services kommunizieren
# kann, beispielsweise mit MySQL, Redis, Vault oder mit anderen
# Containern im Cluster.

# Der einfachste Weg zur Verbindung von zwei Containern ist ein Link:

docker run --name mysql-service -e MYSQL_ROOT_PASSWORD=root -d mysql
docker run --name my-wordpress \
   -e WORDPRESS_DB_PASSWORD=root \
   -e WORDPRESS_DB_HOST=mysql.my-wordpress \
   --link mysql-service:mysql.my-wordpress \
   -d wordpress
# Wir erstellen hier einen MySQL-Container mit dem Root-Passwort
# “root” und verbinden ihn mit einem WordPress-Container. MySQL kann
# vom WordPress-Container aus nun mit dem Hostname mysql.my-wordpress
# erreicht werden.

# -link <container-name>:alias ist das Format des Links, mit dem
# eine bidirektionale Kommunikation zwischen den beiden Containern
# ermöglicht wird; der Alias definiert den Hostname, der dafür benutzt
# wird. Es können multiple Links erstellt werden – dafür muss man nur
# mehr -link-Optionen einfügen, wenn der run-Befehl ausgeführt wird.

# Das Konzept der Links ist leicht verständlich, allerdings ist es
# eine Legacy-Funktion. Seit Docker 1.9 steht das neue Konzept des
# Networks in stabiler, gebrauchsfertiger Version zur Verfügung. Bevor
# wir uns nun genau dieses ansehen, sollten wir aber einen Blick darauf
# werfen, wie Docker die Kommunikation zwischen Containern handhabt.

