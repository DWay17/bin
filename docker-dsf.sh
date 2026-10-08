
ssh -n -N -T -L ~/docker172.26.5.49.sock:/var/run/docker.sock -i ~/.ssh/dsf-key-2020-11.pem -oServerAliveInterval=300 -oServerAliveCountMax=5 ubuntu@172.26.5.49 &
ssh -n -N -T -L ~/docker172.26.5.92.sock:/var/run/docker.sock -i ~/.ssh/dsf-key-2020-11.pem -oServerAliveInterval=300 -oServerAliveCountMax=5 ubuntu@172.26.5.92 &
ssh -n -N -T -L ~/docker134.245.4.88.sock:/var/run/docker.sock -i ~/.ssh/id_rsa -oServerAliveInterval=300 -oServerAliveCountMax=5 suktm428@134.245.4.88 &

