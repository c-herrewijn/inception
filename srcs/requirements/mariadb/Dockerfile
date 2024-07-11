FROM debian:bullseye

RUN apt-get update
RUN apt-get -y install mariadb-server

# copy files into container
COPY conf/ /conf
COPY tools/ /tools

# copy config file
COPY conf/mariadb.cnf /etc/mysql/conf.d/mariadb.cnf



# password ??? (not needed??)
#password=my_password

# create data directory
RUN mkdir -p /usr/local/mysql/var

# create directory for error logs
# RUN mkdir -p /usr/local/share/mysql/english

CMD	["tools/mariadb_setup.sh"]

# open default port for MariaDB service
EXPOSE 3306
