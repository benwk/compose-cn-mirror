# Docker Compose 可执行文件

**官方版本：**

[![GitHub (pre-)release](https://img.shields.io/github/release/docker/compose/all.svg)](https://github.com/docker/compose/releases)

**镜像版本：**

[![GitHub (pre-)release](https://img.shields.io/github/release/khs1994-docker/compose-cn-mirror/all.svg)](https://github.com/khs1994-docker/compose-cn-mirror/releases)

## Download

### By Docker

```bash
$ docker create \
     --name=docker-compose-cn-mirror \
     ccr.ccs.tencentyun.com/khs1994/docker-compose-cn-mirror \
     sh

$ docker cp docker-compose-cn-mirror:/docker-compose .

$ cp -a docker-compose/docker-compose-`uname -s`-`uname -m` .
```

### By Curl

```bash
$ DOCKER_COMPOSE_VERSION=1.17.1

$ curl -L https://code.aliyun.com/khs1994-docker/compose-cn-mirror/raw/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose-`uname -s`-`uname -m`
```

## Move

```bash
$ chmod +x docker-compose-`uname -s`-`uname -m`

$ ./docker-compose-`uname -s`-`uname -m` --version

$ sudo mv docker-compose-`uname -s`-`uname -m` /usr/local/bin
```
