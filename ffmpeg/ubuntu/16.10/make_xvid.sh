#!/bin/bash

SRC=${SRC:-/usr/local}
XVID_VERSION=${XVID_VERSION:-1.3.4}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL http://downloads.xvid.org/downloads/xvidcore-${XVID_VERSION}.tar.gz|tar -zx
cd xvidcore/build/generic && \
./configure --prefix="${SRC}" --bindir="${SRC}/bin" --datadir="${DIR}" --disable-static --enable-shared
make
make install

cd ${PWD} && rm -rf ${DIR}

