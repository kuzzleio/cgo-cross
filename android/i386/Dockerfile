FROM kuzzleio/sdk-cross:android-base

ENV ARCH=x86
RUN ${ANDROID_NDK_HOME}/build/tools/make-standalone-toolchain.sh --arch=$ARCH --platform=android-21 --install-dir=${ANDROID_NDK_STANDALONE}

ENV PATH=${PATH}:${ANDROID_NDK_STANDALONE}/bin:${ANDROID_NDK_HOME}
ENV NDK_HOME=${ANDROID_NDK_HOME}
ENV NDK_PROJECT_PATH=/mnt/build/android/app/src/main
ENV CC="i686-linux-android-gcc"
ENV CXX="i686-linux-android-g++"
ENV LD="i686-linux-android-ld"
ENV CGO_CFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/"
ENV CGO_LDFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/"
ENV GOARCH=386
ENV GOOS=android

WORKDIR /mnt
