FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl \
    wget \
    gnupg2 \
    ca-certificates \
    lsb-release \
    software-properties-common \
    apt-transport-https

RUN mkdir -p /etc/apt/keyrings

RUN curl -fsSL \
https://download.opensuse.org/repositories/security:zeek/xUbuntu_22.04/Release.key \
| gpg --dearmor \
-o /etc/apt/keyrings/zeek.gpg

RUN echo "deb [signed-by=/etc/apt/keyrings/zeek.gpg] \
http://download.opensuse.org/repositories/security:/zeek/xUbuntu_22.04/ /" \
> /etc/apt/sources.list.d/zeek.list

RUN apt update && apt install -y \
    zeek \
    tcpdump \
    tshark \
    suricata \
    net-tools \
    iproute2 \
    iputils-ping \
    nano \
    vim

# PATH
ENV PATH="/opt/zeek/bin:$PATH"

# Zeek logs folder
RUN mkdir -p /logs/zeek

# Start script
COPY start-monitor.sh /start-monitor.sh

RUN chmod +x /start-monitor.sh

CMD ["/start-monitor.sh"]
