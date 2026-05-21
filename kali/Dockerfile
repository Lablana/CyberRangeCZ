FROM kalilinux/kali-rolling:latest

RUN apt update && apt install -y \
    nmap \
    sqlmap \
    hydra \
    curl \
    wpscan \
    wget \
    net-tools \
    iputils-ping \
    netcat-openbsd \
    tcpdump

CMD ["/bin/bash"]
