FROM debian:bullseye


# RUN commands runs while building the image, not while running the container!
RUN echo "Hello World"

# copy files into container
COPY conf/ /conf
COPY conf/ /tools

# CMD command to execute in the container (can be only 1)
# placeholder to keep container running
CMD [ "sleep", "infinity" ]
