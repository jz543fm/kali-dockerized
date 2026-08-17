DOCKER=sudo docker

build:
	$(DOCKER) build -f Dockerfile_systemd -t kali_s:latest .

exec:
	$(DOCKER) run -dit \
		--privileged \
		--name kali-systemd \
		--workdir /usr \
		-p 87:8087 \
		kali_s:latest bash

shell:
	$(DOCKER) exec -it kali-systemd bash

stop:
	$(DOCKER) stop kali-systemd

tag:
	$(DOCKER) tag kali_s:latest lostcauze7/kali-dockerized:latest

push:
	$(DOCKER) push lostcauze7/kali-dockerized:latest
