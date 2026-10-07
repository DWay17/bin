C:\Users\t.richter\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart always -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -v portainer_data:C:\data portainer/portainer
docker stack deploy --compose-file=agent-stack.yml portainer-agent
Get-Content -Path (Get-PSReadlineOption).HistorySavePath | grep -i docker | grep -i portainer
docker pull portainer
docker pull portainer/portainer
docker stop portainer
docker rm portainer
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
docker pull portainer-ce
docker pull portainer/portainer-ce
#docker run -d -p 8001:8000 -p 9001:9000 --name portainer --restart always -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -v portainer_data:C:\data portainer/portainer
docker run -d -p 8001:8000 -p 9001:9000 --name=portainer1 --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

#Native Windows container
#To run portainer container in a native Windows container, the syntax is:
docker run -d -p 9000:9000 --name portainer --restart always -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -v C:\ProgramData\Portainer:C:\data portainer/portainer-ce

docker run -d -p 9000:9000 --name portainer --restart always -v \\.\pipe\docker134.245.4.88.sock:\\.\pipe\docker_engine -v C:\ProgramData\Portainer:C:\data portainer/portainer-ce
