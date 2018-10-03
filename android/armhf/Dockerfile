FROM kuzzleio/sdk-cross:android-base

ENV ARCH=armeabi-v7a
ENV JAVA_HOME=
RUN ${ANDROID_NDK_HOME}/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --install-dir=${ANDROID_NDK_STANDALONE}

ENV PATH=${PATH}:${ANDROID_NDK_STANDALONE}/bin:${ANDROID_NDK_HOME}
ENV NDK_HOME=${ANDROID_NDK_HOME}
ENV NDK_PROJECT_PATH=/mnt/build/android/app/src/main
ENV CC="arm-linux-androideabi-gcc"
ENV CXX="arm-linux-androideabi-g++"
ENV LD="arm-linux-androideabi-ld"
ENV AR="arm-linux-androideabi-ar"
ENV STRIP="arm-linux-androideabi-strip"
ENV CGO_CFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/"
ENV CGO_LDFLAGS="--sysroot=${ANDROID_NDK_STANDALONE}/sysroot/"
ENV GOARCH=arm
ENV GOARM=7
ENV GOOS=android

WORKDIR /mnt
