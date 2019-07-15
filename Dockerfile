FROM node:10.16.0-jessie

#
# BASE PACKAGES
#
RUN apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install \
    bzip2 \
    ca-certificates \
    unzip \
    wget \
    curl \
    git \
    jq \
    zip \
    xvfb \
    pulseaudio \
    dbus \
    dbus-x11 \
    build-essential && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#
# INSTALL AND CONFIGURE
#
COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod u+rx,g+rx,o+rx,a-w /opt/docker-entrypoint.sh

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
CMD ["node", "--version"]
