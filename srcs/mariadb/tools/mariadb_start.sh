#!/bin/bash

if [ ! -d "/var/lib/mysql/inception" ]
then
    echo "creating MariaDB database"
    service mariadb start
    mariadb < /tools/createdb.sql
    sleep 2
    service mariadb stop
else
    echo "using existing database"
fi

echo "staring MariaDB service"
exec mariadbd-safe
