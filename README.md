# SDK Containers

_Custom cross compilation/testing containers using docker images._

## Compatibility

## Linux

| arch\package  |           GCC/G++          |          Clang/Clang++       |             Golang           |          OpenJDK 8           |           OpenJDK 9          |        Oracle JDK 8          |
|:-------------:|:--------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|
|     amd64     |     :heavy_check_mark:     |        :heavy_check_mark:    |       :heavy_check_mark:     |      :heavy_check_mark:      |       :heavy_check_mark:     |     :heavy_check_mark:       |
|     i386      |     :heavy_check_mark:     |        :heavy_check_mark:    |       :heavy_check_mark:     |      :heavy_check_mark:      |       :heavy_check_mark:     |     :heavy_check_mark:       |
|     armv7     |     :heavy_check_mark:     |        :heavy_check_mark:    |       :heavy_check_mark:     |      :heavy_check_mark:      |       :heavy_check_mark:     |     :heavy_check_mark:       |
|     armv8     |     :heavy_check_mark:     |        :heavy_check_mark:    |       :heavy_check_mark:     |      :heavy_check_mark:      |       :heavy_check_mark:     |     :heavy_check_mark:       |

## Android

| arch\package  |         Android NDK          |
|:-------------:|:----------------------------:|
|     amd64     |    :heavy_multiplication_x:  |
|     i386      |        :heavy_check_mark:    |


## Images

| arch\package  |           GCC/G++          |          Clang/Clang++       |             Golang           |          OpenJDK 8           |           OpenJDK 9          |        Oracle JDK 8          |
|:-------------:|:--------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|
|     amd64     |            gcc             |             clang            |             golang           |          openjdk8            |           openjdk9           |          oracle8             |
|     i386      |            gcc-i386        |             clang-i386       |             golang-i386      |          openjdk8-i386       |           openjdk9-i386      |          oracle8-i386        |
|     armv7     |            gcc             |             clang-armv7      |             golang-armv7     |          openjdk8-armv7      |           openjdk9-armv7     |          oracle8-armv7       |
|     armv8     |            gcc             |             clang-armv8      |             golang-armv8     |          openjdk8-armv8      |           openjdk9-armv8     |          oracle8-armv8       |
|  android-x86  |  :heavy_multiplication_x:  |   :heavy_multiplication_x:   |    :heavy_multiplication_x:  |   :heavy_multiplication_x:   |   :heavy_multiplication_x:   |    :heavy_multiplication_x:  |


## ARM

ARMv* images need to be build and use on an ARM host.

## [LICENSE](https://github.com/kuzzleio/cgo-cross/blob/master/LICENSE)


> Docker images are available on [DockerHub](https://hub.docker.com/r/kuzzlio/sdk-cross).
