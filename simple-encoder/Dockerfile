FROM       drillbits/ffmpeg
MAINTAINER drillbits <neji@drillbits.jp>

COPY encode.py encode.py
COPY libx264.ffpreset libx264.ffpreset

WORKDIR /ts
ENTRYPOINT ["/usr/bin/python", "/encode.py"]
