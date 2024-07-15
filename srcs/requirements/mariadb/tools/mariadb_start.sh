#!/bin/bash
echo "running MariaDB startup script!"

if [ ! -d "/var/lib/mysql/inception" ]; then
    service mariadb start
    mariadb < /tools/createdb.sql
    sleep 2
    service mariadb stop
fi

exec mariadbd-safe
