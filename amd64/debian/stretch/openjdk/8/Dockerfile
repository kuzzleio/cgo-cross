FROM kuzzleio/sdk-cross:swig

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN mkdir /usr/share/man/man1 && apt-get update && apt-get install -y openjdk-8-jdk-headless && apt-get clean && \
    wget https://services.gradle.org/distributions/gradle-4.5.1-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-4.5.1-bin.zip && \
    rm gradle-4.5.1-bin.zip

ENV KUZZLE_HOST=kuzzle
ENV PATH=$PATH:/opt/gradle/gradle-4.5.1/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

WORKDIR /mnt
