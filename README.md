# Docker Kerio-Connect

Kerio Connect is Mail/Groupware like Microsoft Exchange, but running on Linux.
More Informations under www.kerio.com/connect

THIS IS A PRIVAT BUILD AND HAS NO CONNECTION TO KERIO COMPANY

USE AT YOUR OWN RISK

## Instructions

Get latest build from Docker:

```bash
docker pull dapor/docker-kerio-connect:latest
```

If you want to run Kerio inside Synology-Docker use this [Container qualified for Synology NAS ]:

```bash
docker pull dapor/docker-kerio-connect:Synology
```


Or build it by yourself:

```bash
 git clone https://github.com/dapor2000/docker-kerio-connect.git
 cd docker-kerio-connect
 sudo docker build -t docker-kerio-connect .
```

### Run in background

```bash
$ sudo docker run --name="kerio" \
-p 4040:4040 \
-p 22:22 -p 25:25 -p 465:465 -p 587:587 -p 110:110 -p 995:995 \
-p 143:143 -p 993:993 -p 119:119 -p 563:563 -p 389:389 -p 636:636 \
-p 80:80 -p 443:443 -p 5222:5222 -p 5223:5223 \
-v /#YOUR_KERIO_DATAFOLDER:/kerio_store
-v /#YOUR_KERIO_BACKUP:/backup -t dapor/docker-kerio-connect 
```

### Configure

https://IP-FROM-DOCKER:4040

If you need to change anything inside the Container, there is a SSH Server running with 
```
User docker 
Passwort test123
```
