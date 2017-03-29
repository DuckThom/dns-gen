# dns-gen
=========

## Usage

```
docker run -d \
    -p 53:53/tcp -p 53:53/udp \
    --cap-add=NET_ADMIN \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    --name=dnsmasq \
    lunamoonfang/dns-gen
```

## Environment

`FORCE_IP`: Force the ips of the generated hosts to be this value instead of `127.0.0.1`
