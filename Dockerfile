FROM richarvey/nginx-php-fpm:latest

COPY . .

# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

RUN npm install --force
# Laravel config
ENV APP_KEY base64:C6UFiqyZawWkK4RQ+DaEpItCZonEqKMClQzKyo8vDJ0=
ENV APP_ENV production
ENV APP_DEBUG true

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["/start.sh"]
