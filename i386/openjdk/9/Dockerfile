FROM kuzzleio/sdk-cross:swig-i386

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN mkdir /usr/share/man/man1 && \
    echo "deb http://http.debian.net/debian stretch-backports main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y -t stretch-backports openjdk-9-jdk-headless && apt-get clean && \
    wget https://services.gradle.org/distributions/gradle-4.5.1-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-4.5.1-bin.zip && \
    rm gradle-4.5.1-bin.zip

ENV KUZZLE_HOST=kuzzle
ENV PATH=$PATH:/opt/gradle/gradle-4.5.1/bin
ENV JAVA_HOME=/usr/lib/jvm/java-9-openjdk-i386

WORKDIR /mnt
