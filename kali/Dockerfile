FROM kalilinux/kali-rolling

#https://github.com/moby/moby/issues/27988
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Update + common tools + Install Metapackages https://www.kali.org/docs/general-use/metapackages/

RUN apt-get update; apt-get install -y -q kali-linux-headless

RUN apt-get install -y wget curl net-tools whois netcat-traditional pciutils bmon htop

# Install dependencies

RUN apt -y install python3-pip npm nodejs golang

# Install Kali Linux "Top 10" metapackage and a few cybersecurity useful tools

# package [kali-tools-top10] = aircrack-ng, hydra, nmap, wireshark, burpsuite, john, responder, crackmapexec, metasploit-framework, sqlmap

RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan lsof apktool dex2jar ltrace strace binwalk