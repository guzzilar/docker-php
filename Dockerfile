FROM php:5.6-apache

RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y --force-yes \
    unzip \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libxml2-dev \
    libxslt-dev \
    libicu-dev \
    zlib1g-dev \
    git \

    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \

    && docker-php-ext-configure intl \

    && docker-php-ext-install mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install gd \
    && docker-php-ext-install soap \
    && docker-php-ext-install xsl \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip

RUN a2enmod rewrite

EXPOSE 80
