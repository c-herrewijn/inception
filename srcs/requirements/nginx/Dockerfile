FROM debian:bullseye

# RUN commands runs while building the image, not while running the container!
# install the webserver
RUN apt update
RUN apt -y install nginx

# copy files into container
COPY conf/ /conf
COPY conf/ /tools

# debug
RUN echo "<h1>hello world!</h1>" > /var/www/html/index.html

# copy config file
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE	8000

# CMD command to execute in the container (can be only 1)
CMD [ "nginx", "-g", "daemon off;" ]
