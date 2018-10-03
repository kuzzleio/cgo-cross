FROM kuzzleio/sdk-cross:oracle8

ENV ANDROID_NDK_HOME=/opt/android-ndk
ENV ANDROID_NDK_VERSION=r14b
ENV ANDROID_NDK_STANDALONE=/opt/ndk
ENV ANDROID_HOME=/opt/android-sdk

# Android Toolchain
RUN mkdir /opt/android-ndk-tmp && \
    cd /opt/android-ndk-tmp && \
    wget -q https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
    unzip android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
    mv ./android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME} && \
    cd ${ANDROID_NDK_HOME} && \
    rm -rf /opt/android-ndk-tmp && \
    # Python dependency
    apt-get update && apt-get install -y python && apt-get clean && \
    # Android SDK
    mkdir $ANDROID_HOME && \
    cd $ANDROID_HOME && \
    wget -O sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip sdk.zip && \
    rm sdk.zip && \
    yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

WORKDIR /mnt
