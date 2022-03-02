FROM roundcube/roundcubemail:latest

ENV VERSION=$ROUNDCUBEMAIL_VERSION \
    SERVICE=roundcube

LABEL maintainer="docker-dario@neomediatech.it" \ 
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-type=Git \
      org.label-schema.vcs-url=https://github.com/Neomediatech/${SERVICE} \
      org.label-schema.maintainer=Neomediatech


RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libxml2-dev unzip \
    ; \
    docker-php-ext-install soap; \
    ln -s /usr/bin/composer /usr/bin/composer.phar;

COPY php-custom.ini /usr/local/etc/php/conf.d/
COPY zzz-php-fpm-custom.conf /usr/local/etc/php-fpm.d/

