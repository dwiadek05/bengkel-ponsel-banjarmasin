# Gunakan image PHP resmi dengan Apache
FROM php:7.4-apache

# Install ekstensi yang dibutuhkan
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy seluruh source code ke dalam container
COPY src/ /var/www/html/

# Beri izin untuk direktori yang dibutuhkan (jika ada)
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Enable mod_rewrite
RUN a2enmod rewrite

# Konfigurasi Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80
