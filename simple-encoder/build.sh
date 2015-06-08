#!/bin/sh
if [ $# -ne 1 ]; then
  echo "usage: ./build.sh ts_directory" 1>&2
  exit 1
fi

docker build -t drillbits/ffmpeg ../ffmpeg
docker build -t drillbits/simple-encoder .
docker run -d -v $1:/ts drillbits/simple-encoder
