FROM php:8.3.7-fpm-alpine3.19

RUN mkdir -p /var/www/html



# RUN apk add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN docker-php-ext-install pdo pdo_mysql

