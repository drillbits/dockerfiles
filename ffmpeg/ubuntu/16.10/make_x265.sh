#!/bin/bash

SRC=${SRC:-/usr/local}
X265_VERSION=${X265_VERSION:-2.0}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL https://download.videolan.org/pub/videolan/x265/x265_${X265_VERSION}.tar.gz|tar -zx
cd x265_${X265_VERSION}/build/linux
./multilib.sh
make -C 8bit install

cd ${PWD} && rm -rf ${DIR}

