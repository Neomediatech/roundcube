FROM roundcube/roundcubemail:latest

ENV VERSION=$ROUNDCUBEMAIL_VERSION \
    SERVICE=roundcube

LABEL org.opencontainers.image.source=https://github.com/Neomediatech/${SERVICE} \
      org.opencontainers.package.name="${SERVICE}" \
      it.neomediatech.app-label=meta \
      org.opencontainers.image.description="Roundcube webmail is an open-source webmail client. It's a browser-based IMAP client with an application-like user interface. The image is designed for simple deployment, allowing users to access their email directly through a web browser. This image is directly derived from official image with this additions: PHP soap module, OPcache enabled, Europe/Rome timezone, unzip, libxml2-dev"

ARG BIN_SOURCE=https://github.com/Neomediatech/assets/raw/refs/heads/main/bin
ADD --chmod=777 ${BIN_SOURCE}/unzip \
                /usr/local/bin/

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libxml2-dev \
    ; \
    docker-php-ext-install soap; \
    ln -s /usr/bin/composer /usr/bin/composer.phar;

COPY php-custom.ini /usr/local/etc/php/conf.d/
COPY zzz-php-fpm-custom.conf /usr/local/etc/php-fpm.d/

