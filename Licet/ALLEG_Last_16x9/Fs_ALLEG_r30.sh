#!/bin/bash
#
# Fs_ALLEG_r30.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."
if [ ! -e ../Auxil-contrib/slow2read_eh.png ]
	then
		cd ../Auxil-contrib/
		echo "===> ./make_slow2read.sh &> /dev/null"
		./make_slow2read.sh &> /dev/null
		cd -
fi
ln -sf ../Auxil-contrib/ls-1_9999
ln -sf ../Auxil-contrib/LOGO_Flowstamp.png
ln -sf ../Auxil-contrib/slow2read_eh.png

if [ -e "Fs.png" ]
	then
		if [ ! -s "Fs.png" ]
		then
			echo "Fs.png is there but _is_ zero size, something is"
			echo "wrong. Advice: Ctrl-C and investigate!"
		else
			echo "Fs.png is there and is not zero"
		fi
	else
		if [ -e "../Auxil-contrib/Fs.png" ]
		then
			ln -s ../Auxil-contrib/Fs.png
		else
			"Problems! How do I stop the script?"
		fi
fi

echo "===> ./Fs_licet_ALLEG_r30.sh Fs.png &> /dev/null"
./Fs_licet_ALLEG_r30.sh Fs.png &> /dev/null

cd Fs_ALLEG.d/

#There''ll be dozens of files around, most will be temp
convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

mkdir -p JIC
mkdir -p DEL

ls -1 Fs_ALLEG-????.png | sed 's/Fs_ALLEG-//'|sed 's/.png//' > ../ls-1_1000
echo "../ls-1_1000 marking this point, it's before ... > ../ls-1_1000r "
#read FAKE

sort -r ../ls-1_1000 > ../ls-1_1000r

for i in $(<../ls-1_1000r)
	do
		j=`echo $i+50|bc`; mv -iv Fs_ALLEG-$i.png Fs_ALLEG-$j.png
	done

# first only not needed here?
#chcase -x 's/ALLEG-/ALLEG-000/' Fs_ALLEG-?.png
chcase -x 's/ALLEG-/ALLEG-00/' Fs_ALLEG-??.png
chcase -x 's/ALLEG-/ALLEG-0/' Fs_ALLEG-???.png
cat ../ls-1_9999 | head -n90 > ../ls-1_90
for i in $(<../ls-1_90)
	do
		cp -av Fs_ALLEG-0091.png Fs_ALLEG-$i.png
	done

ls -1 Fs_ALLEG-????.png | sed 's/Fs_ALLEG-//'|sed 's/.png//' > ../ls-1_1050
echo "ls-1_1000, first 90, same as 51 turned 91"
echo "...since series of 1000 previously shifted"
#read FAKE

echo "Few points in this edition to shift-add-fade,in/out..."
echo "...this is the fast one for under 4 min orig videos!"
#read FAKE

cat ../ls-1_9999 |head -n50 > ../ls-1_50
echo "... ls-1_50 ... "
#read FAKE

for i in $(<../ls-1_50)
	do
		perc=`echo 100000000/50*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_ALLEG-$i.png \
			-blend ${perc}x${percrev} ../transp_00_768.png Fs_ALLEG-${i}.png
	done
echo "... percrev ... "
#read FAKE

# was: TO DO later!
sort -r ../ls-1_1050 > ../ls-1_1050r
cat ../ls-1_1050r | head -n741 > ../ls-1_310-1050r
echo " ../ls-1_310-1050r "
#read FAKE
for i in $(<../ls-1_310-1050r)
	do
		j=`echo $i+50|bc` ; mv -v Fs_ALLEG-$i.png Fs_ALLEG-$j.png
	done
chcase -x 's/ALLEG-/ALLEG-0/' Fs_ALLEG-???.png

cat ../ls-1_310-1050r | tail -n51 > ../ls-1_300-350r
for i in $(<../ls-1_300-350r)
	do
		cp -av Fs_ALLEG-0309.png Fs_ALLEG-$i.png
	done
echo " ../ls-1_300-350r"
#read FAKE

# Typo here: below ls-1_310-350r gets No such file, because it's mistaken
# ls-1_300-350r above
# But not needed.
for i in $(<../ls-1_310-350r)
	do
		j=`echo $i-309|bc`
		perc=`echo 100000000/50*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_ALLEG-$i.png \
			-blend ${percrev}x${perc} ../transp_00_768.png Fs_ALLEG-${i}.png
	done
echo "... percrev on ls-1_310-350r Fs_ALLEG-$i, $i was last ... "
#read FAKE

cat ../ls-1_9999 | head -n1100 | tail -n50 > ../ls-1_1051-1100
for i in $(<../ls-1_1051-1100)
	do
		rm -v Fs_ALLEG-$i.png
	done
cd ../

mkdir -p Fs_black_40_fadein.d/

cp -av transp_00_1024.png black_00_1024.png Fs_black_40_fadein.d/

cd Fs_black_40_fadein.d/

cat ../ls-1_9999 | head -n40 > ../ls-1_40
for i in $(<../ls-1_40)
	do
		perc=`echo 100000000/40*$i/1000000|bc`
		echo $perc ; percrev=`echo 100-$perc|bc`; echo $percrev
		composite -define png:color-type=6 black_00_1024.png \
			-blend ${perc}x${percrev} transp_00_1024.png black_bkg-$i.png
	done
echo "... Fs_black_40_fadein.d made?..."
#read FAKE

cat ../ls-1_1050r |head -n1013 > ../ls-1_38-1050r

for i in $(<../ls-1_38-1050r)
	do
		cp -av black_bkg-0037.png black_bkg-$i.png
	done
echo "... Fs_black_40_fadein.d extended?..."
#read FAKE

cat ../ls-1_1050 | tail -n40 > ../ls-1_1011-1050
for i in $(<../ls-1_1011-1050)
	do
		cp black_bkg-1010.png black_bkg-${i}.png
	done
cd ../

mkdir -p Fs_ALLEG_on_black.d/

# Not entering in that dir here, see the command below!
#cd Fs_ALLEG_on_black.d/


echo "To do now: Fs_ALLEG_on_black.d"
	echo "Patience, the `basename $0` takes its time"

for i in $(<ls-1_1050)
	do
		composite -define png:color-type=6 Fs_ALLEG.d/Fs_ALLEG-$i.png \
			-geometry +128+0 Fs_black_40_fadein.d/black_bkg-$i.png \
			Fs_ALLEG_on_black.d/Fs_ALLEG_on_black-$i.png
	done
echo "... Is ...d/black_bkg-... OK? ..."
echo "";
echo "... Next: compositing of Flowstamp solo, then on black ..."
echo "";
#read FAKE


cat ls-1_9999 |head -n70 > ls-1_70

mkdir -p Flowstamp.d/
cp -aL LOGO_Flowstamp.png Flowstamp.d/
cd Flowstamp.d/

for i in $(<../ls-1_70)
	do
		perc=`echo 100000000/70*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${perc}x${percrev} ../transp_00_1024.png \
			Flowstamp-${i}.png
	done
echo "... Flowstamp-${i} ..."
#read FAKE

cat ../ls-1_1050r |head -n987 > ../ls-1_64-1050r

for i in $(<../ls-1_64-1050r)
	do
		cp -a Flowstamp-0063.png Flowstamp-$i.png
	done
echo "... Flowstamp-${i}, last, to ls-1_64-1050r, that's 90% opaq"
echo "to end ..."
#read FAKE

#was: TO DO later
cat ../ls-1_1050r | head -n150 | tail -n100 > ../ls-1_901-1000r
for i in $(<../ls-1_901-1000r)
	do
		j=`echo $i-900|bc`
		perc=`echo 100000000/100*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${percrev}x${perc} ../transp_00_1024.png \
			Flowstamp-${i}.png
	done
echo "... Flowstamp-${i}, $i last, fadeout at end ..."
#read FAKE
cat ../ls-1_1050 | tail -n50 > ../ls-1_1001-1050
for i in $(<../ls-1_1001-1050)
	do
		cp -a Flowstamp-1000.png Flowstamp-$i.png
	done
echo "Flowstamp-1000.png, on, last,: Flowstamp-$i.png "

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

for i in $(<../ls-1_50)
	do
		perc=`echo 100000000/50*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev ; echo
		composite -define png:color-type=6 slow2read_eh.png \
			-blend ${perc}x${percrev} ../transp_00_1024.png \
			slow2read-${i}.png
	done

for i in $(<../ls-1_50)
	do
		perc=`echo 100000000/50*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev ; echo
		composite -define png:color-type=6 slow2read_eh.png \
			-blend ${percrev}x${perc} ../transp_00_1024.png \
			slow2read-${i}_rev.png
	done

mkdir -p Later/
mv -v slow2read-????_rev.png Later/

echo "... slow2read-${i}, $i was last, rev in Later/ ..."
#read FAKE

cp -av Later/ Later.BAK/

cat ../ls-1_1050 | head -n954 > ../ls-1_954
cat ../ls-1_954 | tail -n909 > ../ls-1_46-954

for i in $(<../ls-1_46-954)
	do
		cp -av slow2read-0045.png slow2read-${i}.png
	done
echo "echo 46-954 \$i: $i"
#read FAKE

cd Later/
rm slow2read-0050_rev.png
chcase -x 's/_rev.png/.png/' slow2read-00??_rev.png
chcase -x 's/slow2read-000/slow2read-095/' slow2read-000?.png
chcase -x 's/slow2read-001/slow2read-096/' slow2read-001?.png
chcase -x 's/slow2read-002/slow2read-097/' slow2read-002?.png
chcase -x 's/slow2read-003/slow2read-098/' slow2read-003?.png
chcase -x 's/slow2read-004/slow2read-099/' slow2read-004?.png
cp -av slow2read-095[5-9].png slow2read-09[6-9]?.png ../

cd ../

echo "cp -av slow2read-015[5-9].png slow2read-09[6-9]?.png"
#read FAKE

cat ../ls-1_1050 | tail -n51 > ../ls-1_1000-1050
for i in $(<../ls-1_1000-1050)
	do
		cp -av slow2read-0999.png slow2read-${i}.png
	done
echo "The workaround promised above."
#read FAKE

cd ../

mkdir -p Fs_Flowstamp_nSlow2read.d/

for i in $(<ls-1_1050)
	do
		composite -define png:color-type=6 \
			Flowstamp.d/Flowstamp-$i.png \
			Slow2read.d/slow2read-$i.png \
			Fs_Flowstamp_nSlow2read.d/Fs_Flowstamp_nSlow2read.$i.png
	done

echo " Next: Fs_ALLEG_on_black_nLOGO.d, patience!"
#read FAKE

mkdir -p Fs_ALLEG_on_black_nLOGO.d/

# Not entering in that dir here, see the command below!
#cd Fs_ALLEG_on_black_nLOGO.d/

for i in $(<ls-1_1050)
	do
		composite -define png:color-type=6 \
			Fs_Flowstamp_nSlow2read.d/Fs_Flowstamp_nSlow2read.$i.png \
			Fs_ALLEG_on_black.d/Fs_ALLEG_on_black-$i.png \
			Fs_ALLEG_on_black_nLOGO.d/Fs_ALLEG_on_black_nLOGO-$i.png
	done
echo "... Is compositing of Flowstamp on black OK? ..."
echo "Next used to be creating the qtrle mov"
echo "But for 1920x1080, 30fps, scaling the 768x576 mov produces jittery"
echo "overlay. So 1920 have all ImageMagick convert resizing the whole"
echo "produce at this step."
#read FAKE
mv -iv Fs_ALLEG_on_black_nLOGO.d/  Fs_ALLEG_on_black_nLOGO.d_768/
mkdir -p Fs_ALLEG_on_black_nLOGO.d/
for i in $(<ls-1_1050)
	do
		convert -define png:color-type=6 -resize 1920x1080 \
			Fs_ALLEG_on_black_nLOGO.d_768/Fs_ALLEG_on_black_nLOGO-$i.png \
			Fs_ALLEG_on_black_nLOGO.d/Fs_ALLEG_on_black_nLOGO-$i.png
	done
echo "What did we get?"
#read FAKE

ffmpeg -y -framerate 30 -i Fs_ALLEG_on_black_nLOGO.d/Fs_ALLEG_on_black_nLOGO-%4d.png \
	-c qtrle -r 30 Fs_ALLEG_r30_on_black_nLOGO.mov
