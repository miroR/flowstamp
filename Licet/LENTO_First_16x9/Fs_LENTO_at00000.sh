#!/bin/bash
#
# Fs_LENTO_at00000.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

ln -sf ../Auxil-contrib/ls-1_9999
ln -sf ../Auxil-contrib/LOGO_Flowstamp.png

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
			./make_licet_at0.sh
			cd -
			cp -av ../Make_licet_at0/Fs_at00000.png ../Auxil-contrib/
			ln -s ../Auxil-contrib/Fs_at00000.png
		fi
fi

echo "./Fs_licet_LENTO_at00000.sh clutters with excessive output, silenced:"
echo "===> ./Fs_licet_LENTO_at00000.sh Fs_at00000.png &> /dev/null"
./Fs_licet_LENTO_at00000.sh Fs_at00000.png &> /dev/null

cd Fs_LENTO_at0.d/

cat ../ls-1_9999|head -n900 > ../ls-1_900

ls -1 Fs_LENTO_at0-????.png | sed 's/Fs_LENTO_at0-//'|sed 's/.png//' > \
	../ls-1_900
sort -r ../ls-1_900 > ../ls-1_900r
echo "ls-1_900r"
#read FAKE

for i in $(<../ls-1_900r)
	do
		j=`echo $i+200|bc`
		mv -v Fs_LENTO_at0-$i.png Fs_LENTO_at0-$j.png
	done

chcase -x 's/LENTO_at0-/LENTO_at0-00/' Fs_LENTO_at0-??.png
chcase -x 's/LENTO_at0-/LENTO_at0-0/' Fs_LENTO_at0-???.png

cat ../ls-1_9999|head -n200 > ../ls-1_200

for i in $(<../ls-1_200)
	do
		cp -av Fs_LENTO_at0-0201.png Fs_LENTO_at0-$i.png
	done

ls -1 Fs_LENTO_at0-????.png | sed 's/Fs_LENTO_at0-//'|sed 's/.png//' > \
	../ls-1_1100

echo "... ls-1_1100 ... Just get ready, next critical ... "
#read FAKE

echo "... follows ls-1_100 fadein ... "
#read FAKE

cat ../ls-1_9999 | head -n100 >../ls-1_100
echo "... ls-1_100 there? ... "
#read FAKE

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

echo "all transp*.png created, Fs_LENTO_at0-..._fadein.png next"
#read FAKE

for i in $(<../ls-1_100)
	do
		perc=`echo 100000000/100*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_LENTO_at0-$i.png \
			-blend ${perc}x${percrev} ../transp_00_768.png \
			Fs_LENTO_at0-${i}_fadein.png
	done

mkdir -p JIC/

for i in $(<../ls-1_100)
	do
		mv -v Fs_LENTO_at0-$i.png JIC/
	done

chcase -x 's/_fadein//' Fs_LENTO_at0-????_fadein.png
echo "_fadein.png renamed"
#read FAKE

cat ../ls-1_1100|tail -n772 > ../ls-1_329-1100
sort -r ../ls-1_329-1100 >../ls-1_329-1100r

for i in $(<../ls-1_329-1100r)
	do
		j=`echo $i+88|bc`
		mv -v Fs_LENTO_at0-${i}.png Fs_LENTO_at0-$j.png
	done
echo "... ls-1_329-1100r ... "
##read FAKE

chcase -x 's/LENTO_at0-/LENTO_at0-00/' Fs_LENTO_at0-??.png
chcase -x 's/LENTO_at0-/LENTO_at0-0/' Fs_LENTO_at0-???.png

cat ../ls-1_329-1100|head -n88 > ../ls-1_329-416

for i in $(<../ls-1_329-416)
	do
		cp -av Fs_LENTO_at0-0417.png Fs_LENTO_at0-${i}.png
	done

ls -1 Fs_LENTO_at0-????.png | sed 's/Fs_LENTO_at0-//'|sed 's/.png//' > \
	../ls-1_1188
echo "... ls-1_1188 ... "
##read FAKE

cat ../ls-1_1188|tail -n622 > ../ls-1_567-1188
sort -r ../ls-1_567-1188 > ../ls-1_567-1188r

for i in $(<../ls-1_567-1188r)
	do
		j=`echo $i+88|bc`
		mv -v Fs_LENTO_at0-${i}.png Fs_LENTO_at0-$j.png
	done
echo "... ls-1_567-1188r ... "
#read FAKE

chcase -x 's/LENTO_at0-/LENTO_at0-0/' Fs_LENTO_at0-???.png

cat ../ls-1_567-1188r | tail -n88 > ../ls-1_567-654

for i in $(<../ls-1_567-654)
	do
		cp -av Fs_LENTO_at0-0655.png Fs_LENTO_at0-${i}.png
	done

ls -1 Fs_LENTO_at0-????.png | sed 's/Fs_LENTO_at0-//'|sed 's/.png//' > \
	../ls-1_1276
echo "... ls-1_1276 ... Now cor at -0918 "
#read FAKE

cat ../ls-1_1276 | sort -r > ../ls-1_1276r
cat ../ls-1_1276r | head -n358 > ../ls-1_919-1276r
cat ../ls-1_9999 | head -n1006 > ../ls-1_1006
cat ../ls-1_1006 | sort -r > ../ls-1_1006r
cat ../ls-1_1006r | head -n88 > ../ls-1_919-1006r

for i in $(<../ls-1_919-1276r)
	do
		j=`echo $i+88|bc`
		mv -v Fs_LENTO_at0-$i.png Fs_LENTO_at0-$j.png
	done

chcase -x 's/LENTO_at0-/LENTO_at0-0/' Fs_LENTO_at0-???.png

ls -1 Fs_LENTO_at0-????.png | sed 's/Fs_LENTO_at0-//'|sed 's/.png//' > \
	../ls-1_1364
echo "... ls-1_1364 is now max ... We'll add, later, 12 to make measure. "
#read FAKE

for i in $(<../ls-1_919-1006r)
	do
		cp -av Fs_LENTO_at0-0918.png Fs_LENTO_at0-${i}.png
	done

chcase -x 's/LENTO_at0-/LENTO_at0-0/' Fs_LENTO_at0-???.png

cat ../ls-1_9999 | head -n1364 > ../ls-1_1364
cat ../ls-1_1364 | tail -n358 > ../ls-1_1007-1364
cat ../ls-1_1007-1364 | head -n150 > ../ls-1_1007-1156
for i in $(<../ls-1_1007-1156)
	do
		j=`echo $i-1006|bc`
		perc=`echo 100000000/150*$j/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_LENTO_at0-$i.png \
			-blend ${percrev}x${perc} ../transp_00_768.png \
			Fs_LENTO_at0-${i}.png
	done

cat ../ls-1_9999 | head -n1376 |tail -n12 > ../ls-1_1365-1376

for i in $(<../ls-1_1365-1376)
	do
		cp -av Fs_LENTO_at0-1364.png Fs_LENTO_at0-${i}.png
	done

ls -1 Fs_LENTO_at0-????.png | sed 's/Fs_LENTO_at0-//'|sed 's/.png//' > \
	../ls-1_1376

cat ../ls-1_1376 | tail -n220 > ../ls-1_1157-1376
for i in $(<../ls-1_1157-1376)
	do
		cp -av Fs_LENTO_at0-1156.png Fs_LENTO_at0-${i}.png
	done

cd ../

echo "... ls-1_1376 ... "
#read FAKE
#myCMNT part 2 OK: creating black

echo "";
echo "... Next: creating black ..."
echo "";
#read FAKE

mkdir -p Fs_LENTO_at0_black.d/
cd Fs_LENTO_at0_black.d/

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

cat ../ls-1_9999 | head -n300 > ../ls-1_300

for i in $(<../ls-1_300)
	do
		perc=`echo 100000000/300*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 black_00_1024.png \
			-blend ${percrev}x${perc} transp_00_1024.png black_bkg-$i.png
	done

echo "... tmp ..." ;
#read FAKE

mkdir Later/
for i in $(<../ls-1_300)
	do
		cp -av black_bkg-$i.png Later/
	done

cat ../ls-1_9999 | head -n1376 > ../ls-1_1376
sort -r ../ls-1_1376 > ../ls-1_1376r
cat ../ls-1_1376r | head -n1076 > ../ls-1_301-1376r

for i in $(<../ls-1_301-1376r)
	do
		cp -av black_bkg-0300.png black_bkg-$i.png
	done

echo "... black_bkg-0300.png black_bkg ..." ;
#read FAKE

cp -av Later/ Later.BAK
cd Later
rm black_bkg-0300.png
chcase -x 's/black_bkg-00/black_bkg-07/' black_bkg-?0??.png
chcase -x 's/black_bkg-01/black_bkg-08/' black_bkg-?1??.png
chcase -x 's/black_bkg-02/black_bkg-09/' black_bkg-?2??.png
cp -av black_bkg-077[1-9].png black_bkg-07[89]?.png black_bkg-?[89]??.png ../

cd ../

cat ../ls-1_9999 | head -n770 > ../ls-1_770
cat ../ls-1_770 | tail -n700 > ../ls-1_71-770

for i in $(<../ls-1_71-770)
	do
		cp -av black_bkg-0070.png black_bkg-$i.png
	done

cd ../

#myCMNT --END-- part 2 OK: creating of black

cat ls-1_9999 |head -n100 > ls-1_100

mkdir -p Flowstamp.d/
cp -avL LOGO_Flowstamp.png Flowstamp.d/
cd Flowstamp.d/

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

for i in $(<../ls-1_100)
	do
		perc=`echo 100000000/100*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${perc}x${percrev} ../transp_00_1024.png \
			LOGO_Flowstamp-${i}.png
	done

for i in $(<../ls-1_100)
	do
		perc=`echo 100000000/100*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp.png \
			-blend ${percrev}x${perc} ../transp_00_1024.png \
			LOGO_Flowstamp-${i}_rev.png
	done

mkdir -p Later/
mv -v LOGO_Flowstamp-????_rev.png Later/

echo "... LOGO_Flowstamp-${i}, $i was last, rev in Later/ ..."
#read FAKE

cat ../ls-1_9999 | head -n1376 > ../ls-1_1376
cat ../ls-1_1376 | sort -r ../ls-1_1376r
cat ../ls-1_1376r | head -n1276 > ../ls-1_101-1376

for i in $(<../ls-1_101-1376)
	do
		cp -av Later/LOGO_Flowstamp-0100_rev.png \
			LOGO_Flowstamp-${i}.png
	done
echo "echo 101-1376 \$i: $i"
#read FAKE

cp -av Later/ Later.BAK/

cat ../ls-1_9999 | head -n1110 > ../ls-1_1110
cat ../ls-1_1110 | tail -n1020 > ../ls-1_91-1110

for i in $(<../ls-1_91-1110)
	do
		cp -av LOGO_Flowstamp-0090.png LOGO_Flowstamp-${i}.png
	done
echo "echo 91-1110 \$i: $i"
#read FAKE

cd Later/
rm LOGO_Flowstamp-0100_rev.png
chcase -x 's/_rev.png/.png/' LOGO_Flowstamp-00??_rev.png
chcase -x 's/LOGO_Flowstamp-00/LOGO_Flowstamp-11/' \
	LOGO_Flowstamp-00??.png
cp -av LOGO_Flowstamp-111[1-9].png LOGO_Flowstamp-11[2-9]?.png ../

cd ../

cd ../

mkdir -p Fs_LENTO_at0_on_black.d/

# Not entering in that dir here, see the command below!
#cd Fs_LENTO_at0_on_black.d/

echo "To do now:"
echo "Fs_LENTO_at0_on_black.d"

for i in $(<ls-1_1376)
	do
		composite -define png:color-type=6 Fs_LENTO_at0.d/Fs_LENTO_at0-$i.png \
			-geometry +128+0 Fs_LENTO_at0_black.d/black_bkg-$i.png \
			Fs_LENTO_at0_on_black.d/Fs_LENTO_at0_on_black-$i.png
	done

echo "... Is ...d/black_bkg-... OK? ..."

echo "To do now:"
echo "Fs_LENTO_at0_on_black_nLOGO.d"

mkdir -p Fs_LENTO_at0_on_black_nLOGO.d/

# Not entering in that dir here, see the command below!
#cd Fs_LENTO_at0_on_black_nLOGO.d/

for i in $(<ls-1_1376)
	do
		composite -define png:color-type=6 \
			Flowstamp.d/LOGO_Flowstamp-$i.png \
			Fs_LENTO_at0_on_black.d/Fs_LENTO_at0_on_black-$i.png \
			Fs_LENTO_at0_on_black_nLOGO.d/Fs_LENTO_at0_on_black_nLOGO-$i.png
	done
echo "... Is compositing of Flowstamp on black OK? ..."
echo "Next is creating the qtrle mov"
#read FAKE

ffmpeg -y -i \
	Fs_LENTO_at0_on_black_nLOGO.d/Fs_LENTO_at0_on_black_nLOGO-%4d.png \
	-c qtrle Fs_LENTO_at0_on_black_nLOGO.mov
