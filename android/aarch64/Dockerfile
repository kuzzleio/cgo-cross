FROM kuzzleio/sdk-cross:android-base

ENV ARCH=arm64-v8a
ENV JAVA_HOME=
RUN bash ${ANDROID_NDK_HOME}/build/tools/make-standalone-toolchain.sh --arch=arm64 --platform=android-21 --install-dir=${ANDROID_NDK_STANDALONE}

ENV PATH=${PATH}:${ANDROID_NDK_STANDALONE}/bin:${ANDROID_NDK_HOME}
ENV NDK_HOME=${ANDROID_NDK_HOME}
ENV NDK_PROJECT_PATH=/mnt/build/android/app/src/main
ENV CC="aarch64-linux-android-gcc"
ENV CXX="aarch64-linux-android-g++"
ENV LD="aarch64-linux-android-ld"
ENV AR="aarch64-linux-android-ar"
ENV STRIP="aarch64-linux-android-strip"
ENV CGO_CFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/"
ENV CGO_LDFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/"
ENV GOARCH=arm64
ENV GOOS=android

WORKDIR /mnt
