# Dockerized Kali Linux and Ubuntu 20.04

Dockerized Kali Linux + Ubuntu 20.04 for Bug Bounty, Penetration Testing, Security Research, Computer Forensics and Reverse Engineering

I am using [Official](https://www.kali.org/docs/containers/official-kalilinux-docker-images/) Kali Linux Docker image **kalilinux/kali-rolling**, also this page describe **Official Kali Linux Docker Images** 

## Docker Hub

There you can find pre build `Kali Linux with systemd Docker Image`

[lostcauze7/kali-dockerized](https://hub.docker.com/r/lostcauze7/kali-dockerized)

If you want to use pre built `Kali Linux with systemd Docker Image` just use command bellow,
**if you want to build locally, read the documentation!**

```bash
make docker-p-b #Makefile docker pre built Kali
docker exec -it -u root kali_p bash #docker exec to the pre buil Kali Linux Docker container with systemd support
```

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
make docker-p-b
```

#### Run Kali Linux in Docker with systemd in container

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

### TODO Kali Tools

OSINT:

1. [sn0int](https://github.com/kpcyrd/sn0int)

## Tools List
 
 |   Tools in Kali Linux                                             | Usage                                                              
| ------------------------------------------------------------------|---------------------------------------------------------------------|
|     [aircrack-ng](https://www.kali.org/tools/aircrack-ng/)        |    Complete suite of tools to assess WiFi network security          |
|     [amap](https://www.kali.org/tools/amap/)                      |    Application Mapper                                               |
|     [apktool](https://www.kali.org/tools/apktool/)                |    Reverse engineering 3rd party, closed, binary Android apps       |
|     [beef-xss](https://beefproject.com)                           |    Browser Exploitation Framework                                   |
|     [binwalk](https://www.kali.org/tools/binwalk/)                |    Searching a given binary image for embedded files or executable  |
|     [blackbird](https://github.com/p1ngul1n0/blackbird/)                  |    OSINT
|     [burpsuite](https://www.kali.org/tools/burpsuite/)            |    Integrated platform for performing security testing of web apps  |
|     [crackmapexec](https://www.kali.org/tools/crackmapexec/)      |    Swiss army knife for pentesting Windows/Active Directory envs.   |
|     [cri-tools](https://www.kali.org/tools/cri-tools/)                  |     contains a series of debugging and validation tools for Kubelet CRI, which includes(critest,crictl)                 |
|     [dex2jar](https://www.kali.org/tools/dex2jar/)                |    Dex-reader is designed to read the Dalvik Executable format      |
|     [dirb](https://www.kali.org/tools/dirb/)                      |    Web Content Scanner                                              |
|     [exploitdb](https://gitlab.com/kalilinux/packages/exploitdb)  |    Searchable Exploit Database archive                              |
|     [hydra](https://www.kali.org/tools/hydra/)                    |    Parallelized login cracker which supports numerous protocols     |
|     [john](https://www.kali.org/tools/john/)                      |    John The Ripper - Password Cracker                               |
|     [kube-hunter](https://github.com/aquasecurity/kube-hunter)                  |    Hunts for weakness in K8s cluster/s
|     [kubernetes-helm](https://www.kali.org/tools/kubernetes-helm/#helm)                  |    Tool for managing Helm charts
|     [mandb](https://man7.org/linux/man-pages/man8/mandb.8.html)   |    Updates man pages                                                |
|     [metasploit-framework](https://www.kali.org/tools/metasploit-framework/) | vulnerability research, exploit development, and the creation of custom security tools
|     [ncrack](https://www.kali.org/tools/ncrack/)                  |    High-speed network authentication cracking tool                  |
|     [nikto](https://www.kali.org/tools/nikto/)                    |    Pluggable web server and CGI scanner                             |
|     [nmap](https://www.kali.org/tools/nmap/)                      |    Network Mapper                                                   |
|     [responder](https://www.kali.org/tools/responder/)            |    Responder/MultiRelay, an LLMNR, NBT-NS and MDNS poisoner         |
|     [set](https://www.kali.org/tools/set/)                        |    Social Engineering Toolkit                                       |
|     [sqlmap](https://www.kali.org/tools/sqlmap/)                  |    Detects and take advantage of SQL injection vulnerabilities in web applications
|     [steghide](https://www.kali.org/tools/steghide/)              |    Steganography program which hides bits of a data file                  |
|     [the Harvester](https://www.kali.org/tools/theharvester/)                  |    Contains a tool for gathering subdomain names, e-mail addresses, virtual hosts, open ports/ banners, and employee names from different public sources (search engines, pgp key servers).                 |
|     [trufflehog](https://www.kali.org/tools/trufflehog/)          |    Allows you to find secrets in git repositories                |
|     [uniscan](https://www.kali.org/tools/uniscan/)                |    URL scanner for vuln. + enables directory and dynamic checks     |
|     [wapiti](https://www.kali.org/tools/wapiti/)                  |    Allows you to audit the security of your web applications                 |
|     [whatmask](https://www.kali.org/tools/whatmask/)              |     Network Admin Helper                 |
|     [whatweb](https://www.kali.org/tools/whatweb/)                |    Identifies website                 |
|     [wireshark](https://www.kali.org/tools/wireshark/)            |    Network Protocol Analyzer                                        |
|     [wpscan](https://www.kali.org/tools/wpscan/)                  |    Scanner for Wordpress security issues                            |
|     [xssRecon](https://github.com/Ak-wa/XSSRecon)                 |    Reflected XSS Scanner                                            |
|     [xsser](https://github.com/epsylon/xsser)                     |    Automation framework to detect XSS                               |
|     [yara](https://www.kali.org/tools/yara/)                  |    Can identify/classify malware samples                 |

### Sort List

```bash
sort -t '[' -k 2,2 -i README.md > sorted.txt
```