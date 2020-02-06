FROM wordpress:php7.4

RUN apt-get update

RUN apt-get install -qq -y mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
    chmod +x wp-cli.phar;\
    mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install -y htop vim
RUN a2enmod ssl

RUN ln -sf /var/docker/apache2/sites-enabled/site.conf /etc/apache2/sites-enabled/