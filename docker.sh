#!/bin/sh
exit 0
# --cap-add Add Linux capabilities
# SYS_PTRACE	Trace arbitrary processes using ptrace
# detached mode, you use -d=true or just -d option
docker run --name transmart-db -d tmfev/transmart-db
docker run --name transmart-app --link transmart-db:transmart-db -p 8080:8080 -d --cap-add SYS_PTRACE tmfev/transmart-app

docker restart transmart-db
docker start transmart-app

docker run --name transmart-app_foreground --link transmart-db:transmart-db -p 8080:8080 --cap-add SYS_PTRACE tmfev/transmart-app

# bash Zugriff auf Container
docker exec -it containerID bash
 
# habe die Datei aus dem webapps Ordner kopiert:
# sieh mal nach ob die Datei da liegt. Wenn ja, den path zur Datei kopieren
# dann ausloggen, und dann Datei auf lokales System kopieren
docker cp containerid:/"PATH zur Datei" /"Path wo datei auf lokalen System kopiert werden soll"
# z.B.
docker cp 8fd9386b450a:/var/lib/tomcat7/webapps/transmart.war /Users/mkisiela/Desktop/

# power off the VBox VM
docker-machine stop  

docker-machine start
docker images

# docker-machine create -d virtualbox dev -D # ???

VBoxManage.exe modifymedium --compact c:\path\to\thedisk.vdi
VBoxManage modifymedium --compact 'C:\Users\t.richter\.docker\machine\machines\default\disk.vmdk'
VBoxManage modifymedium --compact /cygdrive/c/Users/t.richter/.docker/machine/machines/default/disk.vmdk # Could not find file for the medium 'C:\cygdrive\c\Users\t.richter\.docker\machine\machines\default\disk.vmdk
VBoxManage modifymedium --compact /c/Users/t.richter/.docker/machine/machines/default/disk.vmdk # 

VBoxManage modifymedium --compact /Users/t.richter/.docker/machine/machines/default/disk.vmdk
#0%...
#Progress state: VBOX_E_NOT_SUPPORTED
#VBoxManage.exe: error: Compact medium operation for this format is not implemented yet!

docker run -d --name demo_nginx -p 80:80 nginx
docker ps

# Deleted all containers & images using: 
docker rm $(docker ps -a -q) 
docker rmi $(docker images -q)

docker-machine ssh default

cd t.richter@ukshikmb-nw106 ~/.docker/machine/machines/default
/c/Users/t.richter/Downloads/vdiskmanager-windows-7.0.1.exe2/1023856-vdiskmanager-windows-7.0.1.exe -p disk.vmdk 
# Failed to prepare the disk mounted at 'disk.vmdk' for shrinking.
/c/Users/t.richter/Downloads/vdiskmanager-windows-7.0.1.exe2/1023856-vdiskmanager-windows-7.0.1.exe -k disk.vmdk 
# Failed to shrink the disk 'disk.vmdk' : An error occurred while writing a file; the disk is full. Data has not been saved. Free some space and try again (0xd00000008).

ssh -F /dev/null \
	-o PasswordAuthentication=no \
	-o StrictHostKeyChecking=no \
	-o UserKnownHostsFile=/dev/null \
	-o LogLevel=quiet \
	-o ConnectionAttempts=3 \
	-o ConnectTimeout=10 \
	-o ControlMaster=no \
	-o ControlPath=none \
	docker@127.0.0.1
	-o IdentitiesOnly=yes  \
	-i C:\Users\t.richter\.docker\machine\machines\default\id_rsa  \
	-p 12607

docker run --name nginx -d -p 80:80 -p 443:443 docker.flavia-it.de/nginxlocal
docker run -e VIRTUAL HOST=localhost -e PUBLIC=true --name homepage -d homepage


#ERROR: you need to share your Docker host socket with a volume at /tm-/docker.sock
#Typically you should run your jwilder/nginx-proxy with: '-v /var/run/docker.sock:/tmp/docker.sock:ro'
#See the documentation at http://git.io/vZaGJ 7

cat /dev/zero > /mnt/sda1/var/lib/docker/zero.tmp ; sleep 1; sync; sleep 1; /bin/rm -f /mnt/sda1/var/lib/docker/zero.tmp 
cat /dev/zero > /mnt/sda1/zero.tmp ; sleep 1; sync; sleep 1; /bin/rm -f /mnt/sda1/zero.tmp 

/c/Users/t.richter/Downloads/vdiskmanager-windows-7.0.1.exe2/1023856-vdiskmanager-windows-7.0.1.exe -k disk.vmdk
#FileIO_Create: Unrecognized error code: 32
#Failed to open the disk 'disk.vmdk' : A file access error occurred on the host or guest operating system (0x20000900000007).
#Failed to shrink the disk 'disk.vmdk' : A file access error occurred on the host or guest operating system (0x20000900000007).

#Failed to shrink the disk 'disk.vmdk' : An error occurred while writing a file; the disk is full
cat /dev/zero >zero.fill; sleep 1; sync; sleep 1; /bin/rm -f zero.fill


###########

systemctl status docker
systemctl edit docker
cat /lib/systemd/system/docker.service 
vim /etc/systemd/system/docker.service.d/override.conf 
systemctl cat docker | grep ExecStart
systemctl daemon-reload
systemctl restart docker

# !!!
systemctl edit docker.service

docker run -dp 80:80 docker/getting-started


docker cp /usr/bin/busybox portainer:/
docker exec -it portainer /busybox sh

# avoid
docker run -v /mnt/c/users:/users #(where /mnt/c is mounted from Windows).
# Instead, from a Linux shell use a command like 
docker run -v ~/my-project:/sources <my-image> # where ~ is
docker run --name nifi -v /mnt/c/users:/mnt/users apache/nifi:latest
docker run --name nifi -v ~:/mnt/home apache/nifi:latest

docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker-fwd.sock:/var/run/docker.sock portainer/portainer
docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v ~/docker134.245.4.88.sock:/var/run/docker.sock portainer/portainer-ce

## reset docker
#Stop the container(s) using the following command: 
docker-compose down
#Delete all containers using the following command: 
docker rm -f $(docker ps -a -q)
#Delete all volumes using the following command: 
docker volume rm $(docker volume ls -q)

#clean up
docker system prune --all

## install docker dsf 
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin cgroupfs-mount
systemctl enable docker.service
systemctl enable containerd.service






