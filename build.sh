#!/usr/bin/env bash
set -e

# Build all languages
sdks=(android)
cd internal/wrappers

for sdk in ${sdks[@]}; do
    echo -e "\n----------------------------------------------------------------\n"
    figlet "$sdk SDK Build"
    echo -e "\n----------------------------------------------------------------\n"
    make $sdk

    if [[ $? -ne 0 ]]; then
	exit 1
    fi

done

cd -
