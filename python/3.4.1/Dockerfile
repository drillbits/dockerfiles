FROM       ubuntu:14.04
MAINTAINER drillbits <neji@drillbits.jp>

# Enable Universe and Multiverse and install dependencies
RUN echo deb http://archive.ubuntu.com/ubuntu trusty universe multiverse >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install build-essential libsqlite3-dev libreadline6-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip wget python-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Fetch Sources
RUN cd /usr/local/src && wget https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tgz

# Build Python
RUN cd /usr/local/src && \
    tar xvzf Python-3.4.1.tgz && \
    cd Python-3.4.1 && \
    LDFLAGS="-L/usr/lib/x86_64-linux-gnu" ./configure --prefix=/opt/python3.4.1 && \
    make && sudo make install && make distclean && \
    cd ../ && rm -f Python-3.4.1.tgz && rm -rf Python-3.4.1
