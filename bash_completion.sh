#!/bin/bash

TARGET_DIR=/etc/bash_completion.d
TARGET_DIR=~/.bash_completion

mkdir -vp $TARGET_DIR

# curl -L https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/bash/docker-compose -o $TARGET_DIR/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose -o $TARGET_DIR/docker-compose

#curl -L https://raw.githubusercontent.com/docker/machine/v0.14.0/contrib/completion/bash/docker-machine.bash -o $TARGET_DIR/docker-machine
#curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -o $TARGET_DIR/docker-machine
curl -L https://github.com/docker/machine/raw/master/contrib/completion/bash/docker-machine.bash -o $TARGET_DIR/docker-machine

# https://github.com/docker/cli/blob/master/contrib/completion/bash/docker
# https://github.com/docker/cli/raw/master/contrib/completion/bash/docker
# https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker

curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker -o $TARGET_DIR/docker
