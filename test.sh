#!/bin/bash

docker container rm -f docker-compose-cn-mirror \
  ; docker run -it -d \
  --name=docker-compose-cn-mirror \
  ccr.ccs.tencentyun.com/khs1994/docker-compose-cn-mirror \
  sh \
  && docker cp docker-compose-cn-mirror:/docker-compose . \
  && cp -a docker-compose/* . \
  && rm -rf docker-compose \
  && chmod +x docker-compose-* \
  && ./docker-compose-`uname -s`-`uname -m` --version > version.txt
