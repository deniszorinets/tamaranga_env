FROM php:5-fpm

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install libicu-dev libfreetype6-dev libpng12-dev libjpeg62-turbo-dev libxml2-dev autoconf g++ libtool make \
    && docker-php-ext-install gd \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && docker-php-ext-install soap \
    && docker-php-ext-install intl \
    && docker-php-ext-install shmop \
    && curl -O https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvf ioncube_loaders_lin_x86-64.tar.gz \
    && mv ./ioncube/ioncube_loader_lin_5.6.so $(php-config --extension-dir) \
    && echo "zend_extension = ioncube_loader_lin_5.6.so" >> /usr/local/etc/php/conf.d/docker-php-ext-ioncube.ini \
    && rm -rf ioncube \
    && rm -f ioncube_loaders_lin_x86-64.tar.gz

COPY php.ini /usr/local/etc/php/