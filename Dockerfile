FROM ubuntu:16.04
MAINTAINER Vasily Kolesnikov re.vkolesnikov@gmail.com

# install exercise-cli
WORKDIR /usr/local/bin
RUN wget -qO- https://github.com/exercism/cli/releases/download/v2.3.0/exercism-linux-64bit.tgz | tar -zx
RUN chmod +x exercism

# configure exercise-cli
RUN mkdir /root/exercism
WORKDIR /root/exercism
RUN exercism configure --dir="/root/exercism/lib/exercism"

USER root
CMD bash
