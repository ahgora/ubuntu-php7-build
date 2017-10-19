FROM ubuntu:xenial

RUN apt-get update \
    && apt-get install -y php7.0 php7.0-xml php7.0-mbstring pkg-config php-pear php7.0-dev git zip unzip  \
    && pecl install mongodb  \
    && echo "extension=mongodb.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"` \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
