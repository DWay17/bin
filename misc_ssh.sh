#!/bin/sh
# ssh benutzer@FernerHost -L <lokaler Port>:<Ziel-Host>:<ferner Port>
# ssh -L [bind_address:]port:host:hostport
ssh -i ~/.ssh/dsf-key-2020-11.pem ubuntu@dsf-bpe-test 
# Mit der Option -N wird die SSH-Verbindung auf ihre Tunnelfunktion beschränkt und unterbindet die Ausführung von Shell-Kommandos.
# Mit der Option -f wird der SSH-Tunnel in den Hintergrund geschickt. Nach Eingabe des Passwort verschwindet der SSH-Tunnel im Hintergrund, kann aber weiterhin genutzt werden.
# Mit der Option -C fragen wir eine Komprimierung an, um die Datenübertragung zu beschleunigen.
# Mit der Option –p <Port> kann ein abweichender SSH-Port definiert werden. Per Default wird die Portadresse 22 genommen.
# -n Redirects stdin from /dev/null (actually, prevents reading from stdin).  This must be used when ssh is run in the background.  
# -t Force pseudo-tty allocation
ssh -v -L 19440:10.129.194.40:22 dsf-bpe
scp -oProxyCommand="sudo ssh -W %h:%p dsf-jumphost" dsf-bpe:/var/bpe/docker-compose.yml ~/Downloads/highmed-dsf-prod/bpe/
scp -oProxyJump=dsf-jumphost dsf-bpe:/var/bpe/docker-compose.yml ~/Downloads/highmed-dsf-prod/bpe/
