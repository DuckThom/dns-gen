#!/bin/bash

docker run -d -p 127.0.0.1:53:53/tcp -p 127.0.0.1:53:53/udp \
    --cap-add=NET_ADMIN \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    --name=dnsmasq \
    --label="traefik.enable=false" \
    lunamoonfang/dns-gen
