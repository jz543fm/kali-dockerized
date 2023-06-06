# Build the Kali image with systemd support
create-build:
	cd kali/ && docker build -t kali -f Dockerfile_systemd . 

# Run the Kali image in a container
image-run:
	docker run -it --rm --privileged --workdir /usr --name kali-systemd kali /bin/bash

# Scan for vuln. in Kali Linux Docker image

kali-scan:
	trivy image kali

# Docker stats for Kali Linux Docker image

kali-stats:
	docker stats -a kali_systemd

# Docker compose to build all services in docker-compose.yaml

docker-build:

	docker compose up -d --build

# Docker compose run builed Kali Linux with systemd support from docker-compose.yaml

docker-build-systemdr:

	docker compose run --rm kali_systemd_2 bash