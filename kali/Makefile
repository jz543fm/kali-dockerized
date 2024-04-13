build:

	docker build -f Dockerfile_systemd -t kali_s:latest .

exec:

	docker run -it -p 87:8087 --rm --privileged --workdir /usr --name kali-systemd kali_s:latest bash

tag:

	docker tag kali_s:latest lostcauze7/kali-dockerized:latest

push:

	docker push lostcauze7/kali-dockerized:latest

