FROM amd64/debian:stretch-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
      wget \
      unzip \
      ca-certificates \
      figlet \
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
      curl \
      dirmngr \
      cmake \
      libblkid-dev \
      e2fslibs-dev \
      libboost-all-dev \
      libaudit-dev \
      libc6-dev-i386 \
      cucumber \
      file

RUN mkdir -p /usr/share/man/man1 && \
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

# NDK
ENV ANDROID_NDK_HOME=/opt/android-ndk \
    ANDROID_NDK_VERSION=r14b \
    ANDROID_NDK_STANDALONE=/opt/ndk \
    ARCH=x86

RUN mkdir /opt/android-ndk-tmp && \
    cd /opt/android-ndk-tmp && \
    wget -q https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
    unzip android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
    mv ./android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME} && \
    cd ${ANDROID_NDK_HOME} && \
    rm -rf /opt/android-ndk-tmp && \
    ${ANDROID_NDK_HOME}/build/tools/make-standalone-toolchain.sh --arch=$ARCH --platform=android-21 --install-dir=${ANDROID_NDK_STANDALONE}

ENV PATH=${PATH}:${ANDROID_NDK_STANDALONE}/bin:${ANDROID_NDK_HOME} \
    NDK_HOME=${ANDROID_NDK_HOME} \
    NDK_PROJECT_PATH=/go/src/github.com/kuzzleio/sdk-go/internal/wrappers/build/android/app/src/main \
    CC="i686-linux-android-gcc" \
    CXX="i686-linux-android-g++" \
    LD="i686-linux-android-ld" \
    CGO_CFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/" \
    CGO_LDFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/" \
    GOLANG_VERSION=1.10.3

# GO
RUN url="https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" && \
    wget -O go.tgz "$url" && \
    goRelSha256='fa1b0e45d3b647c252f51f5e1204aba049cde4af177ef9f2181f43004f901035' && \
    echo "${goRelSha256} *go.tgz" | sha256sum -c - && \
    tar -C /usr/local -xzf go.tgz && \
    rm go.tgz && \
    export PATH="/usr/local/go/bin:$PATH" && \
    go version

ENV GOPATH=/go \
    PATH=$GOPATH/bin:/usr/local/go/bin:/usr/local/bin:$PATH \
    CGO_ENABLED=1 \
    GOARCH=386 \
    GOOS=android \
    JAVA_HOME=/usr/lib/jvm/java-8-oracle

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" "$GOPATH/src/github.com/kuzzleio/sdk-go" && \
    chmod -R 777 "$GOPATH"

# Android SDK
ENV ANDROID_HOME=/opt/android-sdk
RUN mkdir $ANDROID_HOME && \
    cd $ANDROID_HOME && \
    curl -o sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip sdk.zip && \
    rm sdk.zip && \
    yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

COPY build.sh /build.sh
COPY test.sh /test.sh

WORKDIR /go/src/github.com/kuzzleio/sdk-go
