#!/bin/bash

if [ ! -d "/var/lib/mysql/inception" ]
then
    echo "creating MariaDB database"

    echo \
    "-- create database
    CREATE DATABASE IF NOT EXISTS inception;
    USE inception;

    -- create database user
    CREATE USER '$DB_USER' @'%' IDENTIFIED BY '$DB_PASSWORD';
    GRANT ALL PRIVILEGES ON inception.* TO '$DB_USER' @'%';
    FLUSH PRIVILEGES;" > /tmp/createdb.sql

    service mariadb start
    mariadb < /tmp/createdb.sql
    sleep 2
    service mariadb stop

    # rm /tmp/createdb.sql
else
    echo "using existing database"
fi

echo "staring MariaDB service"
exec mariadbd-safe
