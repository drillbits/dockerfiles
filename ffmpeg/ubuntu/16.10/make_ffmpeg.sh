#!/bin/bash

SRC=${SRC:-/usr/local}
FFMPEG_VERSION=${FFMPEG_VERSION:-3.2.1}

export MAKEFLAGS="-j$(($(nproc) + 1))"

PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR}

curl -sL http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz|tar -zx --strip-components=1
./configure --prefix="${SRC}" \
	--extra-cflags="-I${SRC}/include" \
	--extra-ldflags="-L${SRC}/lib" \
	--bindir="${SRC}/bin" \
	--disable-doc \
	--disable-static \
	--enable-shared \
	--disable-ffplay \
	--extra-libs=-ldl \
	--enable-version3 \
	--enable-libfdk_aac \
	--enable-libmp3lame \
	--enable-libopus \
	--enable-libtheora \
	--enable-libvorbis \
	--enable-libvpx \
	--enable-libx264 \
	--enable-libx265 \
	--enable-libxvid \
	--enable-gpl \
	--enable-avresample \
	--enable-postproc \
	--enable-nonfree \
	--disable-debug \
	--enable-small \
	--enable-openssl
make
make install
make distclean
hash -r 
cd tools
make qt-faststart
cp qt-faststart ${SRC}/bin

cd ${PWD} && rm -rf ${DIR}

