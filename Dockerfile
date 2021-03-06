FROM phusion/baseimage:0.9.11
MAINTAINER botez <troyolson1@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US en_US.UTF-8

RUN usermod -u 99 nobody && \
    usermod -g 100 nobody

RUN echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -qy --force-yes transmission-daemon

RUN /usr/sbin/enable_insecure_key
RUN mkdir -p /etc/my_init.d
COPY ./settings.json /opt/settings.json
COPY ./transmission.sh /etc/my_init.d/transmission.sh
RUN chmod +x /etc/my_init.d/transmission.sh

VOLUME ["/config"]
VOLUME ["/mnt"]

EXPOSE 9091
EXPOSE 54321

CMD ["/sbin/my_init"]

#CMD ["supervisord", "-c", "/opt/supervisor.conf", "-n"]
