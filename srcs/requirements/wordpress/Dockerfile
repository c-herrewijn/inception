FROM debian:bullseye

# install tools
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install whiptail

# install php extenstions: https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions
RUN apt-get -y install php7.4-fpm
RUN apt-get -y install php7.4-mysqli
RUN apt-get -y install php7.4-json

# copy config files
COPY tools/ /tools
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE	9000

ENTRYPOINT ["/tools/wordpress_start.sh"]
