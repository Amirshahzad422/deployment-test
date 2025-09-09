#!/bin/bash

# Install Composer dependencies
composer install --no-dev --optimize-autoloader

# Install Node dependencies and build frontend
npm install
npm run build

# Create basic .env file for build
echo "APP_ENV=production" > .env
echo "APP_DEBUG=false" >> .env
echo "APP_KEY=" >> .env
echo "LOG_CHANNEL=stderr" >> .env
echo "DB_CONNECTION=sqlite" >> .env
echo "DB_DATABASE=/tmp/database.sqlite" >> .env

# Generate application key
php artisan key:generate --force --no-interaction

# Generate Ziggy routes
php artisan ziggy:generate

echo "Build completed successfully!" 