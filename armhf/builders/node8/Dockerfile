FROM kuzzleio/sdk-cross:gcc-armhf

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

ENV NODE_VERSION 8.11.3

RUN dpkg --add-architecture armhf && apt-get update \
    && apt-get install -y curl python \
    && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 --no-same-owner \
    && rm "node-v$NODE_VERSION-linux-x64.tar.gz" \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs

ENV CC=arm-linux-gnueabihf-gcc
ENV CXX=arm-linux-gnueabihf-g++
ENV LINK=arm-linux-gnueabihf-g++
ENV AR=arm-linux-gnueabihf-ar
ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
