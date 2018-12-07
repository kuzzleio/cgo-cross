FROM kuzzleio/sdk-cross:gcc

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN apt-get update && apt-get install -y swig libffi-dev && \
    apt-get remove -y valgrind && apt-get purge -y valgrind && apt-get clean

WORKDIR /mnt
