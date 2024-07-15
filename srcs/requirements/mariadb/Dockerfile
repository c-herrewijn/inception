FROM debian:bullseye

RUN apt-get update
RUN apt-get -y install mariadb-server

COPY conf/mariadb.cnf /etc/mysql/conf.d/mariadb.cnf
COPY tools/ /tools
RUN chmod +x /tools/mariadb_start.sh

# create data directory
RUN mkdir -p /usr/local/mysql/var

# open default port for MariaDB service
EXPOSE 3306

ENTRYPOINT ["/tools/mariadb_start.sh"]
