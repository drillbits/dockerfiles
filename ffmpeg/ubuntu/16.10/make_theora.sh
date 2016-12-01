#!/bin/bash

SRC=${SRC:-/usr/local}
THEORA_VERSION=${THEORA_VERSION:-1.1.1}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL http://downloads.xiph.org/releases/theora/libtheora-${THEORA_VERSION}.tar.bz2|tar -jx --strip-components=1
./configure --prefix="${SRC}" --with-ogg="${SRC}" --bindir="${SRC}/bin" --disable-static --datadir="${DIR}" 
make
make install

cd ${PWD} && rm -rf ${DIR}

