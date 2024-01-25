#!/usr/bin/env bash
echo "Running composer"
composer global require hirak/prestissimo
composer install --working-dir=/var/www/html

php artisan key:generate
echo "Generate key"

echo "Caching config..."
php artisan config:clear
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "add npm install && npm run dev"
npm install && npm run dev
