FROM php:8.2-apache


RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*
    RUN a2enmod rewrite
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
COPY ./apache/apache-config.conf /etc/apache2/sites-available/000-default.conf


WORKDIR /var/www/html

COPY src/ /var/www/html

# Set permissions for storage directory
RUN chown -R www-data:www-data /var/www/html/storage
RUN chmod -R 775 /var/www/html/storage


EXPOSE 80
