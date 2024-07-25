#!/bin/bash
if [ ! -f /var/www/html/inception/wp-config.php ]
then
    echo "installing wordpress"

    # download wordpress cli: https://make.wordpress.org/cli/handbook/guides/installing/
    wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
    wp cli update --yes

    # install wordpress: https://make.wordpress.org/cli/handbook/guides/quick-start/
    mkdir -p /var/www/html/inception
    cd /var/www/html/inception
    wp core download --allow-root
    wp config create --allow-root --dbname=inception --dbuser=user1 --dbpass=password1 --dbhost=mariadb
    wp core install --allow-root --url=cherrewi.42.fr --title="Inception_WP" --admin_user=wp_admin --admin_password=pass1 --admin_email=cherrewi@student.codam.nl --skip-email
    wp user create wp_user user1@student.codam.nl --allow-root --role=author --user_pass=pass2
    chown -R www-data:www-data /var/www/html
    chmod -R 666 www-data:www-data /var/www/html
else
    echo "wordpress already installed"
fi

echo "starting wordpress FastCGI Process Mananger (FPM)"
exec php-fpm7.4 -F
