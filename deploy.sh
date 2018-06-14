#!/usr/bin/env bash

set -e

sdks=(java)

function deployJava() {
  cd internal/wrappers/build/java
  sh ./gradlew bintrayUpload
  cd -
}

function deployment(sdk) {
  case sdk in
    java )
      deployJava()
      ;;
  esac
}

for sdk in ${sdks[@]}; do
    echo -e "\n----------------------------------------------------------------\n"
    figlet "$sdk SDK Tests"
    echo -e "\n----------------------------------------------------------------\n"
    deployment($sdk)
done
