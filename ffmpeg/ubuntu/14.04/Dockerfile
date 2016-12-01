FROM       ubuntu:14.04
MAINTAINER drillbits <neji@drillbits.jp>

# Enable Universe and Multiverse and install dependencies
RUN echo deb http://archive.ubuntu.com/ubuntu trusty universe multiverse >> /etc/apt/sources.list;apt-get update;apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev libsdl1.2-dev libva-dev libvdpau-dev libx11-dev libxext-dev libxfixes-dev wget unzip nasm;apt-get clean;

# Fetch Sources
RUN cd /usr/local/src;wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz;wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2;wget -O fdk-aac.zip https://github.com/mstorsjo/fdk-aac/zipball/master;wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz;wget http://downloads.xiph.org/releases/opus/opus-1.1.tar.gz;wget http://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2;wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2;

# Build Yasm
RUN cd /usr/local/src;tar xzvf yasm-1.3.0.tar.gz;cd yasm-1.3.0;./configure;make -j 4;make install;make distclean;

# Build libx264
RUN cd /usr/local/src;tar xjvf last_x264.tar.bz2;cd x264-snapshot*;./configure --enable-static;make -j 4;make install;make distclean;

# Build libfdk-aac
RUN cd /usr/local/src;unzip fdk-aac.zip;cd mstorsjo-fdk-aac*;autoreconf -fiv;./configure --disable-shared;make -j 4;make install;make distclean;

# Build libmp3lame
RUN cd /usr/local/src;tar xzvf lame-3.99.5.tar.gz;cd lame-3.99.5;./configure --enable-nasm --disable-shared;make -j 4;make install;make distclean;

# Build libopus
RUN cd /usr/local/src;tar xzvf opus-1.1.tar.gz;cd opus-1.1;./configure --disable-shared;make -j 4;make install;make distclean;

# Build libvpx
RUN cd /usr/local/src;tar xjvf libvpx-v1.3.0.tar.bz2;cd libvpx-v1.3.0;./configure --disable-examples;make -j 4;make install;make clean;

# Build ffmpeg
RUN cd /usr/local/src;tar xjvf ffmpeg-snapshot.tar.bz2;cd ffmpeg;./configure --enable-gpl --enable-libass --enable-libfdk_aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree --enable-x11grab;make -j 4;make install;make distclean;hash -r;
