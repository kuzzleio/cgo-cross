# SDK Containers

_Custom cross compilation/testing containers using docker images._

## Linux

### amd64 & i386

| arch\package  |           GCC/G++          |          Clang/Clang++       |             Golang           |          OpenJDK 8           |           OpenJDK 9          |        Oracle JDK 8          |
|:-------------:|:--------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|
|     amd64     |            `gcc`           |             `clang`          |             `golang`         |           `openjdk8`         |            `openjdk9`        |          `oracle8`           |
|     i386      |           `gcc-i386`       |            `clang-i386`      |           `golang-i386`      |         `openjdk8-i386`      |          `openjdk9-i386`     |        `oracle8-i386`        |


### ARM

Due to QEMU multi-threading non-compatibility, we need to split building
and running steps

#### Builders

Available builders:

* Golang: _Golang with compilation environment variables set according to
    targeted arch._
* C++: _GCC/G++ multilib, CMake, Libboost._
* Java: _OpenJDK 8._

| arch\package  |          Golang       |           C++          |                Java            |
|:-------------:|:---------------------:|:----------------------:|:------------------------------:|
|     armhf     |  `golang-armhf`       |            `gcc-armhf` |                   `-`          |
|     aarch64   |  `golang-aarch64`     |            `gcc-armhf` |                   `-`          |

#### Runners

Available runners:

* C++: _Cucumber, Libboost, Valgrind._

| arch\package  |           C++          |
|:-------------:|:----------------------:|
|     armhf     |   `armhf-cpp-runner`   |
|     aarch64   |   `aarch64-cpp-runner` |


## Android

| arch\package  |         Android NDK          |
|:-------------:|:----------------------------:|
|     amd64     |               -              |
|     i386      |         `android-i386`       |


## [LICENSE](https://github.com/kuzzleio/cgo-cross/blob/master/LICENSE)

> Docker images are available on [DockerHub](https://hub.docker.com/r/kuzzlio/sdk-cross).

