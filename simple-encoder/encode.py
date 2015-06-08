import datetime
import logging
import os
import subprocess

logging.basicConfig(filename='encode.log', level=logging.DEBUG)


def main():
    for infile in os.listdir('.'):
        name, ext = os.path.splitext(infile)
        if ext != '.ts':
            continue
        infile = infile.decode('utf-8', 'ignore')
        infile = infile.encode('utf-8')
        outfile = os.path.join(
            'mp4',
            '{name}.mp4'.format(name=name),
        )

        cmd = (
            'ffmpeg -i "{infile}" '
            '-f mp4 -acodec libfdk_aac -ab 128k -ar 48000 '
            '-vcodec libx264 -b:v 1024k -s hd720 -pass 1 '
            '-threads 2 -cmp chroma '
            '-flags +ilme+ildct '
            '-deinterlace -top -1 '
            '-fpre /libx264.ffpreset '
            '-passlogfile "./pass.log" '
            '-y "{outfile}" '
            '2>> ffmpeg.log && '
            'ffmpeg -i "{infile}" '
            '-f mp4 -acodec libfaac -ab 128k -ar 48000 '
            '-vcodec libx264 -b:v 1024k -s hd720 -pass 2 '
            '-threads 2 -cmp chroma '
            '-flags +ilme+ildct '
            '-deinterlace -top -1 '
            '-fpre /libx264.ffpreset '
            '-passlogfile "./pass.log" '
            '-y "{outfile}" '
            '2>> ffmpeg.log'
        ).format(infile=infile, outfile=outfile)

        logging.info("BEGIN: %s", datetime.datetime.now())
        proc = subprocess.Popen(cmd, shell=True)
        proc.wait()
        logging.info("END: %s", datetime.datetime.now())
        mv_cmd = 'mv "{infile}" "encoded/{infile}"'.format(infile=infile)
        print(mv_cmd)
        subprocess.Popen(mv_cmd, shell=True)

if __name__ == '__main__':
    main()
