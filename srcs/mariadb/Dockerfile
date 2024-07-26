FROM debian:bullseye

RUN apt-get update
RUN apt-get -y install mariadb-server

# COPY conf/mariadb.cnf /etc/mysql/conf.d/mariadb.cnf
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/ /tools
RUN chmod +x /tools/mariadb_start.sh

# open default port for MariaDB service
EXPOSE 3306

# HEALTHCHECK CMD mysqladmin ping -h localhost -u user1 -p$MYSQL_ROOT_PASSWORD || exit 1
HEALTHCHECK --interval=2s CMD mysqladmin ping -h localhost -u user1 -ppassword1 || exit 1

ENTRYPOINT ["/tools/mariadb_start.sh"]
