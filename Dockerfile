FROM debian:9.5-slim
LABEL maintainer "mecab <mecab@misosi.ru>"

RUN apt-get update && \
    apt-get install -y python cmake curl gnupg unzip && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    cd /tmp && \
    curl -L -o emsdk.zip https://github.com/juj/emsdk/archive/18b21ddad60df55d91b1a919d7fc04fa1cfd6148.zip && \
    unzip emsdk.zip && \
    mkdir /emsdk && \
    cp -r emsdk-*/* /emsdk && \
    cd /emsdk && \
    ./emsdk update && \
    ./emsdk install latest && \
    curl -L -o binaryen.tar.gz https://github.com/WebAssembly/binaryen/releases/download/version_49/binaryen-version_49-x86_64-linux.tar.gz && \
    tar -zxvf binaryen.tar.gz -C /bin --strip=1

ADD ./entrypoint /entrypoint

ENTRYPOINT /entrypoint
VOLUME /built
