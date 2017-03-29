FROM andyshinn/dnsmasq:2.76

MAINTAINER Thomas Wiringa <thomas.wiringa@gmail.com>

RUN apk add --no-cache --virtual .run-deps \
    ca-certificates bash wget \
 && update-ca-certificates

# Install Docker Gen
ENV DOCKER_GEN_VERSION 0.7.3

RUN wget --quiet https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /bin -xvzf docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

# Install Forego
RUN wget --quiet https://github.com/jwilder/forego/releases/download/v0.16.1/forego -O /bin/forego
RUN chmod u+x /bin/forego

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod u+rwx /docker-entrypoint.sh
COPY Procfile /Procfile
COPY hosts.tmpl /hosts.tmpl

ENV DOCKER_HOST unix:///tmp/docker.sock

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["forego", "start", "-r"]
