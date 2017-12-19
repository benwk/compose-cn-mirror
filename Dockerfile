FROM frolvlad/alpine-glibc

ENV PROJECT_NAME=docker-compose

ENV DOCKER_COMPOSE_VERSION=1.18.0

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
      # 以上为配置 git
      && git clone git@github.com:khs1994-docker/compose-cn-mirror.git /${PROJECT_NAME} \
      # 切换到项目目录
      && cd /${PROJECT_NAME} \
      && curl -LO ${URL}${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 \
      && curl -LO ${URL}${DOCKER_COMPOSE_VERSION}/docker-compose-Darwin-x86_64 \
      && curl -LO ${URL}${DOCKER_COMPOSE_VERSION}/docker-compose-Windows-x86_64.exe \
      && chmod +x docker-compose-* \
      && ./docker-compose-`uname -s`-`uname -m` --version > version.txt \
      && date > build_date.txt \
      && git status \
      && git add . \
      && COMMIT=`cat version.txt` \
      && git commit -m "${COMMIT}" \
      && git remote add aliyun git@code.aliyun.com:khs1994-docker/compose-cn-mirror.git \
      && git push -f aliyun master \
      # 删除敏感数据、依赖
      && apk del .build-deps \
      && rm -rf ~/.ssh .git* .ssh *.sh Dockerfile \
      # 打包文件
      && cd / \
      && tar -zcvf ${PROJECT_NAME}.tar.gz /${PROJECT_NAME} \
      && rm -rf /${PROJECT_NAME}

# FROM scratch
#
# COPY --from=0 /docker-compose.tar.gz /docker-compose.tar.gz
