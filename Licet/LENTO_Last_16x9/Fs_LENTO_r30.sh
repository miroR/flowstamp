#!/bin/bash
#
# Fs_LENTO_r30.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

ln -sf ../Auxil-contrib/ls-1_9999
ln -sf ../Auxil-contrib/LOGO_Flowstamp.png

if [ -e "Fs.png" ]
	then
		if [ ! -s "Fs.png" ]
		then
			echo "Fs_at00000.png is there but _is_ zero size, something is"
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
			# not necessary any more
			#mkdir -p ../Make_licet/
			#cp -av ../Make_licet_TXT/* ../Make_licet/
			#cp -av ../Auxil-contrib/make_licet.sh ../Make_licet/
			#cd ../Make_licet/
			#./make_licet.sh
			#cd -
			#cp -av ../Make_licet/Fs.png ../Auxil-contrib/
			#ln -s ../Auxil-contrib/Fs.png
		fi
fi

echo "./Fs_licet_LENTO_r30.sh clutters with excessive output, silenced:"
echo "===> ./Fs_licet_LENTO_r30.sh Fs.png &> /dev/null"
./Fs_licet_LENTO_r30.sh Fs.png &> /dev/null

cd Fs_LENTO.d/

#There''ll be dozens of files around, most will be temp
convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

mkdir -p JIC
mkdir -p DEL

ls -1 Fs_LENTO-????.png | sed 's/Fs_LENTO-//'|sed 's/.png//' > ../ls-1_4700
echo "../ls-1_4700"
#read FAKE

sort -r ../ls-1_4700 > ../ls-1_4700r

for i in $(<../ls-1_4700r)
	do
		j=`echo $i+300|bc`; mv -iv Fs_LENTO-$i.png Fs_LENTO-$j.png
	done

chcase -x 's/LENTO-/LENTO-000/' Fs_LENTO-?.png
chcase -x 's/LENTO-/LENTO-00/' Fs_LENTO-??.png
chcase -x 's/LENTO-/LENTO-0/' Fs_LENTO-???.png
cat ../ls-1_9999 | head -n300 > ../ls-1_300
for i in $(<../ls-1_300)
	do
		cp -iav Fs_LENTO-0301.png Fs_LENTO-$i.png
	done

ls -1 Fs_LENTO-????.png | sed 's/Fs_LENTO-//'|sed 's/.png//' > ../ls-1_5000
echo "... ls-1_5000"
echo "...first 300... bad comment?, delete?"
#read FAKE

cat ../ls-1_5000 | tail -n4154 > ../ls-1_847-5000
sort -r ../ls-1_847-5000 > ../ls-1_847-5000r
echo "... ls-1_847-5000r ..."
#read FAKE

cat ../ls-1_9999 | head -n480 | tail -n180 |cat > ../ls-1_301-480
for i in $(<../ls-1_301-480)
	do
		cp -av Fs_LENTO-0481.png Fs_LENTO-$i.png
	done
echo "... ls-1_301-480 ... "
#read FAKE

cat ../ls-1_9999 |head -n320 | tail -n20 > ../ls-1_301-320
echo "... ls-1_301-320 ... "
#read FAKE

for i in $(<../ls-1_301-320)
	do
		j=`echo $i-300|bc`
		perc=`echo 100000000/20*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_LENTO-$i.png \
			-blend ${perc}x${percrev} \
			../transp_00_768.png Fs_LENTO-${i}_fadein.png
	done
echo "... percrev ... "
#read FAKE

for i in $(<../ls-1_301-320)
	do
		mv -v Fs_LENTO-$i.png DEL/
	done

for i in $(<../ls-1_301-320)
	do
		mv -v Fs_LENTO-${i}_fadein.png Fs_LENTO-$i.png
	done
echo "... fadein ... "
#read FAKE

for i in $(<../ls-1_847-5000r)
	do
		j=`echo $i+88|bc`
		mv -vi Fs_LENTO-$i.png Fs_LENTO-$j.png
	done
echo "... ls-1_847-5000r ... "
#read FAKE

cat ../ls-1_847-5000r |tail -n88 > ../ls-1_847-934r

chcase -x 's/LENTO-/LENTO-0/' Fs_LENTO-???.png

for i in $(<../ls-1_847-934r)
	do
		cp -iav Fs_LENTO-0935.png Fs_LENTO-$i.png
	done

chcase -x 's/LENTO-/LENTO-0/' Fs_LENTO-???.png
echo "... Fs_LENTO-0935.png ... "
#read FAKE

ls -1 Fs_LENTO-????.png | sed 's/Fs_LENTO-//'|sed 's/.png//' > ../ls-1_5088
echo "... ls-1_5088 ... "
#read FAKE

cat ../ls-1_5088|tail -n4006 | sort -r > ../ls-1_1083-5088r
echo "... ls-1_1083-5088r ... "
#read FAKE

for i in $(<../ls-1_1083-5088r)
	do
		j=`echo $i+88|bc` ; mv -vi Fs_LENTO-$i.png Fs_LENTO-$j.png
	done

chcase -x 's/LENTO-/LENTO-0/' Fs_LENTO-???.png

cat ../ls-1_1083-5088r|tail -n88 > ../ls-1_1083-1171

for i in $(<../ls-1_1083-1171)
	do
		cp -aiv Fs_LENTO-1172.png Fs_LENTO-$i.png
	done

chcase -x 's/LENTO-/LENTO-0/' Fs_LENTO-???.png
echo "... ls-1_1083-1171 ... "
#read FAKE

ls -1 Fs_LENTO-????.png | sed 's/Fs_LENTO-//'|sed 's/.png//' > ../ls-1_5176

cat ../ls-1_5176 | tail -n3802|sort -r > ../ls-1_1375-5176r
echo "... ls-1_1375-5176r ..."
#read FAKE

for i in $(<../ls-1_1375-5176r)
	do
		j=`echo $i+88|bc`; mv -iv Fs_LENTO-$i.png Fs_LENTO-$j.png
	done

chcase -x 's/LENTO-/LENTO-0/' Fs_LENTO-???.png

cat ../ls-1_1375-5176r|tail -n88 > ../ls-1_1375-1462

for i in $(<../ls-1_1375-1462)
	do
		cp -aiv Fs_LENTO-1463.png Fs_LENTO-$i.png
	done
echo "... ls-1_1375-1462 ..."
#read FAKE

chcase -x 's/LENTO-/LENTO-0/' Fs_LENTO-???.png

ls -1 Fs_LENTO-????.png | sed 's/Fs_LENTO-//'|sed 's/.png//' > ../ls-1_5264

cat ../ls-1_5264 | sort -r > ../ls-1_5264r

cat ../ls-1_5264r |head -n3400 > ../ls-1_1864-5264r
echo "... ls-1_1864-5264r ..."
#read FAKE

for i in $(<../ls-1_1864-5264r)
	do
		j=`echo $i+138|bc` ; mv -iv Fs_LENTO-$i.png Fs_LENTO-$j.png
	done

cat ../ls-1_1864-5264r |tail -n138 > ../ls-1_1864-2002

for i in $(<../ls-1_1864-2002)
	do
		cp -avi Fs_LENTO-2003.png Fs_LENTO-$i.png
	done
echo "... ls-1_1864-2002 ..."
#read FAKE

ls -1 Fs_LENTO-????.png | sed 's/Fs_LENTO-//'|sed 's/.png//' > ../ls-1_5402

cat ../ls-1_5402 | tail -n502 | head -n100 > ../ls-1_4901-5000
for i in $(<../ls-1_4901-5000)
	do
		j=`echo $i-4900|bc`
		perc=`echo 100000000/100*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_LENTO-$i.png \
			-blend ${percrev}x${perc} ../transp_00_768.png Fs_LENTO-${i}.png
	done
echo "... percrev on ls-1_4901-5000 Fs_LENTO-$i, $i was last ... "
#read FAKE

cat ../ls-1_5402 | tail -n402 > ../ls-1_5001-5402
for i in $(<../ls-1_5001-5402)
	do
		cp -a Fs_LENTO-5000.png Fs_LENTO-$i.png
	done
echo "Fs_LENTO-5050.png, on, last,: Fs_LENTO-$i.png "

cd ../


mkdir -p Fs_black_300_fadein.d/

cp -av transp_00_1024.png black_00_1024.png Fs_black_300_fadein.d/

cd Fs_black_300_fadein.d/

echo "... Fs_black_300_fadein.d ..."
#read FAKE

for i in $(<../ls-1_300)
	do
		perc=`echo 100000000/300*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 black_00_1024.png \
			-blend ${perc}x${percrev} transp_00_1024.png black_bkg-$i.png
	done

cat ../ls-1_9999|head -n5402 > ../ls-1_5402
sort -r ../ls-1_5402 > ../ls-1_5402r
cat ../ls-1_5402r |head -n5132 > ../ls-1_271-5402

for i in $(<../ls-1_271-5402)
	do
		cp -a black_bkg-0270.png black_bkg-$i.png
	done

chcase -x 's/black_bkg-/black_bkg-00/' black_bkg-??.png
chcase -x 's/black_bkg-/black_bkg-0/' black_bkg-???.png

cd ../

mkdir -p Fs_LENTO_on_black.d/

## Not entering in that dir here, see the command below!
##cd Fs_LENTO_on_black.d/


echo "To do now: Fs_LENTO_on_black.d"
	echo "Patience, the `basename $0` takes its time"

for i in $(<ls-1_5402)
	do
		composite -define png:color-type=6 Fs_LENTO.d/Fs_LENTO-$i.png \
			-geometry +128+0 Fs_black_300_fadein.d/black_bkg-$i.png \
			Fs_LENTO_on_black.d/Fs_LENTO_on_black-$i.png
	done
echo "... Is ...d/black_bkg-... OK? ..."
echo "";
echo "... Next: compositing of Flowstamp on black ..."
echo "";
#read FAKE


cat ls-1_9999 |head -n100 > ls-1_100

mkdir -p Flowstamp.d/
cp -aL LOGO_Flowstamp.png Flowstamp.d/
cd Flowstamp.d/

for i in $(<../ls-1_100)
	do
		perc=`echo 100000000/100*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${perc}x${percrev} ../transp_00_1024.png \
			Flowstamp-${i}.png
	done
echo "... Flowstamp-${i} ..."
#read FAKE

sort -r ../ls-1_5402 > ../ls-1_5402r
cat ../ls-1_5402r |head -n5312 > ../ls-1_91-5402

for i in $(<../ls-1_91-5402)
	do
		cp -a Flowstamp-0090.png Flowstamp-$i.png
	done
echo "... Flowstamp-${i} to 5402 ..."
#read FAKE

cat ../ls-1_5402 | tail -n452 | head -n100 > ../ls-1_4951-5050
for i in $(<../ls-1_4951-5050)
	do
		j=`echo $i-4950|bc`
		perc=`echo 100000000/100*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${percrev}x${perc} ../transp_00_1024.png \
			Flowstamp-${i}.png
	done
echo "... Flowstamp-${i}, $i last, fadeout at end ..."
#read FAKE
cat ../ls-1_5402 | tail -n352 > ../ls-1_5051-5402
for i in $(<../ls-1_5051-5402)
	do
		cp -a Flowstamp-5050.png Flowstamp-$i.png
	done
echo "Flowstamp-5050.png, on, last,: Flowstamp-$i.png "

echo " Next: Fs_LENTO_on_black_nLOGO.d, patience!"
#read FAKE

cd ../

mkdir -p Fs_LENTO_on_black_nLOGO.d/

## Not entering in that dir here, see the command below!
##cd Fs_LENTO_on_black_nLOGO.d/

for i in $(<ls-1_5402)
	do
		composite -define png:color-type=6 \
			Flowstamp.d/Flowstamp-$i.png \
			Fs_LENTO_on_black.d/Fs_LENTO_on_black-$i.png \
			Fs_LENTO_on_black_nLOGO.d/Fs_LENTO_on_black_nLOGO-$i.png
	done
echo "... Is compositing of Flowstamp on black OK? ..."
echo "Next used to be creating the qtrle mov"
echo "But for 1920x1080, 30fps, scaling the 768x576 mov produces jittery"
echo "overlay. So 1920 have all ImageMagick convert resizing the whole"
echo "produce at this step."
#read FAKE
mv -iv Fs_LENTO_on_black_nLOGO.d/  Fs_LENTO_on_black_nLOGO.d_768/
mkdir -p Fs_LENTO_on_black_nLOGO.d/
for i in $(<ls-1_5402)
	do
		convert -define png:color-type=6 -resize 1920x1080 \
			Fs_LENTO_on_black_nLOGO.d_768/Fs_LENTO_on_black_nLOGO-$i.png \
			Fs_LENTO_on_black_nLOGO.d/Fs_LENTO_on_black_nLOGO-$i.png
	done
echo "What did we get?"
#read FAKE

ffmpeg -y -framerate 30 -i \
	Fs_LENTO_on_black_nLOGO.d/Fs_LENTO_on_black_nLOGO-%4d.png \
	-c qtrle -r 30 Fs_LENTO_r30_on_black_nLOGO.mov
