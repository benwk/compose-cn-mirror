# Docker Compose 可执行文件

[![GitHub (pre-)release](https://img.shields.io/github/release/khs1994-docker/compose-cn-mirror/all.svg)](https://github.com/khs1994-docker/compose-cn-mirror/releases)

## Download

### By Docker

```bash
$ docker run -dit \
     --name=docker-compose-cn-mirror \
     ccr.ccs.tencentyun.com/khs1994/docker-compose-cn-mirror \
     sh

$ docker cp docker-compose-cn-mirror:/docker-compose .

$ cp -a docker-compose/docker-compose-`uname -s`-`uname -m` .
```

### By Curl

```bash
$ DOCKER_COMPOSE_VERSION=1.17.0

$ curl -L https://code.aliyun.com/khs1994-docker/compose-cn-mirror/raw/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose-`uname -s`-`uname -m`
```

## Move

```bash
$ chmod +x docker-compose-`uname -s`-`uname -m`

$ ./docker-compose-`uname -s`-`uname -m` --version

$ sudo mv docker-compose-`uname -s`-`uname -m` /usr/local/bin
```
