FROM        alpine
MAINTAINER  drillbits <neji@drillbits.jp>

CMD         ["--help"]
ENTRYPOINT  ["ffmpeg"]
WORKDIR     /tmp/workdir

RUN apk --update add curl tar xz

# ffmpeg
RUN \
	PWD=$(pwd) && DIR=$(mktemp -d) && cd ${DIR} && \
	curl -sL http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz|tar -Jx --strip-components=1 && \
	mv ffmpeg /usr/local/bin && \
	cd ${PWD} && rm -rf ${DIR}

