FROM ubuntu:xenial

RUN apt-get update \
    && apt-get install -y php7.0 php7.0-fpm php7.0-dev php7.0-xml php7.0-mbstring php-pear pkg-config git zip unzip  \
    && pecl install mongodb  \
    && echo "extension=mongodb.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"` \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
