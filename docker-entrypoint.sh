#!/bin/bash
set -e

# Warn if the DOCKER_HOST socket does not exist
if [[ $DOCKER_HOST == unix://* ]]; then
    socket_file=${DOCKER_HOST#unix://}
    if ! [ -S $socket_file ]; then
        echo ERROR: you need to share your Docker host socket with a volume at $socket_file
        socketMissing=1
    fi
fi

# If the user has run the default command and the socket doesn't exist, fail
if [ "$socketMissing" = 1 -a "$1" = forego -a "$2" = start -a "$3" = '-r' ]; then
    exit 1
fi

exec "$@"
