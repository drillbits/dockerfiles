FROM       ubuntu:16.10
MAINTAINER drillbits <neji@drillbits.jp>

CMD         ["--help"]
ENTRYPOINT  ["ffmpeg"]
WORKDIR     /tmp/workdir

ADD ./deps.sh deps.sh
RUN /bin/bash deps.sh

ADD ./make_x264.sh make_x264.sh
RUN /bin/bash make_x264.sh

ADD ./make_x265.sh make_x265.sh
RUN /bin/bash make_x265.sh

ADD ./make_ogg.sh make_ogg.sh
RUN /bin/bash make_ogg.sh

ADD ./make_opus.sh make_opus.sh
RUN /bin/bash make_opus.sh

ADD ./make_vorbis.sh make_vorbis.sh
RUN /bin/bash make_vorbis.sh

ADD ./make_theora.sh make_theora.sh
RUN /bin/bash make_theora.sh

ADD ./make_vpx.sh make_vpx.sh
RUN /bin/bash make_vpx.sh

ADD ./make_lame.sh make_lame.sh
RUN /bin/bash make_lame.sh

ADD ./make_xvid.sh make_xvid.sh
RUN /bin/bash make_xvid.sh

ADD ./make_fdkaac.sh make_fdkaac.sh
RUN /bin/bash make_fdkaac.sh

ADD ./make_ffmpeg.sh make_ffmpeg.sh
RUN /bin/bash make_ffmpeg.sh

ADD ./cleanup.sh cleanup.sh
RUN /bin/bash cleanup.sh

