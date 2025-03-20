

FROM php:8.2-apache


# Définir des variables d'environnement depuis le fichier .env
ARG INSTALL_CHROMIUM=false
ARG INSTALL_LATEX=false
ARG INSTALL_NODEJS=false
ARG INSTALL_YARN=false
ARG INSTALL_IMAGICK=false
ARG INSTALL_AMQP=false
ARG INSTALL_GD=false
ARG INSTALL_APCU=false
ARG INSTALL_MYSQL=false
ARG INSTALL_MEMCACHED=false
ARG INSTALL_XDEBUG=false
ARG INSTALL_POSTGRESQL=false
ENV INSTALL_GD=$INSTALL_GD


# Activer mod_rewrite pour Apache
RUN a2enmod rewrite

# Définir des variables d'environnement pour Symfony et Composer
ENV SYMFONY_VERSION=6 \
    COMPOSER_ALLOW_SUPERUSER=1 \
    PATH=/var/www/html/vendor/bin:$PATH

# Installer les dépendances système de base
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    libicu-dev \
    libpng-dev \
    libzip-dev \
    nano \
    unzip \
    zip \
    ca-certificates \
    gnupg \
    libmagickwand-dev \
    librabbitmq-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmemcached-tools \
    libnss3 \
    libicu-dev \
    webp \
    && rm -rf /var/lib/apt/lists/*


# Installer l'extension intl
RUN docker-php-ext-install intl

# Node.js seulement si INSTALL_NODEJS est défini sur true
RUN if [ "$INSTALL_NODEJS" = "true" ]; then \
    echo "Installing Node.js">&2 && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs; fi

# Installer Yarn seulement si INSTALL_YARN est défini sur true
RUN if [ "$INSTALL_YARN" = "true" ]; then \
    echo "Installing Yarn">&2 && \
    npm install --global yarn; fi

# Imagick seulement si INSTALL_IMAGICK est défini sur true
RUN if [ "$INSTALL_IMAGICK" = "true" ]; then \
    echo "Installing Imagick">&2 && \
    pecl install imagick && \
    docker-php-ext-enable imagick; fi

# AMQP seulement si INSTALL_AMQP est défini sur true
RUN if [ "$INSTALL_AMQP" = "true" ]; then \
    echo "Installing AMQP">&2 && \
    pecl install amqp && \
    docker-php-ext-enable amqp; fi

# MySQL seulement si INSTALL_MYSQL est défini sur true
RUN if [ "$INSTALL_MYSQL" = "true" ]; then \
    echo "Installing MySQL">&2 && \
    docker-php-ext-install pdo_mysql; fi

# PostgreSQL seulement si INSTALL_POSTGRESQL est défini sur true
RUN if [ "$INSTALL_POSTGRESQL" = "true" ]; then \
    echo "Installing PostgreSQL">&2 && \
    docker-php-ext-install pdo_pgsql; fi

#XDEBUG seulement si INSTALL_XDEBUG est défini sur true
RUN if [ "$INSTALL_XDEBUG" = "true" ]; then \
    echo "Installing Xdebug">&2 && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug; fi
    
# Memcached seulement si INSTALL_MEMCACHED est défini sur true
RUN if [ "$INSTALL_MEMCACHED" = "true" ]; then \
    echo "Installing Memcached">&2 && \
    pecl install memcached && \
    docker-php-ext-enable memcached; fi

# APCu seulement si INSTALL_APCU est défini sur true
RUN if [ "$INSTALL_APCU" = "true" ]; then \
    echo "Installing APCu">&2 && \
    docker-php-source extract && \
    mkdir -p /usr/src/php/ext/apcu && \
    curl -fsSL https://github.com/krakjoe/apcu/archive/v5.1.22.tar.gz | tar xvz -C /usr/src/php/ext/apcu --strip 1 && \
    docker-php-ext-install apcu && \
    docker-php-source delete; fi

# GD seulement si INSTALL_GD est défini sur true
RUN if [ "$INSTALL_GD" = "true" ]; then \
    echo "Installing GD">&2 && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd; fi


# Chromium seulement si INSTALL_CHROMIUM est défini sur true
RUN if [ "$INSTALL_CHROMIUM" = "true" ]; then \
    echo "Installing Chromium">&2 && \
    apt-get install -y chromium; fi

# LaTeX seulement si INSTALL_LATEX est défini sur true
RUN if [ "$INSTALL_LATEX" = "true" ]; then \
    echo "Installing LaTeX">&2 && \
    apt-get install -y texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra; fi

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurer Apache
RUN a2enmod cache && \
    a2enmod cache_disk && \
    a2enmod headers

# Copier la configuration Apache
COPY ./BuildConfig/apache.conf /etc/apache2/sites-enabled/000-default.conf

# Copier le fichier php.ini
COPY ./BuildConfig/php.ini /php.ini
RUN cat /php.ini >> ${PHP_INI_DIR}/php.ini

# Copier le code source de l'application
COPY . /app

# Définir le répertoire de travail
WORKDIR /app

# Ajouter un alias pour la commande Symfony
RUN echo 'alias sc="php /app/bin/console"' >> ~/.bashrc

# Définir le script comme point d'entrée
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Démarrer Apache
CMD ["apache2-foreground"]
