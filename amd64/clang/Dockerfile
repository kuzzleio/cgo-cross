FROM kuzzleio/sdk-cross:golang

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN apt-get update && apt-get install -y git clang libboost-all-dev cucumber cmake && apt-get clean

ENV CC=clang
ENV CXX=clang++
ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
