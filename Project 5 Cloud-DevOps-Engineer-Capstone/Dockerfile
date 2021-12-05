FROM php:apache

# Sets the Author field of the generated images
LABEL NAME = "Abdelrazek Rizk" 
LABEL EMAIL = "abdelrazek.rizk@hotmail.com"
# a2enmod is a script that enables the specified module "rewrite" within the apache2 configuration
RUN a2enmod rewrite

RUN apt-get update \
    && apt-get install -y libzip-dev git wget nano unzip --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo mysqli pdo_mysql zip;

RUN wget --progress=dot:giga https://getcomposer.org/download/2.1.12/composer.phar \
    && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

#copy your files, if you want to copy all use COPY . .
# Copy source code to working directory
COPY /udacity.zip /var/www/html
RUN unzip -o /var/www/html/udacity.zip 

#COPY docker/apache.conf /etc/apache2/sites-enabled/000-default.conf
#COPY /000-default.conf /etc/apache2/sites-enabled/000-default.conf
#COPY /ports.conf /etc/apache2/ports.conf

# Expose port 80
EXPOSE 80

#change working directory
WORKDIR /var/www

CMD ["apache2-foreground"]