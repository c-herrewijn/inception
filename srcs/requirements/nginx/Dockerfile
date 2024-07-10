FROM debian:bullseye

# RUN commands runs while building the image, not while running the container!
# install the webserver
RUN apt update
RUN apt -y install nginx
RUN apt -y install openssl

# copy files into container
COPY conf/ /conf
COPY conf/ /tools

# copy config file
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# create TLS certificates
RUN	mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -nodes -sha256 -days 365 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/CN=cherrewi.42.fr/"

# debug
RUN echo "<h1>hello world</h1>" > /var/www/html/index.html

# standard port for https
EXPOSE 443

# CMD command to execute in the container (can be only 1)
CMD [ "nginx", "-g", "daemon off;" ]
