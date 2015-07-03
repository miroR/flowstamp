#!/bin/bash
#
# Fs_ALLEG_4x3r50_at0_on_lsVf.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

ls -l $1
echo "\`cat \$1\`:"
cat $1
echo $0 ; pwd ;
for i in `cat $1` ; do
	ffmpeg -y -i $i.mkv -vf \
		"movie=Fs_ALLEG_4x3r50_at0_on_black_nLOGO.mov,scale=${wid}:${hei} \
		[wm],[in][wm] overlay=(W-w)/2:(H-h)/2 [out]" \
		-c:v libx264 -g 10 -c:a libvorbis ${i}_LICET.mkv
	../Auxil-contrib/concat_licet_cor.sh ${i}_LICET.mkv first
done
