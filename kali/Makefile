build:

	DOCKER_BUILDKIT=1 docker build -f Dockerfile_systemd -t kali_s:latest .

exec:

	docker run -it -u root kali_s:latest bash

tag:

	docker tag kali_s:latest lostcauze7/kali-dockerized:latest

push:

	docker push lostcauze7/kali-dockerized:latest

