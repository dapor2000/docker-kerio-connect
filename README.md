# Docker Kerio-Connect

Kerio Connect is Mail/Groupware like Microsoft Exchange, but running on Linux.
More Informations under www.kerio.com/connect

THIS IS A PRIVAT BUILD AND HAS NO CONNECTION TO KERIO COMPANY

USE AT YOUR OWN RISK

## Instructions

Get latest build from Docker:

```bash
docker pull dapor/docker-kerio-connect
```

Or build it by yourself:

```bash
 git clone https://github.com/dapor2000/docker-kerio-connect.git
 cd docker-kerio-connect
 sudo docker build -t docker-kerio-connect .
```

### Run in background

```bash
$ sudo docker run --name="kerio" -p 4040:4040 -v /#YOUR_KERIO_BACKUP:/backup -t dapor/docker-kerio-connect 
```

### Configure

https://IP-FROM-DOCKER:4040

If you need to change anything inside the Container, ther is a SSH Server running with 
```
User docker 
Passwort test123
```
