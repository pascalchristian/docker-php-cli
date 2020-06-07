FROM php:7.3-cli

# global environment settings
ENV \
PUID='1000' \
PGID='1000' 

# install packages
RUN \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --filename=composer --install-dir=/bin && \
    php -r "unlink('composer-setup.php');" && \
    groupadd --gid "${PGID}" phpgroup && \
    useradd --uid "${PUID}" -g phpgroup -d /app phpuser 
RUN apt update && apt install -y gosu

WORKDIR /app
VOLUME /app
EXPOSE 8000

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
