#!/bin/bash

SRC=${SRC:-/usr/local}
OPUS_VERSION=${OPUS_VERSION:-1.1.1}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL http://downloads.xiph.org/releases/opus/opus-${OPUS_VERSION}.tar.gz|tar -zx --strip-components=1
autoreconf -fiv
./configure --prefix="${SRC}" --disable-static --datadir="${DIR}"
make
make install

cd ${PWD} && rm -rf ${DIR}

