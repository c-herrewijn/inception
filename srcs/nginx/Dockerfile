FROM debian:bullseye

# RUN commands runs while building the image, not while running the container!
# install the webserver
RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install openssl

# copy nginx config file into container
COPY conf/nginx.conf /etc/nginx/sites-available/default

# create TLS certificates
RUN	mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -nodes -sha256 -days 365 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/CN=cherrewi.42.fr/"

# folder where wordpress can be mounted
RUN	mkdir -p /var/www/html/inception

# standard port for https
EXPOSE 443

# CMD command to execute in the container (can be only 1)
CMD [ "nginx", "-g", "daemon off;" ]
