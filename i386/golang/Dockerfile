FROM i386/debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN apt-get update && apt-get install -y git gcc wget && apt-get clean && \
    wget -O go.tgz "https://golang.org/dl/go1.11.linux-386.tar.gz" && \
    tar -C /usr/local -xzf go.tgz && \
    mkdir /root/go && \
    rm go.tgz

ENV GOLANG_VERSION=1.11
ENV GOPATH=/root/go
ENV GOROOT=/usr/local/go
ENV PATH=/usr/local/go/bin:$PATH
ENV GOARCH=386
ENV GOOS=linux
ENV CGO_ENABLED=1

WORKDIR /mnt
