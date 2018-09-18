FROM arm32v7/debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN [ "/usr/bin/qemu-arm-static", "/usr/bin/apt-get", "update" ]
RUN [ "/usr/bin/qemu-arm-static", "/usr/bin/apt-get", "install", "-y", "cucumber", "libboost-test-dev", "libboost-thread-dev", "libboost-system-dev", "libboost-regex-dev", "libboost-date-time-dev", "libboost-program-options-dev", "libboost-filesystem-dev"]
RUN [ "/usr/bin/qemu-arm-static", "/usr/bin/apt-get", "clean" ]

ENV KUZZLE_HOST=kuzzle

WORKDIR /mnt
