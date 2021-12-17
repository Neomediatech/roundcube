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
    docker-php-ext-install soap; 

