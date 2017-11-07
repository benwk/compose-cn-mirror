#!/bin/bash

DOCKER_COMPOSE_VERSION=1.17.0

case $1 in
  move )
    sudo mv docker-compose-`uname -s`-`uname -m` /usr/local/bin/docker-compose
  ;;
  version )
    ./docker-compose-`uname -s`-`uname -m` --version
  ;;
  update )
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Darwin-x86_64 \
        > docker-compose-Darwin-x86_64
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 \
        > docker-compose-Linux-x86_64
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Windows-x86_64 \
        > docker-compose-Windows-x86_64
    ls -la
    git checkout exec
    chmod +x *
    git remote rm origin
    git remote add origin git@github.com:khs1994-docker/compose-cn-mirror.git
    git remote add aliyun git@code.aliyun.com:khs1994-docker/compose-cn-mirror.git
    git add .
    git status
    git branch
    COMMIT=`./docker-compose-\`uname -s\`-\`uname -m\` --version`
    git commit -m "${COMMIT}"
    git push -f origin exec
    git push -f aliyun exec
  ;;
esac
