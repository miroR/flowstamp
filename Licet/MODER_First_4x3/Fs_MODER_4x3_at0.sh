#!/bin/bash
#
# Fs_MODER_4x3_at0.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

ln -sf ../Auxil-contrib/ls-1_9999
ln -sf ../Auxil-contrib/LOGO_Flowstamp_4x3.png

if [ -e "Fs_4x3_at0.png" ]
	then
		if [ ! -s "Fs_4x3_at0.png" ]
		then
			echo "Fs_4x3_at0.png is there but _is_ zero size, something is"
			echo "wrong. Advice: Ctrl-C and investigate!"
		else
			echo "Fs_4x3_at0.png is there and is not zero"
		fi
	else
		if [ -e "../Auxil-contrib/Fs_4x3_at0.png" ]
		then
			ln -s ../Auxil-contrib/Fs_4x3_at0.png
		else
			mkdir -p ../Make_licet_at0/
			cp -av ../Make_licet_TXT_at0/* ../Make_licet_at0/
			cp -av ../Auxil-contrib/make_licet_at0.sh ../Make_licet_at0/
			cd ../Make_licet_at0/
			./make_licet_at0.sh East
			cd -
			cp -av ../Make_licet_at0/Fs_4x3_at0.png ../Auxil-contrib/
			ln -s ../Auxil-contrib/Fs_4x3_at0.png
		fi
fi

echo "./Fs_licet_MODER_4x3_at0.sh clutters with excessive output, silenced:"
echo "===> ./Fs_licet_MODER_4x3_at0.sh Fs_4x3_at0.png &> /dev/null"
./Fs_licet_MODER_4x3_at0.sh Fs_4x3_at0.png &> /dev/null

cd Fs_MODER_4x3_at0.d/

cat ../ls-1_9999|head -n600 > ../ls-1_600

ls -1 Fs_MODER_4x3_at0-????.png | sed 's/Fs_MODER_4x3_at0-//' | \
	sed 's/.png//' > ../ls-1_600
sort -r ../ls-1_600 > ../ls-1_600r
echo "ls-1_600r"
#read FAKE

for i in $(<../ls-1_600r)
	do
		j=`echo $i+120|bc`
		mv -v Fs_MODER_4x3_at0-$i.png Fs_MODER_4x3_at0-$j.png
	done

chcase -x 's/MODER_4x3_at0-/MODER_4x3_at0-00/' Fs_MODER_4x3_at0-??.png
chcase -x 's/MODER_4x3_at0-/MODER_4x3_at0-0/' Fs_MODER_4x3_at0-???.png

cat ../ls-1_9999|head -n120 > ../ls-1_120

for i in $(<../ls-1_120)
	do
		cp -av Fs_MODER_4x3_at0-0121.png Fs_MODER_4x3_at0-$i.png
	done

ls -1 Fs_MODER_4x3_at0-????.png | sed 's/Fs_MODER_4x3_at0-//'|sed 's/.png//' > \
	../ls-1_720

echo "... ls-1_720 ... Just get ready, next critical ... "
echo "... follows ls-1_70 fadein ... "
#read FAKE

cat ../ls-1_9999 | head -n70 >../ls-1_70
echo "... ls-1_70 there? ... "
#read FAKE

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

echo "all transp*.png created, Fs_MODER_4x3_at0-..._fadein.png next"
#read FAKE

for i in $(<../ls-1_70)
	do
		perc=`echo 100000000/70*$i/1000000|bc`
		percrev=`echo 100-$perc|bc` ; echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_MODER_4x3_at0-$i.png \
			-blend ${perc}x${percrev} ../transp_00_768.png \
			Fs_MODER_4x3_at0-${i}_fadein.png
	done

mkdir -p JIC/

for i in $(<../ls-1_70)
	do
		mv -v Fs_MODER_4x3_at0-$i.png JIC/
	done

chcase -x 's/_fadein//' Fs_MODER_4x3_at0-????_fadein.png
echo "_fadein.png renamed"
#read FAKE

cat ../ls-1_720|tail -n461 > ../ls-1_260-720
sort -r ../ls-1_260-720 >../ls-1_260-720r

for i in $(<../ls-1_260-720r)
	do
		j=`echo $i+60|bc`
		mv -v Fs_MODER_4x3_at0-${i}.png Fs_MODER_4x3_at0-$j.png
	done

chcase -x 's/MODER_4x3_at0-/MODER_4x3_at0-00/' Fs_MODER_4x3_at0-??.png
chcase -x 's/MODER_4x3_at0-/MODER_4x3_at0-0/' Fs_MODER_4x3_at0-???.png
echo "... ls-1_260-720r ... "
#read FAKE

cat ../ls-1_260-720|head -n61 > ../ls-1_260-320

for i in $(<../ls-1_260-320)
	do
		cp -av Fs_MODER_4x3_at0-0259.png Fs_MODER_4x3_at0-${i}.png
	done

ls -1 Fs_MODER_4x3_at0-????.png | \
	sed 's/Fs_MODER_4x3_at0-//'|sed 's/.png//' > ../ls-1_780
echo "... ls-1_780 ... "
#read FAKE

cat ../ls-1_780|tail -n321 > ../ls-1_460-780
sort -r ../ls-1_460-780 > ../ls-1_460-780r

for i in $(<../ls-1_460-780r)
	do
		j=`echo $i+88|bc`
		mv -v Fs_MODER_4x3_at0-${i}.png Fs_MODER_4x3_at0-$j.png
	done
echo "... ls-1_460-780r ... "
#read FAKE

chcase -x 's/MODER_4x3_at0-/MODER_4x3_at0-0/' Fs_MODER_4x3_at0-???.png

cat ../ls-1_460-780r | tail -n88 > ../ls-1_460-548

for i in $(<../ls-1_460-548)
	do
		cp -av Fs_MODER_4x3_at0-0459.png Fs_MODER_4x3_at0-${i}.png
	done

ls -1 Fs_MODER_4x3_at0-????.png | \
	sed 's/Fs_MODER_4x3_at0-//'|sed 's/.png//' > ../ls-1_868
echo "... ls-1_868 ... Now cor at -NOT-0918-q <-- that is not recollected... "
#read FAKE

# Needed any more?
#cat ../ls-1_868 | sort -r > ../ls-1_868r
#cat ../ls-1_868r | head -n321 > ../ls-1_548-868r
#cat ../ls-1_548-868r | tail -n80 > ../ls-1_548-627r

cat ../ls-1_868 | tail -n321 > ../ls-1_548-868
cat ../ls-1_548-868 | head -n20 > ../ls-1_548-567
echo "ls-1_548-587"
#read FAKE

for i in $(<../ls-1_548-567)
	do
		j=`echo $i-548|bc` perc=`echo 100000000/20*$j/1000000|bc`
		percrev=`echo 100-$perc|bc` ; echo $perc ; echo $percrev
		composite -define png:color-type=6 Fs_MODER_4x3_at0-$i.png \
			-blend ${percrev}x${perc} ../transp_00_768.png \
			Fs_MODER_4x3_at0-${i}.png
	done

# Needed here?
chcase -x 's/MODER_4x3_at0-/MODER_4x3_at0-0/' Fs_MODER_4x3_at0-???.png

cat ../ls-1_868 | tail -n301 > ../ls-1_568-868

for i in $(<../ls-1_568-868)
	do
		cp -av Fs_MODER_4x3_at0-0001.png Fs_MODER_4x3_at0-${i}.png
	done

ls -1 Fs_MODER_4x3_at0-????.png | \
	sed 's/Fs_MODER_4x3_at0-//'|sed 's/.png//' > ../ls-1_868_BIS
echo "... ls-1_868_BIS ... "
#read FAKE

cd ../

echo "";
echo "... Next: creating black ..."
echo "";
#read FAKE

mkdir -p Fs_MODER_4x3_at0_black.d/
cd Fs_MODER_4x3_at0_black.d/

convert -size 1024x576 xc:none -background transparent transp_00_1024.png
convert -size 768x576 xc:none -background transparent transp_00_768.png
convert -size 1024x576 xc:black black_00_1024.png
convert -size 768x576 xc:black black_00_768.png

cp -av transp_00_*.png ../
cp -av black_00_*.png ../

cat ../ls-1_9999 | head -n200 > ../ls-1_200

for i in $(<../ls-1_200)
	do
		perc=`echo 100000000/200*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 black_00_768.png \
			-blend ${percrev}x${perc} transp_00_768.png black_bkg-$i.png
	done

echo "... black_bkg-$i.png, the last one ..." ; #read FAKE

mkdir Later/
for i in $(<../ls-1_200)
	do
		cp -av black_bkg-$i.png Later/
	done

cat ../ls-1_9999 | head -n868 > ../ls-1_868
sort -r ../ls-1_868 > ../ls-1_868r
cat ../ls-1_868r | head -n568 > ../ls-1_201-868r

for i in $(<../ls-1_201-868r)
	do
		cp -av black_bkg-0200.png black_bkg-$i.png
	done

echo "... black_bkg-0200.png black_bkg ..." ; #read FAKE

cp -av Later/ Later.BAK
cd Later
rm black_bkg-0200.png
chcase -x 's/black_bkg-00/black_bkg-04/' black_bkg-?0??.png
chcase -x 's/black_bkg-01/black_bkg-05/' black_bkg-?1??.png
cp -av black_bkg-042[1-9].png black_bkg-04[3-9]?.png black_bkg-05??.png ../

cd ../

# Already exsists:
#cat ../ls-1_9999 | head -n868 > ../ls-1_868
cat ../ls-1_868 | head -n420 > ../ls-1_420
cat ../ls-1_420 | tail -n400 > ../ls-1_21-420

for i in $(<../ls-1_21-420)
	do
		cp -av black_bkg-0020.png black_bkg-$i.png
	done
echo "... ls-1_21-420 ..." ; #read FAKE

cd ../

#myCMNT --END-- part 2 OK: creating of black

cat ls-1_9999 |head -n100 > ls-1_100

mkdir -p Flowstamp.d/
cp -avL LOGO_Flowstamp_4x3.png Flowstamp.d/
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
		echo $perc ; echo $percrev ; echo
		composite -define png:color-type=6 LOGO_Flowstamp_4x3.png \
			-blend ${perc}x${percrev} ../transp_00_768.png \
			Flowstamp-${i}.png
	done

for i in $(<../ls-1_100)
	do
		perc=`echo 100000000/100*$i/1000000|bc`
		percrev=`echo 100-$perc|bc`
		echo $perc ; echo $percrev
		composite -define png:color-type=6 LOGO_Flowstamp_4x3.png \
			-blend ${percrev}x${perc} ../transp_00_768.png \
			Flowstamp-${i}_rev.png
	done

mkdir -p Later/
mv -v Flowstamp-????_rev.png Later/

echo "... Flowstamp-${i}, $i was last, rev in Later/ ..."
#read FAKE

cat ../ls-1_9999 | head -n868 > ../ls-1_868
cat ../ls-1_868 | sort -r ../ls-1_868r
cat ../ls-1_868r | head -n768 > ../ls-1_101-868

for i in $(<../ls-1_101-868)
	do
		cp -av Later/Flowstamp-0100_rev.png Flowstamp-${i}.png
	done
echo "echo 101-868 \$i: $i"
#read FAKE

cp -av Later/ Later.BAK/

cat ../ls-1_9999 | head -n510 > ../ls-1_510
cat ../ls-1_510 | tail -n420 > ../ls-1_91-510

for i in $(<../ls-1_91-510)
	do
		cp -av Flowstamp-0090.png Flowstamp-${i}.png
	done
echo "echo 91-510 \$i: $i"
#read FAKE

cd Later/
rm Flowstamp-0100_rev.png
chcase -x 's/_rev.png/.png/' Flowstamp-00??_rev.png
chcase -x 's/Flowstamp-00/Flowstamp-05/' Flowstamp-00??.png
cp -av Flowstamp-051[1-9].png Flowstamp-05[2-9]?.png ../

cd ../

cd ../
echo "cp -av Flowstamp-051[1-9].png Flowstamp-05[2-9]?.png"
#read FAKE

mkdir -p Fs_MODER_4x3_at0_on_black.d/

# Not entering in that dir here, see the command below!
#cd Fs_MODER_4x3_at0_on_black.d/

echo "To do now:"
echo "Fs_MODER_4x3_at0_on_black.d"

for i in $(<ls-1_868)
	do
		composite -define png:color-type=6 \
			Fs_MODER_4x3_at0.d/Fs_MODER_4x3_at0-$i.png \
			Fs_MODER_4x3_at0_black.d/black_bkg-$i.png \
			Fs_MODER_4x3_at0_on_black.d/Fs_MODER_4x3_at0_on_black-$i.png
	done

echo "... Is ...d/black_bkg-... OK? ..."

mkdir -p Fs_MODER_4x3_at0_on_black_nLOGO.d/

# Not entering in that dir here, see the command below!
#cd Fs_MODER_4x3_at0_on_black_nLOGO.d/

for i in $(<ls-1_868)
	do
		composite -define png:color-type=6 \
			Flowstamp.d/Flowstamp-$i.png \
			Fs_MODER_4x3_at0_on_black.d/Fs_MODER_4x3_at0_on_black-$i.png \
			Fs_MODER_4x3_at0_on_black_nLOGO.d/Fs_MODER_4x3_at0_on_black_nLOGO-$i.png
	done
echo "... Is compositing of Flowstamp on black OK? ..."
echo "Next is creating the qtrle mov"
#read FAKE

ffmpeg -y -i \
	Fs_MODER_4x3_at0_on_black_nLOGO.d/Fs_MODER_4x3_at0_on_black_nLOGO-%4d.png \
	-c qtrle Fs_MODER_4x3_at0_on_black_nLOGO.mov
