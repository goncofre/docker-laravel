FROM php:8.3.6-fpm-alpine

WORKDIR /var/www/html

RUN apk add --no-cache $PHPIZE_DEPS linux-headers \
    libpng libpng-dev libjpeg-turbo libjpeg-turbo-dev freetype freetype-dev \
    libzip-dev \
    openjdk11 \
    libxml2-dev \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd zip soap pdo pdo_mysql pcntl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer