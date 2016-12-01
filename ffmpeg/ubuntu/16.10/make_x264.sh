#!/bin/bash

SRC=${SRC:-/usr/local}
X264_VERSION=${X264_VERSION:-20160826-2245-stable}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL https://ftp.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-${X264_VERSION}.tar.bz2|tar -jx --strip-components=1
./configure --prefix="${SRC}" --bindir="${SRC}/bin" --enable-pic --enable-shared --disable-cli
make
make install

cd ${PWD} && rm -rf ${DIR}

