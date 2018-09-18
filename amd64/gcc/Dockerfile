FROM kuzzleio/sdk-cross:golang

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN apt-get update && apt-get install -y git gcc g++ libboost-all-dev cucumber cmake && apt-get clean

ENV CC=gcc
ENV CXX=g++
ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
