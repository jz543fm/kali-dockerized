FROM kalilinux/kali-rolling

#https://github.com/moby/moby/issues/27988
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Update + common tools + Install Metapackages https://www.kali.org/docs/general-use/metapackages/

RUN apt-get update; apt-get install -y -q kali-linux-headless

# Default packages

RUN apt-get install -y wget curl net-tools whois netcat-traditional pciutils bmon htop tor

# Kali - Common packages

RUN apt -y install amap \
    apktool \
    arjun \
    beef-xss \
    binwalk \
    cri-tools \
    dex2jar \
    dirb \
    exploitdb \
    kali-tools-top10 \
    kubernetes-helm \
    lsof \
    ltrace \
    man-db \
    nikto \
    set \
    steghide \
    strace \
    theharvester \
    trufflehog \
    uniscan \
    wapiti \
    whatmask \
    wpscan \
    xsser \
    yara

#Sets WORKDIR to /usr

WORKDIR /usr

# XSS-RECON

RUN git clone https://github.com/Ak-wa/XSSRecon; 

# Install language dependencies

RUN apt -y install python3-pip npm nodejs golang

# GitHub Additional Tools

# Blackbird
# for usage: blackbird/
# python blackbird.py
RUN git clone https://github.com/p1ngul1n0/blackbird; cd blackbird; pwd; pip install -r requirements.txt;

# Maigret
# for usage: cd maigret/
# ./maigret.py
RUN git clone https://github.com/soxoj/maigret.git && cd maigret && pip3 install -r requirements.txt

# Sherlock
# for usage cd sherlock/
# python3 sherlock --help
RUN git clone https://github.com/sherlock-project/sherlock.git && cd sherlock && python3 -m pip install -r requirements.txt

RUN apt-get clean && rm -rf /var/lib/apt/lists/*