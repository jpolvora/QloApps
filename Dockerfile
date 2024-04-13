FROM php:7.4-apache

RUN apt-get update -y
RUN apt-get upgrade -y
RUN a2enmod rewrite
RUN apt-get install libssl-dev libxml2-dev libzip-dev zlib1g-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libjpeg-dev zip unzip libicu-dev -y --fix-missing
RUN docker-php-ext-configure gd
RUN docker-php-ext-install mysqli pdo pdo_mysql zip soap gd phar simplexml


RUN echo "file_uploads = On\n" \
         "memory_limit = 500M\n" \
         "upload_max_filesize = 16M\n" \
         "post_max_size = 500M\n" \
         "max_execution_time = 500\n" \
         "log_errors = on\n" \
         "error_reporting = 32767 \n" \
         "extension=gd" \
         >> /usr/local/etc/php/conf.d/php-custom.ini
         
RUN echo "ServerName localhost-qloapps " >> /etc/apache2/apache2.conf

#RUN usermod -u 1000 www-data