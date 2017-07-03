FROM php:5-cli

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install libicu-dev libfreetype6-dev libpng12-dev libjpeg62-turbo-dev libxml2-dev autoconf g++ libtool make zip unzip \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-jpeg \
        --with-gif \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install intl \
    && docker-php-ext-install shmop \
    && docker-php-ext-install zip \
    && curl -O https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvf ioncube_loaders_lin_x86-64.tar.gz \
    && mv ./ioncube/ioncube_loader_lin_5.6.so $(php-config --extension-dir) \
    && echo "zend_extension = ioncube_loader_lin_5.6.so" >> /usr/local/etc/php/conf.d/docker-php-ext-ioncube.ini \
    && rm -rf ioncube \
    && rm -f ioncube_loaders_lin_x86-64.tar.gz

ENV PATH "/composer/vendor/bin:$PATH"
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV COMPOSER_VERSION 1.4.2

RUN curl -s -f -L -o /tmp/installer.php https://raw.githubusercontent.com/composer/getcomposer.org/da290238de6d63faace0343efbdd5aa9354332c5/web/installer \
 && php -r " \
    \$signature = '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410'; \
    \$hash = hash('SHA384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
        unlink('/tmp/installer.php'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    }" \

 && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
 && rm /tmp/installer.php \
 && composer --ansi --version --no-interaction

COPY php.ini /usr/local/etc/php/