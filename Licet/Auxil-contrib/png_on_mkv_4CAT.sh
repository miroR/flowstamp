#!/bin/bash
#
# png_on_mkv_4CAT.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."
for s in $(echo width height sample_aspect_ratio display_aspect_ratio r_frame_rate) ;
	do ffprobe -v panic -of default=nw=1:nk=1 -select_streams v:0 \
		-show_entries stream=$s $i.mkv > stream.$s ;
	done ;
ffprobe -v panic -of default=nw=1:nk=1 \
	-show_entries format=duration $i.mkv > format.duration
rate=$(<stream.r_frame_rate)

echo -n \$rate:
echo $rate
export rate

case "$rate" in
	"25/1" )
		echo "25" > $i.fps
	;;

	"30/1" )
		echo "30" > $i.fps
	;;

	"50/1" )
		echo "50" > $i.fps
	;;

	* )
		echo "Other rates will be supported when I will need them,"
		echo "and find time. Or if you do it."
	;;
esac

	r=$(cat $i.fps | cut -d'.' -f1)
	echo \$r:
	echo $r

for i in `cat ls-1_V`
	do
		nice -n19 ffmpeg -i $i.mkv -async 1 -map 0:v -g 10 \
			-c:v libx264 -r $r -map 0:a -c:a copy \
			-vf movie=$i.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
			${i}_4CAT.mkv
	done

