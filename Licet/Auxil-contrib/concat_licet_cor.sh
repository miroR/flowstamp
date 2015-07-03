#!/bin/bash
#
# concat_licet_cor.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

echo "###    For rates 30 and 50 videos, in this instance the \${i}_LICET.mkv:"
echo "###    ${i}_LICET.mkv"
echo "###    needs some correcting. The right processing"
echo "###    for rates different then 25fps is currently lacking."
echo "###    "
echo "###    The whole of licet functionality needs rewriting to do that,"
echo "###    but I do not have the time."
echo "###    "
echo "###    It's dirty, but at least it is only called, in similar way,"
echo "###    in twelve (12) different places in the program"
echo "###    (this script is called and not the code repeated in those places,"
echo "###    like it still happens with some other stuff which I haven't yet"
echo "###    grasped how to accomplish without repeating)."
echo "###    "
echo "###    And it _somewhat_ works."
echo "###    \"Somewhat\" meaning: the video is pasted back together"
echo "###    correctly for 1920x1080 30fps, and the poor match is somewhat"
echo "###    mitigated for 768x576 50fps, but, alas, the licet is not of the"
echo "###    same flowing speed for all of the supported (25, 30, 50)"
echo "###    different rates (and not each supports all video sizes)! This"
echo "###    program originally served me for 758x576 25fps only..."
echo "###    "
echo "###    I'm not really a programmer"
echo "###    and am long overdue doing other things."
echo "###    If anyone is willing and able to send patches reddressing these"
echo "###    and other flaws/insufficiencies of this program, they will be"
echo "###    welcome!"
echo "###    (I haven't even wrapped this code by the standards, as I'm dead"
echo "###    tired on arrival here, sorry!)"

case $2 in
	"last" )
		concat_last=$(echo $1 | sed 's/\.mkv//')
		echo \$concat_last: $concat_last
		ls -l ${concat_last}.mkv
		#read FAKE
		mkvextract tracks $concat_last.mkv 0:$concat_last.h264 1:$concat_last.ogg
		ls -l $concat_last.h264 $concat_last.ogg
		mkvmerge -o ${concat_last}_h264.mkv $concat_last.h264
		mkvmerge -o ${concat_last}_ogg.mkv $concat_last.ogg
		mhms=$(mkvinfo ${concat_last}.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//')
		echo \$mhms: $mhms
		#read FAKE
		vhms=$(mkvinfo ${concat_last}_h264.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//')
		echo \$vhms: $vhms
		#read FAKE
		ahms=$(mkvinfo ${concat_last}_ogg.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//')
		echo \$ahms: $ahms
		#read FAKE
		#mkvmerge -o ${concat_last}_h264_.mkv --split timecodes:$vhms ${concat_last}_h264.mkv
		mkvmerge -o ${concat_last}_ogg_.mkv --split timecodes:$vhms ${concat_last}_ogg.mkv
		echo "mkvinfo ${concat_last}_h264_-001.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//'"
		mkvinfo ${concat_last}_h264_-001.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//'
		#read FAKE
		mkvmerge -o ${concat_last}r.mkv ${concat_last}.h264 ${concat_last}_ogg_-001.mkv
		#read FAKE
		mv -v ${concat_last}r.mkv ${concat_last}.mkv
		ls -l ${concat_last}.mkv
		#read FAKE
	;;

	"first" )
		concat_first=$(echo $1 | grep '\.mkv' | sed 's/\.mkv//')
		echo \$concat_first: $concat_first
		ls -l ${concat_first}.mkv
		#read FAKE
		mkvextract tracks $concat_first.mkv 0:$concat_first.h264 1:$concat_first.ogg
		ls -l $concat_first.h264 $concat_first.ogg
		mkvmerge -o ${concat_first}_h264.mkv $concat_first.h264
		mkvmerge -o ${concat_first}_ogg.mkv $concat_first.ogg
		mhms=$(mkvinfo ${concat_first}.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//')
		echo \$mhms: $mhms
		#read FAKE
		vhms=$(mkvinfo ${concat_first}_h264.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//')
		echo \$vhms: $vhms
		#read FAKE
		ahms=$(mkvinfo ${concat_first}_ogg.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//')
		echo \$ahms: $ahms
		#read FAKE
		mkvmerge -o ${concat_first}_ogg_.mkv --split timecodes:$vhms ${concat_first}_ogg.mkv
   	
		ahmsrev=$(mkvinfo ${concat_first}_ogg_-002.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//')
		echo $ahmsrev
		#read FAKE
		mkvmerge -o ${concat_first}_ogg_.mkv --split timecodes:$ahmsrev ${concat_first}_ogg.mkv
		
		echo "mkvinfo ${concat_first}_ogg_-002.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//'"
		mkvinfo ${concat_first}_ogg_-002.mkv | grep Duration | awk '{ print $5 }' | sed 's/(//' | sed 's/)//'
		#read FAKE
		mkvmerge -o ${concat_first}r.mkv ${concat_first}.h264 ${concat_first}_ogg_-002.mkv
		#read FAKE
		mv -v ${concat_first}r.mkv ${concat_first}.mkv
		ls -l ${concat_first}.mkv
		#read FAKE
	;;
esac
