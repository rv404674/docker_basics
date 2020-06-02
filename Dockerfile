# getting base image
FROM ubuntu

# note you can also use - FROM scratch
# an empty images, used for building images from scratch

MAINTAINER "Rahul Verma" <rv404674@gmail.com>

RUN apt-get update

CMD ["echo", "Hello World! from my first docker images"]

# Run gets executed during building of the image.
# However CMD gets executed only when you create a container out of the image

