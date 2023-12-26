# Build and run the Kali Linux in Docker without systemd 

build-run-plain:
	docker run -p 127.0.0.1:88:8088 --network host --name kali -itd kalilinux/kali-rolling; docker attach kali 

# Build the Kali image with systemd support
create-build-s:
	cd kali/ && docker build -t kali -f Dockerfile_systemd . 

# Run the Kali image in a container
image-run-s:
	docker run -it -p 87:8087 --network host --rm --privileged --workdir /usr --name kali-systemd kali /bin/bash

# Scan for vuln. in Kali Linux Docker image

kali-scan:
	trivy image kali

# Docker stats for Kali Linux Docker image

kali-stats:
	docker stats -a kali_systemd

# Docker compose to build all services in docker-compose.yaml

docker-c-build:

	docker compose up -d --build

# Docker compose run builed Kali Linux with systemd support from docker-compose.yaml

docker-c-build-systemd:

	docker-compose up -d --build; docker compose run --rm kali_systemd_2 bash

# Docker prebuilt

docker-p-b:

	docker run -p 87:8087 --network host --rm --privileged --workdir /usr --name kali_p -itd lostcauze7/kali-dockerized:latest; docker attach kali_p

# Creates Kind cluster (Kubernetes in Docker) with the config file in kali/deploy/config.yaml

cc:
	kind create cluster --config=kali/deploy/config.yaml

# Deletes Kind cluster

dc:
	kind delete cluster