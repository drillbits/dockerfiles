#!/bin/bash

BUILD_DEPS="\
	autoconf \
	automake \
	cmake \
	curl \
	bzip2 \
	g++ \
	gcc \
	git \
	libtool \
	make \
	nasm \
	perl \
	pkg-config \
	python \
	libssl-dev \
	yasm \
	zlib1g-dev"

apt purge -y ${BUILD_DEPS}
apt autoremove -y
apt clean -y
rm -rf /var/lib/apt/lists
ffmpeg -buildconf

