FROM ubuntu:trusty
MAINTAINER drillbits <neji@drillbits.jp>

RUN echo "Asia/Tokyo" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get update
RUN apt-get install -y software-properties-common curl wget unzip gcc build-essential pkg-config autoconf git

# pcsc client
RUN apt-get install -y libpcsclite1 libpcsclite-dev libccid pcsc-tools

# b25
RUN apt-get install -y libpcsclite-dev zlib1g-dev
RUN wget http://hg.honeyplanet.jp/pt1/archive/ec7c87854f2f.zip && unzip ec7c87854f2f.zip
RUN cd pt1-ec7c87854f2f/arib25/src/ && make && make install

# recpt1
RUN git clone https://github.com/stz2012/recpt1
RUN cd recpt1/recpt1/ && ./autogen.sh && ./configure --enable-b25 && make && make install

# epgdump
RUN apt-get install -y gettext cmake
RUN git clone https://github.com/Piro77/epgdump.git
RUN cd epgdump && ./autogen.sh && make && sudo cp epgdump /usr/local/bin

# clean up apt
RUN apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# docker build -t drillbits/recpt1
