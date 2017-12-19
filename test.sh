#!/bin/bash

PROJECT_NAME=docker-compose

VERSION=1.18.0

docker container rm -f ${PROJECT_NAME}-cn-mirror \
  ; docker create \
  --name=${PROJECT_NAME}-cn-mirror \
  ccr.ccs.tencentyun.com/khs1994/${PROJECT_NAME}-cn-mirror:${VERSION} \
  && docker cp ${PROJECT_NAME}-cn-mirror:/${PROJECT_NAME}.tar.gz . \
  && tar -zxvf ${PROJECT_NAME}.tar.gz \
  && cp -a ${PROJECT_NAME}/${PROJECT_NAME}-`uname -s`-`uname -m` . \
  && rm -rf ${PROJECT_NAME} ${PROJECT_NAME}.tar.gz \
  && chmod +x ${PROJECT_NAME}-`uname -s`-`uname -m` \
  && ./${PROJECT_NAME}-`uname -s`-`uname -m` version \
  && rm -rf ${PROJECT_NAME}-`uname -s`-`uname -m`
