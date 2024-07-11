#!/bin/bash
echo "mariaDB setup script!";

# only do this if DB does not yet exist!
# e.g. folder: /var/lib/mysql/inception exists!

# needed ??
# mariadb-install-db

service mariadb start
mariadb < /tools/createdb.sql
service mariadb stop

exec mariadbd-safe
