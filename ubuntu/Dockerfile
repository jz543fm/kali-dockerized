FROM ubuntu:jammy

#https://github.com/moby/moby/issues/27988
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update; apt-get install -y wget curl net-tools bmon htop netcat-traditional pciutils; apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr

# Install Go

ENV GO_VERSION=1.21.4

RUN curl -sSLO https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz; tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz; rm -rf go$GO_VERSION.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

# Install language dependencies

RUN apt-get update; apt-get -y install python3-pip npm nodejs

CMD ["/bin/bash"]