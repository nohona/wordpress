FROM wordpress

MAINTAINER nohona <nohona@hotmail.com>

LABEL version 1.0
LABEL description "Wordpress extend with aws cli and certbot support"

# Install pip and aws cli
RUN apt-get update && apt-get install -y python-pip \
        python-dev \
        build-essential \
        wget \
        unzip \
        && pip install --upgrade pip \
        && pip install --upgrade --user awscli \
        && wget https://github.com/certbot/certbot/archive/master.zip -P /usr/local \
        && unzip /usr/local/master.zip -d /usr/local \
        && rm /usr/local/master.zip

# To build:
# docker build -t <user-name>/wordpress:latest .

# Container shell access:
# docker exec -it wordpress bash
# docker logs wordpress