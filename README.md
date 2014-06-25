docker-transmission
==============

This is a Dockerfile setup for Transmission - https://www.transmissionbt.com/

Uses phusion/baseimage
https://github.com/phusion/baseimage-docker

Based of gfjardim's original docker.

To run:

docker run -d --net='host' --name=transmission -e ADMIN_PASS=password -v /path/to/config:/config -v /path/to/mnt:/mnt -v /etc/localtime:/etc/localtime:ro botez/transmission

(transmission username is "transmission")
