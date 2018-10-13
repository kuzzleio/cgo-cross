FROM kuzzleio/sdk-cross:gcc-aarch64

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

ENV NODE_VERSION 8.11.3

RUN dpkg --add-architecture arm64 && apt-get update \
    && apt-get install -y curl python \
    && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 --no-same-owner \
    && rm "node-v$NODE_VERSION-linux-x64.tar.gz" \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs

ENV CC=aarch64-linux-gnu-gcc
ENV CXX=aarch64-linux-gnu-g++
ENV LINK=aarch64-linux-gnu-g++
ENV AR=aarch64-linux-gnu-ar
ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
