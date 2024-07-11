#!/bin/bash


echo "mariaDB setup script!";

# service mariadb start;  ## start + stop not the best route, do mysql_install_db instead
# see: https://mariadb.com/kb/en/mysql_install_db/


## TODO: create initial tables

# service mariadb stop;

# only do this if DB does not yet exist!
mariadb-install-db

# start the DB service, see: https://man7.org/linux/man-pages/man1/mysqld_safe.1.html
mariadbd-safe;

# only do this if DB does not yet exist!

# Not sure if needed!? -> run before the service is running
#    mariadb-install-db

# only do this if DB does not yet exist! --> note somehow not created!!
mariadb < /tools/createdb.sql

#mariadb -p myPassword




# follwing steps from: https://mariadb.com/kb/en/a-mariadb-primer/


# log in to datab
# CREATE DATABASE IF NOT EXISTS test;
