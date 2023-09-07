FROM kalilinux/kali-rolling

#https://github.com/moby/moby/issues/27988
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Update + common tools + Install Metapackages https://www.kali.org/docs/general-use/metapackages/

RUN apt-get update; apt-get install -y -q kali-linux-headless

RUN apt-get install -y wget curl net-tools whois netcat-traditional pciutils bmon htop

#Additional from todo

RUN DEBIAN_FRONTEND=noninteractive apt -y install amap xsser beef-xss set ncrack

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

# package [kali-tools-top10] = aircrack-ng, hydra, nmap, wireshark, burpsuite, john, responder, crackmapexec, metasploit-framework, sqlmap

RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 \
                                                exploitdb \
                                                man-db \
                                                dirb \
                                                nikto \
                                                wpscan \
                                                uniscan \
                                                lsof \
                                                apktool \
                                                dex2jar \
                                                ltrace \
                                                strace \
                                                binwalk \
                                                trufflehog \
                                                steghide \
						yara \
						whatmask \
						wapiti \
						theharvester \
						cri-tools \
						kubernetes-helm
RUN apt-get update;