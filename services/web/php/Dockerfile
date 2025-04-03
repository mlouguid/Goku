FROM php:8.3-fpm

WORKDIR /var/www/html

COPY php.ini /usr/local/etc/php/php.ini

RUN apt-get update -y

RUN apt-get install -y sudo python3 vim wget zsh git unzip nano net-tools htop iputils-ping procps libnss3 ca-certificates curl gnupg\
    && echo "progress = dot:giga" | tee /etc/wgetrc \
    && mkdir -p /mnt /opt /data \
    && wget https://github.com/andmarios/duphard/releases/download/v1.0/duphard -O /bin/duphard \
    && chmod +x /bin/

RUN mkdir -p /var/log/youcan -p /var/dev

RUN chown -R www-data:www-data /var/log/ /var/dev /usr/local/etc/php/

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && NODE_MAJOR=20 \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list \
    && sudo apt-get update && sudo apt-get install nodejs -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libzip-dev \
    libmagickwand-dev --no-install-recommends \
    && apt-get install -y gnupg \
    && apt-get update \
    && apt-get install -y fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
    --no-install-recommends \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl bcmath \
    && docker-php-ext-install zip \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install soap \
    && pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev \
    && pecl install mongodb

RUN printf "\n" | pecl install imagick

RUN docker-php-ext-enable imagick

RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libmemcached-dev \
    && MEMCACHED="`mktemp -d`" \
    && curl -skL https://github.com/php-memcached-dev/php-memcached/archive/master.tar.gz | tar zxf - --strip-components 1 -C $MEMCACHED \
    && docker-php-ext-configure $MEMCACHED \
    && docker-php-ext-install $MEMCACHED \
    && rm -rf $MEMCACHED

RUN npm install -g memcached-cli \
    && docker-php-ext-enable mongodb

RUN rm -rf /var/lib/apt/lists/*