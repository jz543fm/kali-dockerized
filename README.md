# Dockerized Kali Linux and Ubuntu 20.04

Dockerized Kali Linux + Ubuntu 20.04 for Bug Bounty, Penetration Testing, Security Research, Computer Forensics and Reverse Engineering

I am using [Official](https://www.kali.org/docs/containers/official-kalilinux-docker-images/) Kali Linux Docker image **kalilinux/kali-rolling**, also this page describe **Official Kali Linux Docker Images** 

## Installation

#### Installing Dive - Tool for exploring Docker Image, layer, contents to shrink image

One liner to install [Dive](https://github.com/wagoodman/dive) by specific version (Linux/Ubuntu):

```bash
DIVE_VERSION=0.10.0;  curl -sSLO https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb && sudo dpkg -i dive_${DIVE_VERSION}_linux_amd64.deb
```

if you want to build your image then jump straight into analyzing it:

```bash
cd kali/
dive build -t kali . -f Dockerfile_systemd
```

#### Installing Trivy - Docker Vuln. scanner

[Trivy](https://trivy.dev) installation for Docker Image vulnerabilities:

If you are not using Debian/Ubuntu, read [docs](https://aquasecurity.github.io/trivy/v0.18.3/installation/)

One liner to install [Trivy](https://trivy.dev) by specific version (Linux/Ubuntu):

```bash
TRIVY_VERSION=0.18.3; curl -sSLO https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.deb && sudo dpkg -i trivy_${TRIVY_VERSION}_Linux-64bit.deb
```

Trivy usage:

```bash
trivy image <image>
```

### Kali Linux dockerized

#### Installing docker compose

docker-compose installation (latest release), it is expected that you've installed docker and you're installing only docker compose v2! Used version of **docker-compose.yaml** is **3.8**

```bash
mkdir -p ~/.docker/cli-plugins/; DOCKER_COMPOSE=2.18.1; curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE}/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose; chmod +x ~/.docker/cli-plugins/docker-compose #permission

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

docker stats <image> #docker image statistics

# Docker stop all running images and remove them, then you can use docker prune 

docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)

# PRUNE
docker system prune 

docker image prune
```

#### Development v2 + Usage

You can use multiple options to run Kali Linux in Docker or Kali Linux + Ubuntu 20.04 in Docker (docker run, docker build or docker-compose.yaml usage or by Makefile), examples are below:

```bash
#Detached Kali Linux without systemd/journalctl support docker run

 docker run -p 127.0.0.1:88:8088 --name kali -itd kalilinux/kali-rolling 
 docker attach kali 

#Docker compose usage

docker compose up -d --build;
docker compose run -d --rm kali_systemd_2 bash #run Kali Linux with systemd detached
docker exec -it -u root <kali_without_systemd> bash #docker exec to Kali container without systemd
docker exec -it -u root <ubuntu> bash #docker exec to ubuntu container
docker exec -it -u root <kali_with_systemd> bash #docker exec to Kali container with systemd

#Detached Kali Linux with systemd/journalctl support docker run + docker build

cd kali/
docker build -t kali -f Dockerfile_systemd . #Dockerfile for support systemd in docker container
docker run -it --rm --privileged --workdir /usr --name kali-systemd  kali /bin/bash #Docker build

#Makefile
#command explanation is in Makefile

make build-run-plain
make create-build-s
make image-run-s
make kali-scan
make docker-c-build
make docker-c-build-systemd
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

## Tools List

|   Tools in Kali Linux                                             | Usage                                                              
| ------------------------------------------------------------------|---------------------------------------------------------------------|
|     [amap](https://www.kali.org/tools/amap/)                      |    Application Mapper                                               |
|     [xsser](https://github.com/epsylon/xsser)                     |    Automation framework to detect XSS                               |
|     [beef-xss](https://beefproject.com)                           |    Browser Exploitation Framework                                   |
|     [XSSRecon](https://github.com/Ak-wa/XSSRecon)                 |    Reflected XSS Scanner                                            |
|     [exploitdb](https://gitlab.com/kalilinux/packages/exploitdb)  |    Searchable Exploit Database archive                              |
|     [mandb](https://man7.org/linux/man-pages/man8/mandb.8.html)   |    Updates man pages                                                |
|     [dirb](https://www.kali.org/tools/dirb/)                      |    Web Content Scanner                                              |
|     [nikto](https://www.kali.org/tools/nikto/)                    |    Pluggable web server and CGI scanner                             |
|     [wpscan](https://www.kali.org/tools/wpscan/)                  |    Scanner for Wordpress security issues                            |
|     [uniscan](https://www.kali.org/tools/uniscan/)                |    URL scanner for vuln. + enables directory and dynamic checks     |
|     [apktool](https://www.kali.org/tools/apktool/)                |    Reverse engineering 3rd party, closed, binary Android apps       |
|     [dex2jar](https://www.kali.org/tools/dex2jar/)                |    Dex-reader is designed to read the Dalvik Executable format      |
|     [binwalk](https://www.kali.org/tools/binwalk/)                |    Searching a given binary image for embedded files or executable  |
|     [nmap](https://www.kali.org/tools/nmap/)                      |    Network Mapper                                                   |
|     [aircrack-ng](https://www.kali.org/tools/aircrack-ng/)        |    Complete suite of tools to assess WiFi network security          |
|     [hydra](https://www.kali.org/tools/hydra/)                    |    Parallelized login cracker which supports numerous protocols     |
|     [wireshark](https://www.kali.org/tools/wireshark/)            |    Network Protocol Analyzer                                        |
|     [burpsuite](https://www.kali.org/tools/burpsuite/)            |    Integrated platform for performing security testing of web apps  |
|     [john](https://www.kali.org/tools/john/)                      |    John The Ripper - Password Cracker                               |
|     [responder](https://www.kali.org/tools/responder/)            |    Responder/MultiRelay, an LLMNR, NBT-NS and MDNS poisoner         |
|     [crackmapexec](https://www.kali.org/tools/crackmapexec/)      |    Swiss army knife for pentesting Windows/Active Directory envs.   |
|     [metasploit-framework](https://www.kali.org/tools/metasploit-framework/) | vulnerability research, exploit development, and the creation of custom security tools
|     [sqlmap](https://www.kali.org/tools/sqlmap/)                  |    Detects and take advantage of SQL injection vulnerabilities in web applications
|     [set](https://www.kali.org/tools/set/)                        |    Social Engineering Toolkit                                       |
|     [ncrack](https://www.kali.org/tools/ncrack/)                  |    High-speed network authentication cracking tool                  |