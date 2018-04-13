FROM i386/openjdk:8u162-jdk-slim-stretch

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
      vim \
      file \
      gnupg \
      wget \
      tar \
      gradle \
      dirmngr

ENV GOLANG_VERSION 1.10.1
RUN url="https://golang.org/dl/go${GOLANG_VERSION}.linux-386.tar.gz" && \
    wget -O go.tgz "$url" && \
    goRelSha256='acbe19d56123549faf747b4f61b730008b185a0e2145d220527d2383627dfe69' && \
    echo "${goRelSha256} *go.tgz" | sha256sum -c - && \
    tar -C /usr/local -xzf go.tgz && \
    rm go.tgz && \
    export PATH="/usr/local/go/bin:$PATH" && \
    go version

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV GOARCH=386
ENV GOOS=linux
ENV CGO_ENABLED=1
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-i386

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" "$GOPATH/src/github.com/kuzzleio/sdk-go" && chmod -R 777 "$GOPATH"

COPY build.sh /build.sh

WORKDIR /go/src/github.com/kuzzleio/sdk-go
CMD ["sh", "-c", "tail -f /dev/null"]
