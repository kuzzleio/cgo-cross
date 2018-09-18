FROM sdk-cross:golang-aarch64

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN dpkg --add-architecture arm64 && apt-get update && \
    apt-get install -y git gcc-aarch64-linux-gnu g++-aarch64-linux-gnu cmake libboost-test-dev:arm64 \
        libboost-thread-dev:arm64 libboost-system-dev:arm64 libboost-regex-dev:arm64 \
        libboost-date-time-dev:arm64 libboost-program-options-dev:arm64 libboost-filesystem-dev:arm64 && \
    apt-get clean

ENV CC=aarch64-linux-gnu-gcc
ENV CXX=aarch64-linux-gnu-g++
ENV AR=aarch64-linux-gnu-ar
ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
