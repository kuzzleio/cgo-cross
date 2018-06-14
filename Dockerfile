FROM i386/debian:stretch-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
      g++ \
      gcc \
      libc6-dev \
      make \
      pkg-config \
      build-essential \
      swig \
      libffi-dev \
      git \
      gnupg \
      figlet \
      curl \
      dirmngr \
      cmake \
      libblkid-dev \
      e2fslibs-dev \
      libboost-all-dev \
      libaudit-dev \
      cucumber && \
    mkdir -p /usr/share/man/man1 && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update && \
    apt-get install -y oracle-java8-installer && \
    apt-get install -y oracle-java8-set-default && \
    apt-get install -y gradle && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer


ENV GOLANG_VERSION 1.10.3
RUN url="https://golang.org/dl/go${GOLANG_VERSION}.linux-386.tar.gz" && \
    wget -O go.tgz "$url" && \
    goRelSha256='3d5fe1932c904a01acb13dae07a5835bffafef38bef9e5a05450c52948ebdeb4' && \
    echo "${goRelSha256} *go.tgz" | sha256sum -c - && \
    tar -C /usr/local -xzf go.tgz && \
    rm go.tgz && \
    export PATH="/usr/local/go/bin:$PATH" && \
    go version

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:/usr/local/bin:$PATH
ENV GOARCH=386
ENV GOOS=linux
ENV CGO_ENABLED=1
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" "$GOPATH/src/github.com/kuzzleio/sdk-go" && \
    chmod -R 777 "$GOPATH"

COPY build.sh /build.sh
COPY test.sh /test.sh

WORKDIR /go/src/github.com/kuzzleio/sdk-go
