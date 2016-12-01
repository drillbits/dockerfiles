#!/bin/bash

SRC=${SRC:-/usr/local}
VORBIS_VERSION=${VORBIS_VERSION:-1.3.5}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL http://downloads.xiph.org/releases/vorbis/libvorbis-${VORBIS_VERSION}.tar.gz|tar -zx --strip-components=1
./configure --prefix="${SRC}" --with-ogg="${SRC}" --bindir="${SRC}/bin" --disable-static --datadir="${DIR}"
make
make install

cd ${PWD} && rm -rf ${DIR}

