#!/bin/bash

SRC=${SRC:-/usr/local}
LAME_VERSION=${LAME_VERSION:-3.99.5}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL https://downloads.sf.net/project/lame/lame/${LAME_VERSION%.*}/lame-${LAME_VERSION}.tar.gz|tar -zx --strip-components=1
./configure --prefix="${SRC}" --bindir="${SRC}/bin" --disable-static --enable-nasm --datarootdir="${DIR}"
make
make install

cd ${PWD} && rm -rf ${DIR}

