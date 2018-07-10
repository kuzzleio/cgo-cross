FROM i386/debian:stretch-slim

RUN apt-get update && apt-get install -y --no-install-recommends wget unzip gnupg ca-certificates

# NDK
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV ANDROID_NDK_VERSION r17b

RUN mkdir /opt/android-ndk-tmp
RUN cd /opt/android-ndk-tmp
RUN wget https://dl.google.com/android/repository/android-ndk-"${ANDROID_NDK_VERSION}"-linux-x86_64.zip
RUN unzip android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip
RUN mv ./android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME}
RUN cd ${ANDROID_NDK_HOME}
RUN rm -rf /opt/android-ndk-tmp

ENV PATH ${PATH}:${ANDROID_NDK_HOME}

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

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" "$GOPATH/src/github.com/kuzzleio/sdk-go" && \
    chmod -R 777 "$GOPATH"

COPY build.sh /build.sh
COPY test.sh /test.sh

WORKDIR /go/src/github.com/kuzzleio/sdk-go
