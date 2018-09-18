FROM kuzzleio/sdk-cross:swig

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

RUN mkdir /usr/share/man/man1 && \
    apt-get update && apt-get install -y software-properties-common dirmngr && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update && \
    apt-get install -y oracle-java8-installer && \
    apt-get install -y oracle-java8-set-default && \
    wget https://services.gradle.org/distributions/gradle-4.5.1-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-4.5.1-bin.zip && \
    rm gradle-4.5.1-bin.zip && \
    apt-get purge -y software-properties-common dirmngr && \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer

ENV KUZZLE_HOST=kuzzle
ENV PATH=$PATH:/opt/gradle/gradle-4.5.1/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

WORKDIR /mnt
