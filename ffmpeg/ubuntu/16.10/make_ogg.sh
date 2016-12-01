#!/bin/bash

SRC=${SRC:-/usr/local}
OGG_VERSION=${OGG_VERSION:-1.3.2}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL http://downloads.xiph.org/releases/ogg/libogg-${OGG_VERSION}.tar.gz|tar -zx --strip-components=1
./configure --prefix="${SRC}" --bindir="${SRC}/bin" --disable-static --datarootdir=${DIR}
make
make install

cd ${PWD} && rm -rf ${DIR}

