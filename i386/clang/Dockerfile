FROM kuzzleio/sdk-cross:golang-i386

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN apt-get update && apt-get install -y clang make libboost-test-dev \
    libboost-thread-dev libboost-system-dev libboost-regex-dev \
    libboost-date-time-dev libboost-program-options-dev libboost-filesystem-dev cucumber cmake \
    valgrind && \
    apt-get clean

ENV CC=clang
ENV CXX=clang++
ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
