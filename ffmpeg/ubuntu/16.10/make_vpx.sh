#!/bin/bash

SRC=${SRC:-/usr/local}
VPX_VERSION=${VPX_VERSION:-1.6.0}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL https://codeload.github.com/webmproject/libvpx/tar.gz/v${VPX_VERSION}|tar -zx --strip-components=1
./configure --prefix="${SRC}" --enable-vp8 --enable-vp9 --enable-pic --disable-debug --disable-examples --disable-docs --disable-install-bins --enable-shared
make
make install

cd ${PWD} && rm -rf ${DIR}

