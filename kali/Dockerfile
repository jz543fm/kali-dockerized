FROM kalilinux/kali-rolling

#https://github.com/moby/moby/issues/27988
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Update + common tools + Install Metapackages https://www.kali.org/docs/general-use/metapackages/

RUN apt-get update; apt-get install -y -q kali-linux-headless

RUN apt-get install -y wget curl net-tools whois netcat-traditional pciutils bmon htop

#Sets WORKDIR to /usr

WORKDIR /usr

# XSS-RECON

RUN git clone https://github.com/Ak-wa/XSSRecon; 

# Install dependencies

RUN apt -y install python3-pip npm nodejs golang

# Blackbird
RUN git clone https://github.com/p1ngul1n0/blackbird; cd blackbird; pwd; pip install -r requirements.txt;

# Kube-hunter
# for usage: cd /blackbird/
# python blackbird.py
RUN git clone https://github.com/aquasecurity/kube-hunter.git; cd kube-hunter; pip install kube-hunter;

# Common packages

RUN apt -y install kali-tools-top10 \
    amap \
    apktool \
    arjun \
    beef-xss \
    binwalk \
    cri-tools \
    dex2jar \
    dirb \
    exploitdb \
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
    wpscan \
    xsser \
    yara \
    whatmask

RUN apt-get update;

RUN apt-get clean && rm -rf /var/lib/apt/lists/*