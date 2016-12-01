#!/bin/bash

SRC=${SRC:-/usr/local}
FDKAAC_VERSION=${FDKAAC_VERSION:-0.1.4}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

# v0.1.5 not released
# https://github.com/mstorsjo/fdk-aac/issues/41
# https://github.com/mstorsjo/fdk-aac/issues/45
# curl -sL https://github.com/mstorsjo/fdk-aac/archive/v${FDKAAC_VERSION}.tar.gz|tar -zx --strip-components=1
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure --prefix="${SRC}" --disable-static --datadir="${DIR}"
make
make install
make distclean

cd ${PWD} && rm -rf ${DIR}

