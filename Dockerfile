# syntax=docker/dockerfile:1.7

FROM composer:2 AS dev

WORKDIR /var/www/html

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && docker-php-ext-install pdo_mysql \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
