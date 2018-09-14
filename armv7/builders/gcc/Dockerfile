FROM sdk-cross:golang-armv7

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN dpkg --add-architecture armhf && apt-get update && \
    apt-get install -y git gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf cmake libboost-test-dev:armhf \
        libboost-thread-dev:armhf libboost-system-dev:armhf libboost-regex-dev:armhf \
        libboost-date-time-dev:armhf libboost-program-options-dev:armhf libboost-filesystem-dev:armhf && \
    apt-get clean

ENV CC=arm-linux-gnueabihf-gcc
ENV CXX=arm-linux-gnueabihf-g++
ENV AR=arm-linux-gnueabihf-ar
ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
