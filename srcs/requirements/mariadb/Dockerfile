FROM debian:bullseye

RUN apt update && apt upgrade
RUN apt -y install mariadb-server

# copy files into container
COPY conf/ /conf
COPY tools/ /tools

CMD	["tools/mariadb_setup.sh"]
