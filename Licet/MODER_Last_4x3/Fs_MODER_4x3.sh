#!/bin/bash
#
# Fs_MODER_4x3.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

ln -sf ../Auxil-contrib/ls-1_9999
ln -sf ../Auxil-contrib/LOGO_Flowstamp_4x3.png

if [ -e "Fs_4x3.png" ]
	then
		if [ ! -s "Fs_4x3.png" ]
		then
			echo "Fs_at00000.png is there but _is_ zero size, something is"
			echo "wrong. Advice: Ctrl-C and investigate!"
		else
			echo "Fs_4x3.png is there and is not zero"
		fi
	else
		if [ -e "../Auxil-contrib/Fs_4x3.png" ]
		then
			ln -s ../Auxil-contrib/Fs_4x3.png
		else
			"Problems! How do I stop the script?"
			# not necessary any more
			#mkdir -p ../Make_licet/
			#cp -av ../Make_licet_TXT/* ../Make_licet/
			#cp -av ../Auxil-contrib/make_licet.sh ../Make_licet/
			#cd ../Make_licet/
			#./make_licet.sh East
			#cd -
			#cp -av ../Make_licet/Fs_4x3.png ../Auxil-contrib/
			#ln -s ../Auxil-contrib/Fs_4x3.png
		fi
fi

echo "./Fs_licet_MODER_4x3.sh clutters with excessive output, silenced:"
echo "===> ./Fs_licet_MODER_4x3.sh Fs_4x3.png &> /dev/null"
./Fs_licet_MODER_4x3.sh Fs_4x3.png &> /dev/null

cd Fs_MODER_4x3.d/

#There''ll be dozens of files around, most will be temp
convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

mkdir -p JIC
mkdir -p DEL

ls -1 Fs_MODER_4x3-????.png | sed 's/Fs_MODER_4x3-//'|sed 's/.png//' > ../ls-1_2700
echo "../ls-1_2700 marking this point, it's before ... > ../ls-1_2700r "
#read FAKE

sort -r ../ls-1_2700 > ../ls-1_2700r

for i in $(<../ls-1_2700r)
	do
		j=`echo $i+180|bc`
		mv -iv Fs_MODER_4x3-$i.png Fs_MODER_4x3-$j.png
	done

# first two not needed here, I think
#chcase -x 's/MODER_4x3-/MODER_4x3-000/' Fs_MODER_4x3-?.png
#chcase -x 's/MODER_4x3-/MODER_4x3-00/' Fs_MODER_4x3-??.png
chcase -x 's/MODER_4x3-/MODER_4x3-0/' Fs_MODER_4x3-???.png
cat ../ls-1_9999 | head -n180 > ../ls-1_180
for i in $(<../ls-1_180)
	do
		cp -iav Fs_MODER_4x3-0181.png Fs_MODER_4x3-$i.png
	done

ls -1 Fs_MODER_4x3-????.png | sed 's/Fs_MODER_4x3-//'|sed 's/.png//' > ../ls-1_2880
#read FAKE
cat ../ls-1_2880 | tail -n2605 > ../ls-1_276-2880
sort -r ../ls-1_276-2880 > ../ls-1_276-2880r
echo "... ls-1_276-2880r ..."
#read FAKE

cat ../ls-1_9999 | head -n275 | tail -n140 |cat > ../ls-1_136-275
for i in $(<../ls-1_136-275)
	do
		cp -av Fs_MODER_4x3-0276.png Fs_MODER_4x3-$i.png
	done
echo "... ls-1_136-275 ... "
##read FAKE

cat ../ls-1_9999 |head -n170 | tail -n35 > ../ls-1_136-170
echo "... ls-1_136-170 ... "
#read FAKE

for i in $(<../ls-1_136-170)
	do
		j=`echo $i-135|bc`
		perc=`echo 100000000/35*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_MODER_4x3-$i.png \
			-blend ${perc}x${percrev} ../transp_00_768.png \
			Fs_MODER_4x3-${i}_fadein.png
	done
echo "... percrev ... "
#read FAKE

for i in $(<../ls-1_136-170)
	do
		mv -v Fs_MODER_4x3-$i.png DEL/
	done

for i in $(<../ls-1_136-170)
	do
		mv -v Fs_MODER_4x3-${i}_fadein.png Fs_MODER_4x3-$i.png
	done

for i in $(<../ls-1_276-2880r)
	do
		j=`echo $i+50|bc`
		mv -vi Fs_MODER_4x3-$i.png Fs_MODER_4x3-$j.png
	done
echo "... ls-1_276-2880r ... "
##read FAKE

cat ../ls-1_276-2880r |tail -n50 > ../ls-1_276-325r

chcase -x 's/MODER_4x3-/MODER_4x3-0/' Fs_MODER_4x3-???.png

for i in $(<../ls-1_276-325r)
	do
		cp -iav Fs_MODER_4x3-0326.png Fs_MODER_4x3-$i.png
	done

chcase -x 's/MODER_4x3-/MODER_4x3-0/' Fs_MODER_4x3-???.png
echo "... Fs_MODER_4x3-0326.png ... "
##read FAKE

ls -1 Fs_MODER_4x3-????.png | sed 's/Fs_MODER_4x3-//'|sed 's/.png//' > \
	../ls-1_2930
echo "... ls-1_2930 ... "
##read FAKE

echo "Choose exact point of new shift-add-fade,in/out..."
echo "...by visual inspection at this point!"
##read FAKE
cat ../ls-1_2930|tail -n2388 | sort -r > ../ls-1_543-2930r
echo "... ls-1_543-2930r ... "
##read FAKE

for i in $(<../ls-1_543-2930r)
	do
		j=`echo $i+50|bc` ; mv -vi Fs_MODER_4x3-$i.png Fs_MODER_4x3-$j.png
	done

chcase -x 's/MODER_4x3-/MODER_4x3-0/' Fs_MODER_4x3-???.png

cat ../ls-1_543-2930r|tail -n50 > ../ls-1_543-592

for i in $(<../ls-1_543-592)
	do
		cp -aiv Fs_MODER_4x3-0542.png Fs_MODER_4x3-$i.png
	done

chcase -x 's/MODER_4x3-/MODER_4x3-0/' Fs_MODER_4x3-???.png
echo "... ls-1_543-592 ... "
##read FAKE

ls -1 Fs_MODER_4x3-????.png | sed 's/Fs_MODER_4x3-//'|sed 's/.png//' > \
	../ls-1_2980

cat ../ls-1_2980 | tail -n2256 | sort -r > ../ls-1_725-2980r
echo "... ls-1_725-2980r ..."
#read FAKE

for i in $(<../ls-1_725-2980r)
	do
		j=`echo $i+50|bc`
		mv -iv Fs_MODER_4x3-$i.png Fs_MODER_4x3-$j.png
	done

chcase -x 's/MODER_4x3-/MODER_4x3-0/' Fs_MODER_4x3-???.png

cat ../ls-1_725-2980r|tail -n50 > ../ls-1_725-774

for i in $(<../ls-1_725-774)
	do
		cp -aiv Fs_MODER_4x3-0724.png Fs_MODER_4x3-$i.png
	done
echo "... ls-1_725-774 ..."
#read FAKE

chcase -x 's/MODER_4x3-/MODER_4x3-0/' Fs_MODER_4x3-???.png

ls -1 Fs_MODER_4x3-????.png | sed 's/Fs_MODER_4x3-//'|sed 's/.png//' > \
	../ls-1_3030

cat ../ls-1_3030 | sort -r > ../ls-1_3030r

cat ../ls-1_3030r |head -n2051 > ../ls-1_980-3030r
echo "... ls-1_980-3030r ..."
#read FAKE

for i in $(<../ls-1_980-3030r)
	do
		j=`echo $i+100|bc` ; mv -iv Fs_MODER_4x3-$i.png Fs_MODER_4x3-$j.png
	done

cat ../ls-1_980-3030r |tail -n100 > ../ls-1_980-1079

for i in $(<../ls-1_980-1079)
	do
		cp -avi Fs_MODER_4x3-0979.png Fs_MODER_4x3-$i.png
	done
echo "... ls-1_980-1079 ..."
echo "Choose exact point of new shift-add-fade,in/out..."
echo "...by visual inspection at this point!"
ls -1 Fs_MODER_4x3-????.png | sed 's/Fs_MODER_4x3-//'|sed 's/.png//' > ../ls-1_3130

# was: TO DO later!
cat ../ls-1_3130 | head -n2620 | tail -n70 > ../ls-1_2551-2620
echo " ../ls-1_2551-2620 "
#read FAKE
for i in $(<../ls-1_2551-2620)
	do
		j=`echo $i-2550|bc`
		perc=`echo 100000000/70*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_MODER_4x3-$i.png \
		-blend ${percrev}x${perc} ../transp_00_768.png Fs_MODER_4x3-${i}.png
	done
echo "... percrev on ls-1_2551-2620 Fs_MODER_4x3-$i, $i was last ... "
#read FAKE

cd ../

mkdir -p Fs_black_180_fadein.d/

cp -av transp_00_768.png black_00_768.png Fs_black_180_fadein.d/

cd Fs_black_180_fadein.d/

echo "... Fs_black_180_fadein.d ..."
#read FAKE

for i in $(<../ls-1_180)
	do
		perc=`echo 100000000/180*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 black_00_768.png \
			-blend ${perc}x${percrev} transp_00_768.png black_bkg-$i.png
	done

cat ../ls-1_9999|head -n3130 > ../ls-1_3130
sort -r ../ls-1_3130 > ../ls-1_3130r
cat ../ls-1_3130r |head -n2968 > ../ls-1_163-3130r

for i in $(<../ls-1_163-3130r)
	do
		cp -a black_bkg-0162.png black_bkg-$i.png
	done

chcase -x 's/black_bkg-/black_bkg-00/' black_bkg-??.png
chcase -x 's/black_bkg-/black_bkg-0/' black_bkg-???.png

cd ../

mkdir -p Fs_MODER_4x3_on_black.d/

## Not entering in that dir here, see the command below!
##cd Fs_MODER_4x3_on_black.d/


echo "To do now: Fs_MODER_4x3_on_black.d"
	echo "Patience, the `basename $0` takes its time"

for i in $(<ls-1_3130)
	do
		composite -define png:color-type=6 Fs_MODER_4x3.d/Fs_MODER_4x3-$i.png \
			Fs_black_180_fadein.d/black_bkg-$i.png \
			Fs_MODER_4x3_on_black.d/Fs_MODER_4x3_on_black-$i.png
	done
echo "... Is ...d/black_bkg-... OK? ..."
echo "";
echo "... Next: compositing of Flowstamp solo, then on black ..."
echo "";
#read FAKE


cat ls-1_9999 |head -n70 > ls-1_70

mkdir -p Flowstamp.d/
cp -aL LOGO_Flowstamp_4x3.png Flowstamp.d/
cd Flowstamp.d/

for i in $(<../ls-1_70)
	do
		perc=`echo 100000000/70*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp_4x3.png \
		-blend ${perc}x${percrev} ../transp_00_768.png Flowstamp-${i}.png
	done
echo "... Flowstamp-${i} ..."
#read FAKE

sort -r ../ls-1_3130 > ../ls-1_3130r
cat ../ls-1_3130r |head -n3060 > ../ls-1_71-3130

for i in $(<../ls-1_71-3130)
	do
		cp -a Flowstamp-0070.png Flowstamp-$i.png
	done
echo "... Flowstamp-${i} to 3130 ..."
#read FAKE

cat ../ls-1_3130 | tail -n580 | head -n100 > ../ls-1_2551-2650
for i in $(<../ls-1_2551-2650)
	do
		j=`echo $i-2550|bc`
		perc=`echo 100000000/100*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp_4x3.png \
			-blend ${percrev}x${perc} ../transp_00_768.png \
			Flowstamp-${i}.png
	done
echo "... Flowstamp-${i}, $i last, fadeout at end ..."
#read FAKE
cat ../ls-1_3130 | tail -n480 > ../ls-1_2651-3130
for i in $(<../ls-1_2651-3130)
	do
		cp -a Flowstamp-2650.png Flowstamp-$i.png
	done
echo "Flowstamp-5050.png, on, last,: Flowstamp-$i.png "

echo " Next: Fs_MODER_4x3_on_black_nLOGO.d, patience!"
#read FAKE

cd ../

mkdir -p Fs_MODER_4x3_on_black_nLOGO.d/

for i in $(<ls-1_3130)
	do
		composite -define png:color-type=6 \
			Flowstamp.d/Flowstamp-$i.png \
			Fs_MODER_4x3_on_black.d/Fs_MODER_4x3_on_black-$i.png \
			Fs_MODER_4x3_on_black_nLOGO.d/Fs_MODER_4x3_on_black_nLOGO-$i.png
	done
#read FAKE

ffmpeg -y -i \
	Fs_MODER_4x3_on_black_nLOGO.d/Fs_MODER_4x3_on_black_nLOGO-%4d.png \
	-c qtrle Fs_MODER_4x3_on_black_nLOGO.mov
