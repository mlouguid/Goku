FROM php:8.3-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies and PHP extensions in one layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    zip \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libpq-dev \
    postgresql-client \
    iputils-ping \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) pdo pdo_pgsql gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Enable Composer Bash completion
RUN composer completion bash > /etc/bash_completion.d/composer && \
    echo "source /etc/bash_completion.d/composer" >> /etc/bash.bashrc

# Copy composer files first to leverage Docker cache
COPY composer.json composer.lock ./

# Install PHP dependencies (excluding dev)
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

# Copy the rest of your app
COPY . .

# Expose port (default FPM port)
ARG SERVER_PORT=9000
EXPOSE ${SERVER_PORT}