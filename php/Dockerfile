FROM php:7.2-cli
RUN apt-get update && apt-get install mysql-client libmagick++-dev -y
RUN docker-php-source extract \
    && docker-php-ext-install mysqli pdo_mysql \
    && pecl install imagick \
    && docker-php-ext-enable imagick \ 
    && docker-php-source delete
WORKDIR /app