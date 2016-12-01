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

apt -yqq update
apt install -yq --no-install-recommends ${BUILD_DEPS} ca-certificates

