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
    wp config create --allow-root --dbname=inception --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb
    wp core install --allow-root --url=cherrewi.42.fr --title="Inception_WP" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email
    wp user create $WP_USER_NAME $WP_USER_EMAIL --allow-root --role=author --user_pass=$WP_USER_PASSWORD
    chown -R www-data:www-data /var/www/html
else
    echo "wordpress already installed"
fi

echo "starting wordpress FastCGI Process Mananger (FPM)"
exec php-fpm8.2 -F
