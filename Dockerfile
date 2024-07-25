# Gunakan image PHP resmi dengan Apache
FROM php:7.4-apache

# Install ekstensi yang dibutuhkan oleh CodeIgniter
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy seluruh source code aplikasi ke dalam container
COPY . /var/www/html

# Set direktori kerja
WORKDIR /var/www/html

# Buat direktori cache dan logs jika belum ada, kemudian berikan izin
RUN mkdir -p /var/www/html/application/cache /var/www/html/application/logs \
    && chown -R www-data:www-data /var/www/html/application/cache /var/www/html/application/logs

# Enable mod_rewrite
RUN a2enmod rewrite
