FROM ubuntu:14.04
MAINTAINER gfjardim <gfjardim@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US en_US.UTF-8

RUN usermod -u 99 nobody && \
    usermod -g 100 nobody

RUN echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -qy --force-yes transmission-daemon supervisor

ADD files/ /opt/
RUN chmod +x /opt/transmission.sh

VOLUME ["/config"]
VOLUME ["/downloads"]

EXPOSE 9091
EXPOSE 54321

CMD ["supervisord", "-c", "/opt/supervisor.conf", "-n"]
