FROM arm32v7/debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

COPY bin/ /usr/bin/

RUN [ "cross-build-start" ]

RUN apt-get update && \
    apt-get install -y make cucumber libboost-test-dev \
    libboost-thread-dev libboost-system-dev libboost-regex-dev \
    libboost-date-time-dev libboost-program-options-dev libboost-filesystem-dev && \
    apt-get clean

RUN [ "cross-build-end" ]

ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
