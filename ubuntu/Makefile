build:
	docker build -t ubuntu:resolute .

exec:
	docker run -dit \
		--privileged \
		--name ubuntu-systemd \
		--workdir /usr \
		ubuntu:resolute bash

shell:
	docker exec -it ubuntu-systemd bash
