#!/bin/bash
#
# Fs_licet_MODER_4x3_at0.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

ln -sf ../Auxil-contrib/ls-1_9999
r1=`echo $1|sed 's/.png//'`
r1r=`echo $1|sed 's/_4x3_at0/_MODER_4x3_at0/'|sed 's/.png//'`
echo \$r1: ; echo $r1
echo \$r1r:
echo $r1r
#read FAKE
cp -avL $r1.png $r1r.png
ls -l $r1.png $r1r.png
echo \$r1.png \$r1r.png
echo $r1.png $r1r.png
#read FAKE
mkdir -p $r1r.d/DEL/
cp -avL $r1r.png $r1r.d/
echo cp -avL \$r1r.png \$r1r.d/:
echo cp -avL $r1r.png $r1r.d/
#read FAKE
cd $r1r.d/
mkdir -p ../JIC
cat ../ls-1_9999|head -n600 > ../ls-1_1-600
ln -s ../ls-1_1-600
echo "Patience, the `basename $0` takes its time"
	for i in `cat ls-1_1-600`
	do
		convert -define png:color-type=6 $r1r.png \
			-crop 768x576+0+`echo $i*4|bc` $r1r-$i.png
		convert $r1r-$i.png -scale 768x576 $r1r-${k}_scale.png
		convert $r1r-${k}_scale.png -define png:color-type=6 \
			$r1r-${k}_define.png
		mv $r1r-$i.png $r1r-${k}_scale.png DEL/
		mv $r1r-${k}_define.png $r1r-$i.png
	done
