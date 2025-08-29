# ---------- Base image with system deps & PHP extensions ----------
FROM php:8.2-fpm 

WORKDIR /var/www/html

# Install system packages needed for common PHP extensions and tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl unzip zip \
    libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    libpq-dev \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        gd \
        pdo \
        pdo_pgsql \
        intl \
        bcmath \
        pcntl \
        opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

# Optional: tune PHP for production (you can override via mounted ini)
RUN { \
    echo "opcache.enable=1"; \
    echo "opcache.enable_cli=0"; \
    echo "opcache.jit_buffer_size=0"; \
    echo "opcache.validate_timestamps=0"; \
    echo "upload_max_filesize=20M"; \
    echo "post_max_size=21M"; \
} > /usr/local/etc/php/conf.d/zz-prod.ini

# copy only composer files first for better caching
COPY composer.json  ./

# Set environment for faster Composer installs in CI/containers
ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_NO_INTERACTION=1

RUN composer install --no-dev --prefer-dist --no-scripts --no-progress

COPY --chown=www-data:www-data . .

EXPOSE 9000

CMD ["php-fpm"]