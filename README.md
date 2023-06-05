# Dockerized Kali Linux and Ubuntu 20.04

Dockerized Kali Linux + Ubuntu 20.04 for Bug Bounty, Penetration Testing, Security Research, Computer Forensics and Reverse Engineering

I am using [Official](https://www.kali.org/docs/containers/official-kalilinux-docker-images/) Kali Linux Docker image **kalilinux/kali-rolling**, also this page describe **Official Kali Linux Docker Images** 

## Installation

#### Installing Dive - Tool for exploring Docker Image, layer, contents to shrink image

One liner by specific version: 

```bash
DIVE_VERSION=0.10.0;  curl -sSLO https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb && sudo dpkg -i dive_${DIVE_VERSION}_linux_amd64.deb
```

if you want to build your image then jump straight into analyzing it:

```bash
cd kali/
dive build -t kali . -f Dockerfile_systemd
```

#### Installing Trivy - Docker Vuln. scanner

Trivy installation for Docker Image vulnerabilities:

If you are not using Debian/Ubuntu, read [docs](https://aquasecurity.github.io/trivy/v0.18.3/installation/)

If you are using Debian/Ubuntu:

```bash
wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb
sudo dpkg -i trivy_0.18.3_Linux-64bit.deb
```

Trivy usage:

```bash
trivy image <image>
```

### Kali Linux dockerized

#### Installing docker compose

docker-compose installation (latest release), it is expected that you've installed docker and you're installing only docker compose v2! Used version of **docker-compose.yaml** is **3.8**

```bash
mkdir -p ~/.docker/cli-plugins/

curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

chmod +x ~/.docker/cli-plugins/docker-compose #permission

docker compose version #verify
```

#### Run Kali Linux in Docker

I am using docker-compose.yaml and Dockerfile, so to create docker service kali use, also I am using Docker BuildKit, so add content of  daemon.json to your /etc/docker/daemon.json and restart Docker systemd service sudo systemctl restart docker

Builded docker images, builded docker image for Kali Linux is big ~9.44GB and builded docker image for Ubuntu-20.04 is big ~134MB

If you want to run the docker-compose.yaml use the command: 

```bash
docker compose up -d --build #detached
```

#### Development

Edit Dockerfiles for other services and you can develop with proper commands below

```bash
docker compose up -d #detached

docker compose up -d --build #rebuild new changes for all services

docker compose up -d --build ubuntu #rebuild new changes for ubuntu service

docker compose up -d --build kali #rebuild new changes for kali service

docker compose down --rmi all #remove

docker ps -a #check if container is running

docker image ls #list images

docker image rmi -f <container_id> #remove image/s

docker logs <service> #logs

# PRUNE

docker system prune 

docker image prune
```

#### Run Kali Linux in Docker with SystemD in container

Use it in one Dockerfile for Kali and build up images via bash script or docker-compose.yaml

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

### TODO

1. Install Starship + add there my [starship.toml](https://github.com/jz543fm/starship-conf)

### TODO Kali Packages

OSINT:

1. [The Harvester](https://github.com/laramies/theHarvester)

2. [sn0int](https://github.com/kpcyrd/sn0int)

3. [blackbird](https://github.com/p1ngul1n0/blackbird)

K8s Scanner:

1. [Kube-Hunter](https://github.com/aquasecurity/kube-hunter)

Nmap-Scan-Scripts:

1. [nmap-scan-scripts](https://github.com/topics/nmap-scan-script)

Application Mapper:

1. [amap](https://www.kali.org/tools/amap/)

XSS:

1. [XSSRecon](https://github.com/Ak-wa/XSSRecon)

2. [XSSer](https://gitlab.com/kalilinux/packages/xsser)