#!/bin/bash
#
# Fs_ALLEG_r30_at00000.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."
if [ ! -e ../Auxil-contrib/slow2read_eh.png ]
	then
		cd ../Auxil-contrib/
		./make_slow2read.sh
		cd -
fi
ln -sf ../Auxil-contrib/ls-1_9999
ln -sf ../Auxil-contrib/LOGO_Flowstamp.png
ln -sf ../Auxil-contrib/slow2read_eh.png

if [ -e "Fs_at00000.png" ]
	then
		if [ ! -s "Fs_at00000.png" ]
		then
			echo "Fs_at00000.png is there but _is_ zero size, something is"
			echo "wrong. Advice: Ctrl-C and investigate!"
		else
			echo "Fs_at00000.png is there and is not zero"
		fi
	else
		if [ -e "../Auxil-contrib/Fs_at00000.png" ]
		then
			ln -s ../Auxil-contrib/Fs_at00000.png
		else
			mkdir -p ../Make_licet_at0/
			cp -av ../Make_licet_TXT_at0/* ../Make_licet_at0/
			cp -av ../Auxil-contrib/make_licet_at0.sh ../Make_licet_at0/
			cd ../Make_licet_at0/
			echo "./make_licet_at0.sh clutters with excessive output, silenced:"
			echo "===> ./make_licet_at0.sh &> /dev/null"
			./make_licet_at0.sh &> /dev/null
			cd -
			cp -av ../Make_licet_at0/Fs_at00000.png ../Auxil-contrib/
			ln -s ../Auxil-contrib/Fs_at00000.png
		fi
fi

echo "./Fs_licet_ALLEG_r30_at00000.sh clutters with excessive output, silenced:"
echo "===> ./Fs_licet_ALLEG_r30_at00000.sh Fs_at00000.png &> /dev/null"
./Fs_licet_ALLEG_r30_at00000.sh Fs_at00000.png &> /dev/null

cd Fs_ALLEG_at0.d/

cat ../ls-1_9999|head -n250 > ../ls-1_250

ls -1 Fs_ALLEG_at0-????.png | sed 's/Fs_ALLEG_at0-//'|sed 's/.png//' > \
	../ls-1_250
sort -r ../ls-1_250 > ../ls-1_250r
echo "ls-1_250r"
#read FAKE

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../


cat ../ls-1_250 | head -n235 > ../ls-1_235
sort -r ../ls-1_235 > ../ls-1_235r
for i in $(<../ls-1_235r)
	do
		j=`echo $i+15|bc`; mv -v Fs_ALLEG_at0-$i.png Fs_ALLEG_at0-$j.png
	done

chcase -x 's/ALLEG_at0-/ALLEG_at0-00/' Fs_ALLEG_at0-??.png
chcase -x 's/ALLEG_at0-/ALLEG_at0-0/' Fs_ALLEG_at0-???.png

cat ../ls-1_250 | head -n15 > ../ls-1_15

for i in $(<../ls-1_15)
	do
		cp -a Fs_ALLEG_at0-0016.png Fs_ALLEG_at0-$i.png
	done

for i in $(<../ls-1_15)
	do
		perc=`echo 100000000/15*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_ALLEG_at0-$i.png \
			-blend ${perc}x${percrev} ../transp_00_768.png \
			Fs_ALLEG_at0-${i}.png
	done

cat ../ls-1_250 | tail -n130 > ../ls-1_121-250
cat ../ls-1_121-250 | head -n40 > ../ls-1_121-160
echo "All transposed, ls-1_15 fadein..."
echo "ls-1_121-160"
#read FAKE

for i in $(<../ls-1_121-160)
	do
		cp -a Fs_ALLEG_at0-0120.png Fs_ALLEG_at0-$i.png
	done

for i in $(<../ls-1_121-160)
	do
		j=`echo $i-120|bc`
		perc=`echo 100000000/40*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_ALLEG_at0-$i.png \
			-blend ${percrev}x${perc} ../transp_00_768.png \
			Fs_ALLEG_at0-${i}.png
	done

# Needed here?
chcase -x 's/ALLEG_at0-/ALLEG_at0-0/' Fs_ALLEG_at0-???.png
echo "chcase -x 's/ALLEG_at0-/ALLEG_at0-0/'..."
#read FAKE
cat ../ls-1_250 | tail -n90 > ../ls-1_161-250

for i in $(<../ls-1_161-250)
	do
		cp -av Fs_ALLEG_at0-0160.png Fs_ALLEG_at0-${i}.png
	done


cd ../

echo "";
echo "... Next: creating black ..."
echo "";
#read FAKE

mkdir -p Fs_ALLEG_4x3_at0_black.d/
cd Fs_ALLEG_4x3_at0_black.d/

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

cat ../ls-1_9999 | head -n70 > ../ls-1_70

for i in $(<../ls-1_70)
	do
		perc=`echo 100000000/70*$i/1000000|bc`
		echo $perc ; percrev=`echo 100-$perc|bc`; echo $percrev
		composite -define png:color-type=6 black_00_1024.png \
			-blend ${percrev}x${perc} transp_00_1024.png black_bkg-$i.png
	done

echo "... black_bkg-$i.png, the last one ..." ; #read FAKE

mkdir Later/
for i in $(<../ls-1_70)
	do
		cp -av black_bkg-$i.png Later/
	done

cat ../ls-1_9999 | head -n250 > ../ls-1_250
sort -r ../ls-1_250 > ../ls-1_250r
cat ../ls-1_250r | head -n180 > ../ls-1_71-250r

#display black_bkg-0070.png
for i in $(<../ls-1_71-250r)
	do
		cp -av black_bkg-0070.png black_bkg-$i.png
	done

echo "... black_bkg-0070.png black_bkg ..." ; #read FAKE

cp -av Later/ Later.BAK
cd Later
rm black_bkg-0070.png
chcase -x 's/black_bkg-00/black_bkg-01/' black_bkg-00??.png
cp -av black_bkg-010[89].png black_bkg-01[12-6]?.png ../

cd ../

# Already exsists:
#cat ../ls-1_9999 | head -n250 > ../ls-1_250
cat ../ls-1_250 | head -n107 > ../ls-1_107
cat ../ls-1_107| tail -n100 > ../ls-1_8-107

#display black_bkg-0008.png
for i in $(<../ls-1_8-107)
	do
		cp -av black_bkg-0008.png black_bkg-$i.png
	done
echo "... ls-1_8-107, that black_bkg-0008.png to that range, did it? Enter!"
#read FAKE

cd ../

#myCMNT --END-- part 2 OK: creating of black

cat ls-1_9999 |head -n30 > ls-1_30

mkdir -p Flowstamp.d/
cp -avL LOGO_Flowstamp.png Flowstamp.d/
cd Flowstamp.d/

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

for i in $(<../ls-1_30)
	do
		perc=`echo 100000000/30*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${perc}x${percrev} ../transp_00_1024.png \
			Flowstamp-${i}.png
	done

for i in $(<../ls-1_30)
	do
		perc=`echo 100000000/30*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${percrev}x${perc} ../transp_00_1024.png \
			Flowstamp-${i}_rev.png
	done

mkdir -p Later/
mv -v Flowstamp-????_rev.png Later/

echo "... Flowstamp-${i}, $i was last, rev in Later/ ..."
#read FAKE

cat ../ls-1_9999 | head -n250 > ../ls-1_250
cat ../ls-1_250 | sort -r ../ls-1_250r
cat ../ls-1_250r | head -n221 > ../ls-1_31-250

for i in $(<../ls-1_31-250)
	do
		cp -av Later/Flowstamp-0030_rev.png Flowstamp-${i}.png
	done
echo "echo 31-250 \$i: $i"
#read FAKE

cp -av Later/ Later.BAK/

cat ../ls-1_9999 | head -n143 > ../ls-1_143
cat ../ls-1_143 | tail -n116 > ../ls-1_28-143

for i in $(<../ls-1_28-143)
	do
		cp -av Flowstamp-0027.png Flowstamp-${i}.png
	done
echo "echo 27-143 \$i: $i"
#read FAKE

cd Later/
rm Flowstamp-0030_rev.png
chcase -x 's/_rev.png/.png/' Flowstamp-00??_rev.png
chcase -x 's/Flowstamp-000/Flowstamp-014/' Flowstamp-000?.png
chcase -x 's/Flowstamp-001/Flowstamp-015/' Flowstamp-001?.png
chcase -x 's/Flowstamp-002/Flowstamp-016/' Flowstamp-002?.png
cp -av Flowstamp-014[4-9].png Flowstamp-01[56]?.png ../

cd ../

echo "cp -av Flowstamp-014[4-9].png Flowstamp-01[56]?.png"
#read FAKE

cat ../ls-1_9999 | head -n250 > ../ls-1_250
cat ../ls-1_250 | tail -n81 > ../ls-1_170-250

for i in $(<../ls-1_170-250)
	do
		cp -av Flowstamp-0169.png Flowstamp-${i}.png
	done
echo "echo 170-250 \$i: $i"
#read FAKE

cd ../

mkdir -p Slow2read.d/
cp -avL slow2read_eh.png Slow2read.d/
cd Slow2read.d/

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

for i in $(<../ls-1_15)
	do
		perc=`echo 100000000/15*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 slow2read_eh.png \
			-blend ${perc}x${percrev} ../transp_00_1024.png \
			slow2read-${i}.png
	done

for i in $(<../ls-1_15)
	do
		perc=`echo 100000000/15*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 slow2read_eh.png \
			-blend ${percrev}x${perc} ../transp_00_1024.png \
			slow2read-${i}_rev.png
	done

mkdir -p Later/
mv -v slow2read-????_rev.png Later/

echo "... slow2read-${i}, $i was last, rev in Later/ ..."
#read FAKE

cat ../ls-1_9999 | head -n250 > ../ls-1_250
cat ../ls-1_250 | sort -r ../ls-1_250r
cat ../ls-1_250r | head -n235 > ../ls-1_16-250

for i in $(<../ls-1_16-250)
	do
		cp -av Later/slow2read-0015_rev.png slow2read-${i}.png
	done
echo "echo 16-250 \$i: $i"
#read FAKE

cp -av Later/ Later.BAK/

cat ../ls-1_9999 | head -n151 > ../ls-1_151
cat ../ls-1_151 | tail -n138 > ../ls-1_14-151

for i in $(<../ls-1_14-151)
	do
		cp -av slow2read-0013.png slow2read-${i}.png
	done
echo "echo 14-151 \$i: $i"
#read FAKE

cd Later/
rm slow2read-0015_rev.png
chcase -x 's/_rev.png/.png/' slow2read-00??_rev.png
chcase -x 's/slow2read-000/slow2read-015/' slow2read-000?.png
chcase -x 's/slow2read-001/slow2read-016/' slow2read-001?.png
cp -av slow2read-015[2-9].png slow2read-01[6]?.png ../

cd ../

echo "cp -av slow2read-015[2-9].png slow2read-01[6]?.png"
#read FAKE

cat ../ls-1_9999 | head -n250 > ../ls-1_250
cat ../ls-1_250 | tail -n81 > ../ls-1_170-250

for i in $(<../ls-1_170-250)
	do
		cp -av slow2read-0169.png slow2read-${i}.png
	done
echo "echo 170-250 \$i: $i"
#read FAKE

cd ../

mkdir -p Fs_Flowstamp_nSlow2read.d/

for i in $(<ls-1_250)
	do
		composite -define png:color-type=6 \
			Flowstamp.d/Flowstamp-$i.png \
			Slow2read.d/slow2read-$i.png \
			Fs_Flowstamp_nSlow2read.d/Fs_Flowstamp_nSlow2read.$i.png
	done

mkdir -p Fs_ALLEG_at0_on_black.d/

# Not entering in that dir here, see the command below!
#cd Fs_ALLEG_at0_on_black.d/

echo "To do now:"
echo "Fs_ALLEG_at0_on_black.d"

for i in $(<ls-1_250)
	do
		composite -define png:color-type=6 \
			Fs_ALLEG_at0.d/Fs_ALLEG_at0-$i.png -geometry +128+0 \
			Fs_ALLEG_4x3_at0_black.d/black_bkg-$i.png \
			Fs_ALLEG_at0_on_black.d/Fs_ALLEG_at0_on_black-$i.png
	done

echo "... Is ...d/black_bkg-... OK? ..."

mkdir -p Fs_ALLEG_at0_on_black_nLOGO.d/

# Not entering in that dir here, see the command below!
#cd Fs_ALLEG_at0_on_black_nLOGO.d/

for i in $(<ls-1_250)
	do
		composite -define png:color-type=6 \
			Fs_Flowstamp_nSlow2read.d/Fs_Flowstamp_nSlow2read.$i.png \
			Fs_ALLEG_at0_on_black.d/Fs_ALLEG_at0_on_black-$i.png \
			Fs_ALLEG_at0_on_black_nLOGO.d/Fs_ALLEG_at0_on_black_nLOGO-$i.png
	done
echo "... Is compositing of Flowstamp on black OK? ..."
echo "Next used to be creating the qtrle mov"
echo "But for 1920x1080, 30fps, scaling the 768x576 mov produces jittery"
echo "overlay. So 1920 have all ImageMagick convert resizing the whole"
echo "produce at this step."
#read FAKE
mv -iv Fs_ALLEG_at0_on_black_nLOGO.d/  Fs_ALLEG_at0_on_black_nLOGO.d_768/
mkdir -p Fs_ALLEG_at0_on_black_nLOGO.d
for i in $(<ls-1_250)
	do
		convert -define png:color-type=6 -resize 1920x1080 \
			Fs_ALLEG_at0_on_black_nLOGO.d_768/Fs_ALLEG_at0_on_black_nLOGO-$i.png \
			Fs_ALLEG_at0_on_black_nLOGO.d/Fs_ALLEG_at0_on_black_nLOGO-$i.png
	done
echo "What did we get?"
#read FAKE

ffmpeg -y -framerate 30 -i \
	Fs_ALLEG_at0_on_black_nLOGO.d/Fs_ALLEG_at0_on_black_nLOGO-%4d.png \
	-c qtrle -r 30 Fs_ALLEG_r30_at0_on_black_nLOGO.mov
