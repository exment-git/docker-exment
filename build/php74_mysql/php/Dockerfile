FROM php:7.4-fpm
ARG LARAVEL_VERSION="6.*"
ARG EXMENT_VERSION="~4.0"

# install php-ext
RUN apt-get update && apt-get install -y git wget gnupg vim unzip libxml2-dev libpng-dev libzip-dev libonig-dev \
  && docker-php-ext-install mbstring dom gd zip \
  && apt-get clean


RUN apt-get install -y default-mysql-client && docker-php-ext-install pdo_mysql


# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# install exment
RUN mkdir /var/www/exment
WORKDIR /var/www/exment
RUN COMPOSER_MEMORY_LIMIT=-1 composer create-project laravel/laravel=${LARAVEL_VERSION} .
RUN COMPOSER_MEMORY_LIMIT=-1 composer require exceedone/exment

RUN php artisan vendor:publish --provider="Exceedone\\Exment\\ExmentServiceProvider"
RUN chown -R www-data:www-data /var/www/exment \
  && chmod 755 -R /var/www/exment/storage \
  && chmod 755 -R /var/www/exment/bootstrap/cache

RUN rm /var/www/exment/.env

