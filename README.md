# Dockerized Kali Linux and Ubuntu 20.04

Dockerized Kali Linux and Ubuntu 20.04 for bug bounty/pentesting and so on... 

docker-compose.yaml version `3.8`

I am using official Kali Linux Docker image **kalilinux/kali-rolling**, also this page describe **Official Kali Linux Docker Images** [Official](https://www.kali.org/docs/containers/official-kalilinux-docker-images/)

## TODO

1. Install Starship + add there my [starship.toml](https://github.com/jz543fm/starship-conf)

## Kali Linux dockerized

## Installing docker compose


docker-compose installation (latest release), it is expected that you've installed docker and you're installing only docker compose v2!

```bash
mkdir -p ~/.docker/cli-plugins/

curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

chmod +x ~/.docker/cli-plugins/docker-compose #permission

docker compose version #verify
```

### Run Kali Docker

I am using `docker-compose.yaml` and `Dockerfile`, so to create docker service `kali` use, also I am using Docker BuildKit, so add content of  `daemon.json` to your `/etc/docker/daemon.json` and restart Docker systemd service `sudo systemctl restart docker`

Builded docker images, builded docker image for `Kali Linux` is big `~9.44GB` and builded docker image for `Ubuntu-20.04` is big `~134MB`


```bash
docker compose up -d #detached

docker compose up -d --build #rebuild new changes for all services

docker compose up -d --build ubuntu #rebuild new changes for ubuntu service

docker compose up -d --build kali #rebuild new changes for kali service

docker compose down --rmi all #remove

docker ps -a #check if container is running

docker image ls #list images

docker image rmi -f <container_id> #remove image/s

# PRUNE

docker system prune 

docker image prune
```

### Run Kali Linux in Docker with SystemD in container

Use it in one Dockerfile for Kali and build up images via `bash script` or `docker-compose.yaml`

I've used this [Github repo](https://github.com/AkihiroSuda/containerized-systemd)

```bash
cd kali/
docker build -t kali -f Dockerfile_systemd . #Dockerfile for support systemd in docker container
docker run -it --rm --privileged --workdir /usr --name kali-systemd  kali /bin/bash #Docker build
```


Exec to Kali Linux container in Docker: 

```bash
docker exec -it -u root kali bash #exec into kali container
```

### Run Kali Docker detached - docker run

```bash
 docker run -p 127.0.0.1:88:8088 --name kali -itd kalilinux/kali-rolling 
 docker attach kali
```
