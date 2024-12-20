# Menggunakan image PHP dengan Apache
FROM php:8.0-apache

# Menyalin file proyek ke /var/www/html
COPY . /var/www/html/

# Menginstal ekstensi PHP tambahan jika diperlukan (misalnya, MySQL)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Mengatur izin file jika diperlukan
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Mengekspos port yang digunakan oleh Apache
EXPOSE 80