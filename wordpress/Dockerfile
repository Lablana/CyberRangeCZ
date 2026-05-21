FROM wordpress:latest

RUN apt update && apt install -y \
    curl \
    netcat-openbsd \
    wget \
    nano \
    vim \
    net-tools \
    iputils-ping

CMD ["apache2-foreground"]
