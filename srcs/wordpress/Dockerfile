FROM debian:bullseye

# install tools
RUN apt-get update
RUN apt-get -y install wget

# install php 8.2
# php version compatibility: https://make.wordpress.org/core/handbook/references/php-compatibility-and-wordpress-versions/
RUN apt-get -y install gnupg2
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN echo "deb https://packages.sury.org/php/ bullseye main" > /etc/apt/sources.list.d/sury-php.list
RUN apt-get update

# wordpress php extenstions: https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions
RUN apt-get -y install php8.2-fpm
RUN apt-get -y install php8.2-mysqli

COPY tools/ /tools
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
RUN chmod +x /tools/wordpress_start.sh

RUN mkdir -p /run/php

# open default port for php-fpm (FastCGI Process Manager)
EXPOSE 9000

HEALTHCHECK --interval=2s CMD pgrep -f 'php-fpm' || exit 1

ENTRYPOINT ["/tools/wordpress_start.sh"]
