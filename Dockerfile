FROM frolvlad/alpine-glibc

ENV DOCKER_COMPOSE_VERSION=1.18.0-rc2

ENV URL=https://github.com/docker/compose/releases/download/

ENV TZ=Asia/Shanghai

ARG enc_k

ARG enc_iv

COPY .ssh /root/.ssh

RUN apk add --no-cache --virtual .build-deps \
               curl \
               openssl \
               git \
               openssh-client \
               tzdata \
      && openssl enc -aes-128-cbc -d -a -in ~/.ssh/khs1994-robot.enc -out ~/.ssh/id_rsa \
          -K ${enc_k} \
          -iv ${enc_iv} \
      && chmod 600 ~/.ssh/id_rsa \
      && git config --global user.name "khs1994-merge-robot" \
      && git config --global user.email "ai@khs1994.com" \
      && git clone git@github.com:khs1994-docker/compose-cn-mirror.git /docker-compose \
      && cd /docker-compose \
      && curl -L ${URL}${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 > docker-compose-Linux-x86_64 \
      && curl -L ${URL}${DOCKER_COMPOSE_VERSION}/docker-compose-Darwin-x86_64 > docker-compose-Darwin-x86_64 \
      && curl -L ${URL}${DOCKER_COMPOSE_VERSION}/docker-compose-Windows-x86_64.exe > docker-compose-Windows-x86_64.exe \
      && chmod +x docker-compose-* \
      && ./docker-compose-`uname -s`-`uname -m` --version > version.txt \
      && date > build_date.txt \
      && git status \
      && git add . \
      && COMMIT=`cat version.txt` \
      && git commit -m "${COMMIT}" \
      && git remote add aliyun git@code.aliyun.com:khs1994-docker/compose-cn-mirror.git \
      && git push -f aliyun master:dev \
      && apk del .build-deps \
      && rm -rf ~/.ssh .git* .ssh *.sh Dockerfile
