#!/bin/bash
#
# Cut4Licet.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

echo $(basename $0) point 0 ; pwd
#read FAKE
if [ ! -e "$fSlog" ] ; then
	touch $fSlog
	echo \$fSlog: ; echo $fSlog
	echo "ls -l \$fSlog:"
	ls -l $fSlog
else
	echo -n \$fSlog: echo $fSlog
	ls -l $fSlog
fi
# (Un)comment (out) up to four lines if you (don't) want/need to inspect
# previous runs
#rm -rf DEL.oldPREV1/
#mv -v DEL.oldPREV/ DEL.oldPREV1/
#rm -rf DEL.oldPREV/
#mv -v DEL.old/ DEL.oldPREV/
mv -v DEL/ DEL.old/
mkdir -p DEL/
mv -v ALLEG_4x3/ MODER_4x3/ LENTO_4x3/ ALLEG_16x9/ MODER_16x9/ LENTO_16x9/ DEL/
echo "Old temps, which were before previous, deleted, previous temps now in DEL/."
# Comment (out) one line if you keep or don't the previous runs for longer
#echo "and old (and older: PREV1) previous still there."
echo ""
mkdir -pv ALLEG_4x3 MODER_4x3 LENTO_4x3 ALLEG_16x9 MODER_16x9 LENTO_16x9
echo $(basename $0) point 01
#read FAKE
if [ -e "Auxil-contrib/Fs.png" ]
	then
		if [ ! -s "Auxil-contrib/Fs.png" ]
		then
			echo "Fs.png is there but _is_ zero size, something is wrong."
			echo "Advice: Ctrl-C and investigate!"
		else
			echo "Fs.png is there and is not size zero."
			ln -s Auxil-contrib/Fs.png
		fi
   echo $(basename $0) point 02
   #read FAKE
   else if [ -e "Make_licet_TXT/Licet_prep.sh" ] ; then
		echo $(basename $0) point 021
		#read FAKE
		# Else it logs into a $fSlog created in that dir
		cd Make_licet_TXT_at0/
		pwd
		ln -s ../$fSlog
		ls -l ../$fSlog $fSlog
		cd -
		cd Make_licet_TXT/
		pwd
		ln -s ../$fSlog
		ls -l ../$fSlog $fSlog
		ln -s ../../flowstamp_HR_U_demo.txt flowstamp_HR_U_demo.txt
		ls -l ../../flowstamp_HR_U_demo.txt flowstamp_HR_U_demo.txt
		echo "./Licet_prep.sh flowstamp_HR_U_demo.txt "lost the honest and knowledgeable" &> /dev/null"
		./Licet_prep.sh flowstamp_HR_U_demo.txt "lost the honest and knowledgeable" &> /dev/null
		echo "===> ./make_licet.sh &> /dev/null"
		./make_licet.sh &> /dev/null
		mv -iv Fs.png Fs.png_TMP
		echo "===> ./make_licet.sh East &> /dev/null"
		./make_licet.sh East &> /dev/null
			mv -iv Fs.png_TMP Fs.png
		echo $(basename $0) point 03
		#read FAKE
		else
			# Else it logs into a $fSlog created in that dir
			cd Make_licet_TXT_at0/
			pwd
			ln -s ../$fSlog
			ls -l ../$fSlog $fSlog
			cd -
			cd Make_licet_TXT/
			ln -s ../$fSlog
			ls -l ../$fSlog $fSlog
			pwd
		echo "===> ./make_licet.sh &> /dev/null"
		./make_licet.sh &> /dev/null
			mv -iv Fs.png Fs.png_TMP
			echo "===> ./make_licet.sh East &> /dev/null"
			./make_licet.sh East &> /dev/null
			mv -iv Fs.png_TMP Fs.png

		echo $(basename $0) point 04
		#read FAKE
	fi
fi
#cd -
echo $(basename $0) point 05 ; pwd ; echo "PROBLEM: \"./Cut4Licet.sh: line 104: cd: OLDPWD not set. Without?\""
#read FAKE
# Else it logs into a $fSlog created in that dir
cd Auxil-contrib/ ;
ln -s ../$fSlog
ls -l ../$fSlog $fSlog
cd -
cd Cut4Licet.d/ ;
ln -s ../$fSlog
ls -l ../$fSlog $fSlog

j=${i}_fs
echo \$j: $j

	echo $(basename $0) point 051 ; pwd
	#read FAKE
	echo "###	See the flowstamp script (the main script). The:"
	echo "###	wid=\$(<stream.width)"
	echo "###	hei=\$(<stream.height)"
	echo "###	sar=\$(<stream.sample_aspect_ratio)"
	echo "###	dar=\$(<stream.display_aspect_ratio)"
	echo "###	rate=\$(<stream.r_frame_rate)"
	echo "###	len=\$(<format.duration)"
	echo "###	need all be recalcualted, because we're manipulating the flowstamped"
	echo "###	video, ${j}.mkv, not the (usually)"
	echo "###	original we started from, ${i},mkv"
	echo "###	"
	for s in $(echo width height sample_aspect_ratio display_aspect_ratio r_frame_rate) ;
		do ffprobe -v panic -of default=nw=1:nk=1 -select_streams v:0 \
			-show_entries stream=$s $j.mkv > stream.$s ;
		done ;
	ffprobe -v panic -of default=nw=1:nk=1 \
		-show_entries format=duration $j.mkv > format.duration
	wid=$(<stream.width)
	hei=$(<stream.height)
	sar=$(<stream.sample_aspect_ratio)
	dar=$(<stream.display_aspect_ratio)
	rate=$(<stream.r_frame_rate)
	len=$(<format.duration)
echo \$wid: $wid |& tee -a $fSlog
export wid
echo |& tee -a $fSlog

echo \$hei: $hei |& tee -a $fSlog
export hei
echo |& tee -a $fSlog

echo \$sar: $sar |& tee -a $fSlog
export sar
echo |& tee -a $fSlog

echo \$dar: $dar |& tee -a $fSlog
export dar
echo |& tee -a $fSlog

echo \$rate: $rate |& tee -a $fSlog
export rate
echo |& tee -a $fSlog

echo \$len: $len |& tee -a $fSlog
export len
echo |& tee -a $fSlog

echo $(basename $0) point 06
#read FAKE
if [ "$dar" == "16:9" ] ; then
	echo "1.7778" > $j.asp
else if [ "$dar" == "4:3" ] ; then
	echo "1.3333" > $j.asp
	fi
fi
echo $j.mkv: $(cat $j.asp) ;

j_asp_cut=`cat $j.asp|cut -d '.' -f 2`
echo -n \$j_asp_cut: ; echo $j_asp_cut

case "$rate" in
	"25/1" )
		echo "25" > $j.fps
	;;

	"30/1" )
		echo "30" > $j.fps
	;;

	"50/1" )
		echo "50" > $j.fps
	;;

	* )
		echo "echo \"$(basename $0)\": Your video is of rate $r but"
		echo "anything other than 25/1 30/1 and 50/1 is not currently supported"
		echo "out of the box."
		echo "But some other rates will be supported when I will need them,"
		echo "and find time. Or if you, the contributor, or this project forker,"
		echo "or even this program rewriter (in some other programming language),"
		echo "[or if you] do it."
		echo "Actually all the rates listed in [open it to see]"
		echo "'man ffmpeg-all', under 'Video rate' should be supported"
		echo "some day by this program... And also all the sizes listed under"
		echo "'Video size' should be supported... Some day..."
	;;
esac
echo $(basename $0) point 07
#read FAKE

r=$(cat $j.fps | cut -d'/' -f1)
echo \$r:
echo $r

echo $len | cut -d '.' -f 1 > $j.leni
echo "\$j.leni ([len]gth [i]nteger only):"
cat $j.leni

mkdir -p Fs_4m+/
cd Fs_4m+/
ln -s ../../$fSlog
ls -l ../../$fSlog $fSlog
cd -
mkdir -p Fs_40m-/
cd Fs_40m-/
ln -s ../../$fSlog
ls -l ../../$fSlog $fSlog
cd -
mkdir -p Fs_40m+/
cd Fs_40m+/
ln -s ../../$fSlog
ls -l ../../$fSlog $fSlog
cd -
mkdir -p Fs_4m-/
cd Fs_4m-/
ln -s ../../$fSlog
ls -l ../../$fSlog $fSlog
cd -
echo $(basename $0) point 08
#read FAKE
echo "###	"
echo "###	The values currently hardcoded into this program (but which, with"
echo "###	proper understanding of the script, can be changed) are 240 and 2400,"
echo "###	which stand for seconds of the video duration."
echo "###	The outer if condition here sends the video different ways if longer"
echo "###	than 4 minutes, or shorter then so long."
echo "###	"
if [ $(<$j.leni) -gt 240 ] ; then
	echo "\$j.leni:"
	echo $j.leni ; cat $j.leni
	echo "\$j.leni must be greater than 240s."
	cd Fs_4m+/
	echo " ln -s ../$j.mkv ; ln -s ../$j.leni "
	ln -s ../$j.mkv ; ln -s ../$j.leni

	echo $(basename $0) point 09
	#read FAKE
	echo "###	"
	echo "###	The first inner if condition here sorts the video if longer"
	echo "###	or shorter than 40 minutes (2400s)."
	echo "###	"
	if [ $(<$j.leni) -gt 2400 ] ; then
		echo "\$j.leni:"
		echo $j.leni ; cat $j.leni
		echo "\$j.leni greater than 2400s."
		cd ../Fs_40m+/
		ln -s ../$j.mkv ; ln -s ../$j.leni
		thecut_s1=`echo $(<${j}.leni)-27|bc`;
		echo "\$thecut_s1 (27s before end, for 40m+):"
		echo $thecut_s1
		echo "mkvmerge -o ${j}_.mkv --split timecodes:10s,`echo $thecut_s1`s \
			$j.mkv"
		mkvmerge -o ${j}_.mkv --split timecodes:10s,`echo $thecut_s1`s \
			$j.mkv
		echo "midentify ${j}_-003.mkv|grep LENG|cut -d '=' -f 2| \
			cut -d '.' -f 1 > ${j}_-003.leni"
		midentify ${j}_-003.mkv|grep LENG|cut -d '=' -f 2| \
			cut -d '.' -f 1 > ${j}_-003.leni
		mkdir ${j}_-001.d
		echo "ffmpeg -i ${j}_-001.mkv -f image2 ${j}_-001.d/$j-%3d.png"
		ffmpeg -i ${j}_-001.mkv -f image2 ${j}_-001.d/$j-%3d.png
		cd ${j}_-001.d
		ls -1 *.png | head -n1 > first_shot.ls-1
		cp -av `cat first_shot.ls-1` ../
		mv -v first_shot.ls-1 ../
		echo $(basename $0) point 0A
		#read FAKE
		cd ../
		cat first_shot.ls-1|sed 's/_fs-[0-9][0-9][0-9]/_fs-first/' > \
			first_shot.ren
		cp -av `cat first_shot.ls-1` `cat first_shot.ren`
		ls -l $j-first.png
		#echo "Now display \$j-first_png"
		display $j-first.png & pid=$! ; sleep 3 ; kill $pid
		echo $(basename $0) point 0B
		#read FAKE
		rm -rf ${j}_-001.d

		echo \${j}_-003.leni:
		echo ${j}_-003.leni
		thecut_s2=`echo $(<${j}_-003.leni)-14|bc`;
		echo "\$thecut_s2 (14s for the last 27s):"
		echo $thecut_s2

		echo "mkvmerge -o ${j}_-003_.mkv --split timecodes:`echo $thecut_s2`s \
			${j}_-003.mkv"
		mkvmerge -o ${j}_-003_.mkv --split timecodes:`echo $thecut_s2`s \
			${j}_-003.mkv
		mkdir ${j}_-003_-002.d
		echo "ffmpeg -i ${j}_-003_-002.mkv -f image2 ${j}_-003_-002.d/$j-%3d.png"
		ffmpeg -i ${j}_-003_-002.mkv -f image2 ${j}_-003_-002.d/$j-%3d.png
		cd ${j}_-003_-002.d
		ls -1 *.png | tail -n1 > last_shot.ls-1
		cp -av `cat last_shot.ls-1` ../
		mv -v last_shot.ls-1 ../
		cd ../
		cat last_shot.ls-1|sed 's/_fs-[0-9][0-9][0-9]/_fs-last/' > \
			last_shot.ren
		cp -av `cat last_shot.ls-1` `cat last_shot.ren`
		#echo "Now display \$j-last_png"
		display $j-last.png & pid=$! ; sleep 3 ; kill $pid
		rm -rf ${j}_-003_-002.d
		rm -v ${j}.mkv ${j}.leni ${j}_-003.leni ${j}_-003.mkv ${j}-???.png
		echo $(basename $0) point 0C
		#read FAKE
		cd ../

		echo $(basename $0) point 0D
		#read FAKE
		case "$j_asp_cut" in
			3333 )
				if [ -e "../Auxil-contrib/EMPTY_20s_AV_1333.mkv" ]
					then
						ln -s ../Auxil-contrib/EMPTY_20s_AV_1333.mkv
				fi
				echo $(basename $0) point 0E
				#read FAKE
				case "$r" in
					25 )
						EMPTY_38s=EMPTY_38s_AV_1333.mkv
						EMPTY_190s=EMPTY_190s_AV_1333.mkv
					;;

					30 )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;

					50 )
						EMPTY_38s=EMPTY_38s_AVr50_1333.mkv
						EMPTY_190s=EMPTY_190s_AVr50_1333.mkv
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;
				esac

				echo \$EMPTY_38s: $EMPTY_38s
				echo \$EMPTY_190s: $EMPTY_190s

				echo $(basename $0) point 0F
				#read FAKE
				mv -v Fs_40m+/${j}_-001.mkv Fs_40m+/${j}_-002.mkv \
					Fs_40m+/${j}_-003_-001.mkv \
					Fs_40m+/${j}_-003_-002.mkv Fs_40m+/${j}-first.png \
					Fs_40m+/${j}-last.png ../LENTO_4x3
				echo $(basename $0) point 0G
				#read FAKE
				cd ../LENTO_4x3
				ln -s ../$fSlog
				ls -l ../$fSlog $fSlog
				echo $(basename $0) point 0H
				#read FAKE
				if [ -e "../Auxil-contrib/$EMPTY_38s" ]
					then
						ln -s ../Auxil-contrib/$EMPTY_38s
					else
						../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r
						mv -v $EMPTY_38s ../Auxil-contrib/
						ln -s ../Auxil-contrib/$EMPTY_38s
				fi
				echo $(basename $0) point 0I
				#read FAKE
				if [ -e "../Auxil-contrib/$EMPTY_190s" ]
					then
						ln -s ../Auxil-contrib/$EMPTY_190s
					echo $(basename $0) point 0J
					#read FAKE
					else
						../Auxil-contrib/make_empty_mkv.sh 190 $j_asp_cut $wid $r
						mv -v $EMPTY_190s ../Auxil-contrib/
						ln -s ../Auxil-contrib/$EMPTY_190s
				echo $(basename $0) point 0K
				#read FAKE
				fi
				echo "We're in \$j.leni gt 2400, we should be in LENTO_4x3 dir"
				ln -s $EMPTY_38s $j-first.mkv ;
				echo "ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-first_4CAT.mkv"
				ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-first_4CAT.mkv
				ln -s $EMPTY_190s $j-last.mkv ;
				echo "ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-last_4CAT.mkv"
				ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-last_4CAT.mkv
				echo $(basename $0) point 0L
				#read FAKE
				cd -
				cd ../LENTO_4x3 ;
				ln -s ../$fSlog
				ls -l ../$fSlog $fSlog
				echo pwd: ; pwd
				echo "$j.leni, seems gt 2400, dir LENTO_4x3"
				mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
				ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
				echo "for j in `cat lsV`; do
					../Auxil-contrib/Fs_filter_complex.sh \
					$j-first_4CAT.mkv ${j}_-001.mkv"
				for j in `cat lsV`; do
					../Auxil-contrib/Fs_filter_complex.sh \
					$j-first_4CAT.mkv ${j}_-001.mkv
				done ;
				echo "for j in `cat lsV`; do
					echo "../Auxil-contrib/Fs_filter_complex.sh \
					${j}_-003_-002.mkv ${j}-last_4CAT.mkv"
					../Auxil-contrib/Fs_filter_complex.sh \
					${j}_-003_-002.mkv ${j}-last_4CAT.mkv"
				for j in `cat lsV`; do
					echo "../Auxil-contrib/Fs_filter_complex.sh \
					${j}_-003_-002.mkv ${j}-last_4CAT.mkv"
					../Auxil-contrib/Fs_filter_complex.sh \
					${j}_-003_-002.mkv ${j}-last_4CAT.mkv
				done ;
				cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
				cat lsV | sed 's/_fs/_fs_-003_-002_CONCAT/' > lsVl
				mkdir -p ../../Licet_MOV ;

				echo $(basename $0) point 0M
				#read FAKE
				case "$r" in
					25 )
						echo $(basename $0) point 0M1
						#read FAKE
						workdir=`pwd`
						echo $workdir
						mov_file=$workdir/../../Licet_MOV/Fs_LENTO_4x3_at0_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../LENTO_First_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_LENTO_4x3_at0.sh ../LENTO_4x3/lsVf &> /dev/null"
							./Fs_LENTO_4x3_at0.sh ../LENTO_4x3/lsVf &> /dev/null
							mv -v Fs_LENTO_4x3_at0_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point 0M2
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_LENTO_4x3_at0_on_black_nLOGO.mov
							../LENTO_First_4x3/Fs_LENTO_4x3_at0_on_lsVf.sh lsVf
						mov_file=$workdir/../../Licet_MOV/Fs_LENTO_4x3_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../LENTO_Last_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_LENTO_4x3.sh ../LENTO_4x3/lsVl &> /dev/null"
							./Fs_LENTO_4x3.sh ../LENTO_4x3/lsVl &> /dev/null
							mv -v Fs_LENTO_4x3_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point 0M3
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_LENTO_4x3_on_black_nLOGO.mov
							../LENTO_Last_4x3/Fs_LENTO_4x3_on_lsVl.sh lsVl
					echo $(basename $0) point 0M4
					#read FAKE
					;;

					30 )
						echo "TO DO"
					;;

					50 )
						echo $(basename $0) point 0N
						#read FAKE
						workdir=`pwd`
						echo $workdir
						mov_file=$workdir/../../Licet_MOV/Fs_LENTO_4x3r50_at0_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../LENTO_First_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_LENTO_4x3r50_at0.sh ../LENTO_4x3/lsVf &> /dev/null"
							./Fs_LENTO_4x3r50_at0.sh ../LENTO_4x3/lsVf &> /dev/null
							mv -v Fs_LENTO_4x3r50_at0_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point 0N1
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_LENTO_4x3r50_at0_on_black_nLOGO.mov
							../LENTO_First_4x3/Fs_LENTO_4x3r50_at0_on_lsVf.sh lsVf
						mov_file=$workdir/../../Licet_MOV/Fs_LENTO_4x3r50_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../LENTO_Last_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_LENTO_4x3r50.sh ../LENTO_4x3/lsVl &> /dev/null"
							./Fs_LENTO_4x3r50.sh ../LENTO_4x3/lsVl &> /dev/null
							mv -v Fs_LENTO_4x3r50_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point 0N2
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_LENTO_4x3r50_on_black_nLOGO.mov
							../LENTO_Last_4x3/Fs_LENTO_4x3r50_on_lsVl.sh lsVl
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;
				esac

				echo "Licence-over done. Now producing the final"
				echo "flowstamped licenced-over video."
				k=`echo $j|sed 's/fs/fL/'`
				echo $k
				for j in `cat lsV` ; do
					echo "###    mkvmerge sometimes would not merge right at all!"
					#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
						#${j}_-002.mkv + ${j}_-003_-001.mkv + \
						#${j}_-003_-002_CONCAT_LICET.mkv
					../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
						${j}_-002.mkv ${j}_-003_-001.mkv \
						${j}_-003_-002_CONCAT_LICET.mkv
					mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
					echo "###    The final:"
					echo "###    $k.mkv"
					echo "###    with licet sequences added at start and end"
					if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
						echo "###    appears to have been made."
					else
						echo "###    seems to have failed."
					fi
					echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
				done

				cd -
				;;

			7778 )
				case "$wid" in
				768 )
					if [ -e "../Auxil-contrib/EMPTY_20s_AV.mkv" ]
						then
							ln -s ../Auxil-contrib/EMPTY_20s_AV.mkv
					fi
					case "$r" in
						25 )
							EMPTY_38s=EMPTY_38s_AV.mkv
							EMPTY_190s=EMPTY_190s_AV.mkv
						;;

						30 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						50 )
							EMPTY_38s=EMPTY_38s_AVr50.mkv
							EMPTY_190s=EMPTY_190s_AVr50.mkv
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo \$EMPTY_38s: $EMPTY_38s
					echo \$EMPTY_190s: $EMPTY_190s

					mv -v Fs_40m+/${j}_-001.mkv Fs_40m+/${j}_-002.mkv \
						Fs_40m+/${j}_-003_-001.mkv \
						Fs_40m+/${j}_-003_-002.mkv Fs_40m+/${j}-first.png \
						Fs_40m+/${j}-last.png ../LENTO_16x9
					cd ../LENTO_16x9
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					if [ -e "../Auxil-contrib/$EMPTY_38s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_38s
						else
							../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r
							mv -v $EMPTY_38s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_38s
					fi
					if [ -e "../Auxil-contrib/$EMPTY_190s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_190s
						else
							../Auxil-contrib/make_empty_mkv.sh 190 $j_asp_cut $wid $r
							mv -v $EMPTY_190s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_190s
					fi
					echo "We're in \$j.leni gt 2400, we should be in LENTO_16x9 dir"
					ln -s $EMPTY_38s $j-first.mkv
					ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-first_4CAT.mkv
					ln -s $EMPTY_190s $j-last.mkv
					ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-last_4CAT.mkv
					cd -
					cd ../LENTO_16x9 ;
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo pwd: ; pwd
					echo "$j.leni, seems gt 2400, dir LENTO_16x9"
					mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
					ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
					for j in `cat lsV`; do
						../Auxil-contrib/Fs_filter_complex.sh \
							$j-first_4CAT.mkv ${j}_-001.mkv
					done ;
					for j in `cat lsV`; do
						../Auxil-contrib/Fs_filter_complex.sh \
							${j}_-003_-002.mkv ${j}-last_4CAT.mkv
					done ;
					cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
					cat lsV | sed 's/_fs/_fs_-003_-002_CONCAT/' > lsVl
					mkdir -p ../../Licet_MOV ;

					case "$r" in
						25 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_LENTO_at0_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../LENTO_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_LENTO_at00000.sh ../LENTO_16x9/lsVf &> /dev/null"
								./Fs_LENTO_at00000.sh ../LENTO_16x9/lsVf &> /dev/null
								mv -v Fs_LENTO_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_LENTO_at0_on_black_nLOGO.mov
								../LENTO_First_16x9/Fs_LENTO_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_LENTO_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../LENTO_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_LENTO.sh ../LENTO_16x9/lsVl &> /dev/null"
								./Fs_LENTO.sh ../LENTO_16x9/lsVl &> /dev/null
								mv -v Fs_LENTO_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_LENTO_on_black_nLOGO.mov
								../LENTO_Last_16x9/Fs_LENTO_on_lsVl.sh lsVl
						;;

						30 )
							echo "TO DO"
						;;

						50 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_LENTO_r50_at0_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../LENTO_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_LENTO_r50_at00000.sh ../LENTO_16x9/lsVf &> /dev/null"
								./Fs_LENTO_r50_at00000.sh ../LENTO_16x9/lsVf &> /dev/null
								mv -v Fs_LENTO_r50_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_LENTO_r50_at0_on_black_nLOGO.mov
								../LENTO_First_16x9/Fs_LENTO_r50_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_LENTO_r50_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../LENTO_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_LENTO.sh ../LENTO_16x9/lsVl &> /dev/null"
								./Fs_LENTO.sh ../LENTO_16x9/lsVl &> /dev/null
								mv -v Fs_LENTO_r50_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_LENTO_r50_on_black_nLOGO.mov
								../LENTO_Last_16x9/Fs_LENTO_r50_on_lsVl.sh lsVl
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo "Licence-over done. Now producing the final"
					echo "flowstamped licenced-over video."
					k=`echo $j|sed 's/fs/fL/'`
					echo $k
					for j in `cat lsV` ; do
						echo "###    mkvmerge sometimes would not merge right at all!"
						#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
							#${j}_-002.mkv + ${j}_-003_-001.mkv + \
							#${j}_-003_-002_CONCAT_LICET.mkv
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
							${j}_-002.mkv ${j}_-003_-001.mkv \
							${j}_-003_-002_CONCAT_LICET.mkv
						mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
						echo "###    The final:"
						echo "###    $k.mkv"
						echo "###    with licet sequences added at start and end"
						if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
							echo "###    appears to have been made."
						else
							echo "###    seems to have failed."
						fi
						echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
					done

					cd -
					;;

				1920 )
					if [ -e "../Auxil-contrib/EMPTY_20s_AV.mkv" ]
						then
							ln -s ../Auxil-contrib/EMPTY_20s_AV.mkv
					fi
					case "$r" in
						25 )
							EMPTY_38s=EMPTY_38s_AV.mkv
							EMPTY_190s=EMPTY_190s_AV.mkv
						;;

						30 )
							EMPTY_38s=EMPTY_38s_AV1920r30.mkv
							EMPTY_190s=EMPTY_190s_AV1920r30.mkv
						;;

						50 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo \$EMPTY_38s: $EMPTY_38s
					echo \$EMPTY_190s: $EMPTY_190s

					mv -v Fs_40m+/${j}_-001.mkv Fs_40m+/${j}_-002.mkv \
						Fs_40m+/${j}_-003_-001.mkv \
						Fs_40m+/${j}_-003_-002.mkv Fs_40m+/${j}-first.png \
						Fs_40m+/${j}-last.png ../LENTO_16x9
					cd ../LENTO_16x9
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					if [ -e "../Auxil-contrib/$EMPTY_38s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_38s
						else
							../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r
							mv -v $EMPTY_38s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_38s
					fi
					if [ -e "../Auxil-contrib/$EMPTY_190s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_190s
						else
							../Auxil-contrib/make_empty_mkv.sh 190 $j_asp_cut $wid $r
							mv -v $EMPTY_190s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_190s
					fi
					echo "We're in \$j.leni gt 2400, we should be in LENTO_16x9 dir"
					ln -s $EMPTY_38s $j-first.mkv
					ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-first_4CAT.mkv
					ln -s $EMPTY_190s $j-last.mkv
					ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-last_4CAT.mkv
					cd -
					cd ../LENTO_16x9 ;
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo pwd: ; pwd
					echo "$j.leni, seems gt 2400, dir LENTO_16x9"
					mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
					ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
					for j in `cat lsV`; do
						../Auxil-contrib/Fs_filter_complex.sh \
							$j-first_4CAT.mkv ${j}_-001.mkv
					done ;
					for j in `cat lsV`; do
						../Auxil-contrib/Fs_filter_complex.sh \
							${j}_-003_-002.mkv ${j}-last_4CAT.mkv
					done ;
					cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
					cat lsV | sed 's/_fs/_fs_-003_-002_CONCAT/' > lsVl
					mkdir -p ../../Licet_MOV ;

					case "$r" in
						25 )
							echo "TO DO"
						;;

						30 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_LENTO_r30_at0_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../LENTO_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_LENTO_r30_at00000.sh ../LENTO_16x9/lsVf &> /dev/null"
								./Fs_LENTO_r30_at00000.sh ../LENTO_16x9/lsVf &> /dev/null
								mv -v Fs_LENTO_r30_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_LENTO_r30_at0_on_black_nLOGO.mov
								../LENTO_First_16x9/Fs_LENTO_r30_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_LENTO_r30_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../LENTO_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_LENTO_r30.sh ../LENTO_16x9/lsVl &> /dev/null"
								./Fs_LENTO_r30.sh ../LENTO_16x9/lsVl &> /dev/null
								mv -v Fs_LENTO_r30_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_LENTO_r30_on_black_nLOGO.mov
								../LENTO_Last_16x9/Fs_LENTO_r30_on_lsVl.sh lsVl
						;;

						50 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo "Licence-over done. Now producing the final"
					echo "flowstamped licenced-over video."
					k=`echo $j|sed 's/fs/fL/'`
					echo $k
					for j in `cat lsV` ; do
						echo "###    mkvmerge sometimes would not merge right at all!"
						#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
							#${j}_-002.mkv + ${j}_-003_-001.mkv + \
							#${j}_-003_-002_CONCAT_LICET.mkv
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
							${j}_-002.mkv ${j}_-003_-001.mkv \
							${j}_-003_-002_CONCAT_LICET.mkv
						mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
						echo "###    The final:"
						echo "###    $k.mkv"
						echo "###    with licet sequences added at start and end"
						if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
							echo "###    appears to have been made."
						else
							echo "###    seems to have failed."
						fi
						echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
					done

					cd -

				;;

			esac
			;;

			* )
				echo "Aspect of your video, \$j_asp_cut: $j_asp_cut,"
				echo "is currently not supported"
				echo "(try and tweak the script yourself)."
			;;
		esac
		cd ../
	else
		echo "\$j.leni:"
		echo $j.leni
		echo "\$j.leni must still be greater than 240s"
		echo "but less than 2400s."
		cd ../Fs_40m-/
		ln -s ../$j.mkv ; ln -s ../$j.leni
		thecut_s1=`echo $(<${j}.leni)-17|bc`;
		echo "\$thecut_s1 (17s before end, for 240s+ (but 40m-):"
		echo $thecut_s1

		mkvmerge -o ${j}_.mkv --split timecodes:5s,`echo $thecut_s1`s $j.mkv
		midentify ${j}_-003.mkv|grep LENG|cut -d '=' -f 2 | \
			cut -d '.' -f 1 > ${j}_-003.leni
		mkdir ${j}_-001.d
		ffmpeg -i ${j}_-001.mkv -f image2 ${j}_-001.d/$j-%3d.png
		cd ${j}_-001.d
		ls -1 *.png | head -n1 > first_shot.ls-1
		cp -av `cat first_shot.ls-1` ../
		mv -v first_shot.ls-1 ../
		cd ../
		cat first_shot.ls-1|sed 's/_fs-[0-9][0-9][0-9]/_fs-first/' > \
			first_shot.ren
		cp -av `cat first_shot.ls-1` `cat first_shot.ren`
		ls -l $j-first.png
		#echo "Now display \$j-first_png"
		display $j-first.png & pid=$! ; sleep 3 ; kill $pid
		rm -rf ${j}_-001.d

		thecut_s2=`echo $(<${j}_-003.leni)-8|bc`;
		echo "\$thecut_s2 (8s for the last 17s):"
		echo $thecut_s2
		mkvmerge -o ${j}_-003_.mkv --split timecodes:`echo $thecut_s2`s ${j}_-003.mkv
		mkdir ${j}_-003_-002.d
		ffmpeg -i ${j}_-003_-002.mkv -f image2 ${j}_-003_-002.d/$j-%3d.png
		cd ${j}_-003_-002.d
		ls -1 *.png | tail -n1 > last_shot.ls-1
		cp -av `cat last_shot.ls-1` ../
		mv -v last_shot.ls-1 ../
		cd ../
		cat last_shot.ls-1|sed 's/_fs-[0-9][0-9][0-9]/_fs-last/' > \
			last_shot.ren
		cp -av `cat last_shot.ls-1` `cat last_shot.ren`
		#echo "Now display \$j-last_png"
		display $j-last.png & pid=$! ; sleep 3 ; kill $pid
		rm -rf ${j}_-003_-002.d
		rm -v ${j}.mkv ${j}.leni ${j}_-003.leni ${j}_-003.mkv ${j}-???.png
		cd ../

		case "$j_asp_cut" in
			3333 )
				if [ -e "../Auxil-contrib/EMPTY_20s_AV_1333.mkv" ]
					then
						ln -s ../Auxil-contrib/EMPTY_20s_AV_1333.mkv
				fi
				case "$r" in
					25 )
						EMPTY_20s=EMPTY_20s_AV_1333.mkv
						EMPTY_100s=EMPTY_100s_AV_1333.mkv
					;;

					30 )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;

					50 )
						EMPTY_20s=EMPTY_20s_AVr50_1333.mkv
						EMPTY_100s=EMPTY_100s_AVr50_1333.mkv
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;
				esac

				mv -v Fs_40m-/${j}_-001.mkv Fs_40m-/${j}_-002.mkv \
					Fs_40m-/${j}_-003_-001.mkv Fs_40m-/${j}_-003_-002.mkv \
					Fs_40m-/${j}-first.png Fs_40m-/${j}-last.png ../MODER_4x3
				cd ../MODER_4x3
				ln -s ../$fSlog
				ls -l ../$fSlog $fSlog
				if [ -e "../Auxil-contrib/$EMPTY_20s" ]
					then
						ln -s ../Auxil-contrib/$EMPTY_20s
					else
						../Auxil-contrib/make_empty_mkv.sh 20 $j_asp_cut $wid $r
						mv -v $EMPTY_20s ../Auxil-contrib/
						ln -s ../Auxil-contrib/$EMPTY_20s
				fi
				if [ -e "../Auxil-contrib/$EMPTY_100s" ]
					then
						ln -s ../Auxil-contrib/$EMPTY_100s
					else
						../Auxil-contrib/make_empty_mkv.sh 100 $j_asp_cut $wid $r
						mv -v $EMPTY_100s ../Auxil-contrib/
						ln -s ../Auxil-contrib/$EMPTY_100s
				fi
				echo "We're in \$j.leni gt 240 lt 2400, we should be in MODER_4x3 dir"
				ln -s $EMPTY_20s $j-first.mkv
				ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-first_4CAT.mkv
				ln -s $EMPTY_100s $j-last.mkv
				ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-last_4CAT.mkv
				cd -
				cd ../MODER_4x3 ;
				ln -s ../$fSlog
				ls -l ../$fSlog $fSlog
				echo pwd: ; pwd
				echo "$j.leni, seems gt 240 lt 2400, dir MODER_4x3"
				mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
				ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
				for j in `cat lsV`; do
					../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
					${j}_-001.mkv
				done ;
				for j in `cat lsV`; do
					../Auxil-contrib/Fs_filter_complex.sh ${j}_-003_-002.mkv \
					${j}-last_4CAT.mkv
				done ;
				cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
				cat lsV | sed 's/_fs/_fs_-003_-002_CONCAT/' > lsVl
				mkdir -p ../../Licet_MOV ;

				case "$r" in
					25 )
						workdir=`pwd`
						echo $workdir
						mov_file=$workdir/../../Licet_MOV/Fs_MODER_4x3_at0_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../MODER_First_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_MODER_4x3_at0.sh ../MODER_4x3/lsVf &> /dev/null"
							./Fs_MODER_4x3_at0.sh ../MODER_4x3/lsVf &> /dev/null
							mv -v Fs_MODER_4x3_at0_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						fi
							ln -s ../../Licet_MOV/Fs_MODER_4x3_at0_on_black_nLOGO.mov
							../MODER_First_4x3/Fs_MODER_4x3_at0_on_lsVf.sh lsVf
						mov_file=$workdir/../../Licet_MOV/Fs_MODER_4x3_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../MODER_Last_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_MODER_4x3.sh ../MODER_4x3/lsVl &> /dev/null"
							./Fs_MODER_4x3.sh ../MODER_4x3/lsVl &> /dev/null
							mv -v Fs_MODER_4x3_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						fi
							ln -s ../../Licet_MOV/Fs_MODER_4x3_on_black_nLOGO.mov
							../MODER_Last_4x3/Fs_MODER_4x3_on_lsVl.sh lsVl
					;;

					30 )
						echo "TO DO" ;
					;;

					50 )
						workdir=`pwd`
						echo $workdir
						mov_file=$workdir/../../Licet_MOV/Fs_MODER_4x3r50_at0_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../MODER_First_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_MODER_4x3r50_at0.sh ../MODER_4x3/lsVf &> /dev/null"
							./Fs_MODER_4x3r50_at0.sh ../MODER_4x3/lsVf &> /dev/null
							mv -v Fs_MODER_4x3r50_at0_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						fi
							ln -s ../../Licet_MOV/Fs_MODER_4x3r50_at0_on_black_nLOGO.mov
							../MODER_First_4x3/Fs_MODER_4x3r50_at0_on_lsVf.sh lsVf
						mov_file=$workdir/../../Licet_MOV/Fs_MODER_4x3r50_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../MODER_Last_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_MODER_4x3r50.sh ../MODER_4x3/lsVl &> /dev/null"
							./Fs_MODER_4x3r50.sh ../MODER_4x3/lsVl &> /dev/null
							mv -v Fs_MODER_4x3r50_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						fi
							ln -s ../../Licet_MOV/Fs_MODER_4x3r50_on_black_nLOGO.mov
							../MODER_Last_4x3/Fs_MODER_4x3r50_on_lsVl.sh lsVl
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;
				esac

				echo "Licence-over done. Now producing the final"
				echo "flowstamped licenced-over video."
				k=`echo $j|sed 's/fs/fL/'`
				echo $k
				for j in `cat lsV` ; do
					echo "###    mkvmerge sometimes would not merge right at all!"
					#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
						#${j}_-002.mkv + ${j}_-003_-001.mkv + \
						#${j}_-003_-002_CONCAT_LICET.mkv
					../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
						${j}_-002.mkv ${j}_-003_-001.mkv \
						${j}_-003_-002_CONCAT_LICET.mkv
					mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
					echo "###    The final:"
					echo "###    $k.mkv"
					echo "###    with licet sequences added at start and end"
					if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
						echo "###    appears to have been made."
					else
						echo "###    seems to have failed."
					fi
					echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
				done

				cd -
			;;

			7778 )
				case "$wid" in
				768 )
					mv -v Fs_40m-/${j}_-001.mkv Fs_40m-/${j}_-002.mkv \
						Fs_40m-/${j}_-003_-001.mkv \
					Fs_40m-/${j}_-003_-002.mkv Fs_40m-/${j}-first.png \
						Fs_40m-/${j}-last.png ../MODER_16x9
					cd ../MODER_16x9
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					if [ -e "../Auxil-contrib/EMPTY_20s_AV.mkv" ]
						then
							ln -s ../Auxil-contrib/EMPTY_20s_AV.mkv
						else
							../Auxil-contrib/make_empty_mkv.sh 20 $j_asp_cut $wid $r
							mv -v EMPTY_20s_AV.mkv ../Auxil-contrib/
							ln -s ../Auxil-contrib/EMPTY_20s_AV.mkv
					fi
					if [ -e "../Auxil-contrib/EMPTY_100s_AV.mkv" ]
						then
							ln -s ../Auxil-contrib/EMPTY_100s_AV.mkv
						else
							../Auxil-contrib/make_empty_mkv.sh 100 $j_asp_cut $wid $r
							mv -v EMPTY_100s_AV.mkv ../Auxil-contrib/
							ln -s ../Auxil-contrib/EMPTY_100s_AV.mkv
					fi
					echo "We're in \$j.leni gt 240 lt 2400, we should be in MODER_16x9 dir"
					ln -s EMPTY_20s_AV.mkv $j-first.mkv
					ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-first_4CAT.mkv
					ln -s EMPTY_100s_AV.mkv $j-last.mkv
					ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-last_4CAT.mkv
					cd -
					cd ../MODER_16x9 ;
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo pwd: ; pwd
					echo "$j.leni, seems gt 240 lt 2400, dir MODER_16x9"
					mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
					ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
					for j in `cat lsV`; do
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
							${j}_-001.mkv
					done ;
					for j in `cat lsV`; do \
						../Auxil-contrib/Fs_filter_complex.sh ${j}_-003_-002.mkv \
							${j}-last_4CAT.mkv
					done ;
					cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
					cat lsV | sed 's/_fs/_fs_-003_-002_CONCAT/' > lsVl
					mkdir -p ../../Licet_MOV ;
					workdir=`pwd`
					echo $workdir
					mov_file=$workdir/../../Licet_MOV/Fs_MODER_at0_on_black_nLOGO.mov
					if [ ! -e "$mov_file" ] ; then
						cd ../MODER_First_16x9
						ln -s ../$fSlog
						ls -l ../$fSlog $fSlog
						echo "./Fs_MODER_at00000.sh ../MODER_16x9/lsVf &> /dev/null"
						./Fs_MODER_at00000.sh ../MODER_16x9/lsVf &> /dev/null
						mv -v Fs_MODER_at0_on_black_nLOGO.mov ../../Licet_MOV/
						cd -
					fi
						ln -s ../../Licet_MOV/Fs_MODER_at0_on_black_nLOGO.mov
						../MODER_First_16x9/Fs_MODER_at00000_on_lsVf.sh lsVf
					mov_file=$workdir/../../Licet_MOV/Fs_MODER_on_black_nLOGO.mov
					if [ ! -e "$mov_file" ] ; then
						cd ../MODER_Last_16x9
						ln -s ../$fSlog
						ls -l ../$fSlog $fSlog
						echo "./Fs_MODER.sh ../MODER_16x9/lsVl &> /dev/null"
						./Fs_MODER.sh ../MODER_16x9/lsVl &> /dev/null
						mv -v Fs_MODER_on_black_nLOGO.mov ../../Licet_MOV/
						cd -
					fi
						ln -s ../../Licet_MOV/Fs_MODER_on_black_nLOGO.mov
						../MODER_Last_16x9/Fs_MODER_on_lsVl.sh lsVl
					
					echo "Licence-over done. Now producing the final"
					echo "flowstamped licenced-over video."
					k=`echo $j|sed 's/fs/fL/'`
					echo $k
					for j in `cat lsV` ; do
						echo "###    mkvmerge sometimes would not merge right at all!"
						#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
							#${j}_-002.mkv + ${j}_-003_-001.mkv + \
							#${j}_-003_-002_CONCAT_LICET.mkv
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
							${j}_-002.mkv ${j}_-003_-001.mkv \
							${j}_-003_-002_CONCAT_LICET.mkv
						mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
						echo "###    The final:"
						echo "###    $k.mkv"
						echo "###    with licet sequences added at start and end"
						if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
							echo "###    appears to have been made."
						else
							echo "###    seems to have failed."
						fi
						echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
					done

					cd -
				;;

				1920 )
					if [ -e "../Auxil-contrib/EMPTY_20s_AV.mkv" ]
						then
							ln -s ../Auxil-contrib/EMPTY_20s_AV.mkv
					fi
					case "$r" in
						25 )
							EMPTY_20s=EMPTY_20s_AV.mkv
							EMPTY_100s=EMPTY_100s_AV.mkv
						;;

						30 )
							EMPTY_20s=EMPTY_20s_AV1920r30.mkv
							EMPTY_100s=EMPTY_100s_AV1920r30.mkv
						;;

						50 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo \$EMPTY_20s: $EMPTY_20s
					echo \$EMPTY_100s: $EMPTY_100s

					mv -v Fs_40m-/${j}_-001.mkv Fs_40m-/${j}_-002.mkv \
						Fs_40m-/${j}_-003_-001.mkv \
						Fs_40m-/${j}_-003_-002.mkv Fs_40m-/${j}-first.png \
						Fs_40m-/${j}-last.png ../MODER_16x9
					cd ../MODER_16x9
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					if [ -e "../Auxil-contrib/$EMPTY_20s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_20s
						else
							../Auxil-contrib/make_empty_mkv.sh 20 $j_asp_cut $wid $r
							mv -v $EMPTY_20s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_20s
					fi
					if [ -e "../Auxil-contrib/$EMPTY_100s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_100s
						else
							../Auxil-contrib/make_empty_mkv.sh 100 $j_asp_cut $wid $r
							mv -v $EMPTY_100s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_100s
					fi
					echo "We're in \$j.leni gt 240 lt 2400, we should be in MODER_16x9 dir"
					ln -s $EMPTY_20s $j-first.mkv
					ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-first_4CAT.mkv
					ln -s $EMPTY_100s $j-last.mkv
					ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-last_4CAT.mkv
					cd -
					cd ../MODER_16x9 ;
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo pwd: ; pwd
					echo "$j.leni, seems gt 240 lt 2400, dir MODER_16x9"
					mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
					ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
					for j in `cat lsV`; do
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
							${j}_-001.mkv
					done ;
					for j in `cat lsV`; do \
						../Auxil-contrib/Fs_filter_complex.sh \
							${j}_-003_-002.mkv ${j}-last_4CAT.mkv
					done ;
					cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
					cat lsV | sed 's/_fs/_fs_-003_-002_CONCAT/' > lsVl
					mkdir -p ../../Licet_MOV ;

					case "$r" in
						25 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_MODER_at0_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../MODER_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_MODER_at00000.sh ../MODER_16x9/lsVf &> /dev/null"
								./Fs_MODER_at00000.sh ../MODER_16x9/lsVf &> /dev/null
								mv -v Fs_MODER_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_MODER_at0_on_black_nLOGO.mov
								../MODER_First_16x9/Fs_MODER_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_MODER_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../MODER_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_MODER.sh ../MODER_16x9/lsVl &> /dev/null"
								./Fs_MODER.sh ../MODER_16x9/lsVl &> /dev/null
								mv -v Fs_MODER_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_MODER_on_black_nLOGO.mov
								../MODER_Last_16x9/Fs_MODER_on_lsVl.sh lsVl
						;;

						30 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_MODER_r30_at0_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../MODER_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_MODER_r30_at00000.sh ../MODER_16x9/lsVf &> /dev/null"
								./Fs_MODER_r30_at00000.sh ../MODER_16x9/lsVf &> /dev/null
								mv -v Fs_MODER_r30_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_MODER_r30_at0_on_black_nLOGO.mov
								../MODER_First_16x9/Fs_MODER_r30_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_MODER_r30_on_black_nLOGO.mov
							if [ ! -e "$mov_file" ] ; then
								cd ../MODER_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_MODER_r30.sh ../MODER_16x9/lsVl &> /dev/null"
								./Fs_MODER_r30.sh ../MODER_16x9/lsVl &> /dev/null
								mv -v Fs_MODER_r30_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							fi
								ln -s ../../Licet_MOV/Fs_MODER_r30_on_black_nLOGO.mov
								../MODER_Last_16x9/Fs_MODER_r30_on_lsVl.sh lsVl
						;;

						50 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo "Licence-over done. Now producing the final"
					echo "flowstamped licenced-over video."
					k=`echo $j|sed 's/fs/fL/'`
					echo $k
					for j in `cat lsV` ; do
						echo "###    mkvmerge sometimes would not merge right at all!"
						#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
							#${j}_-002.mkv + ${j}_-003_-001.mkv + \
							#${j}_-003_-002_CONCAT_LICET.mkv
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
							${j}_-002.mkv ${j}_-003_-001.mkv \
							${j}_-003_-002_CONCAT_LICET.mkv
						mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
						echo "###    The final:"
						echo "###    $k.mkv"
						echo "###    with licet sequences added at start and end"
						if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
							echo "###    appears to have been made."
						else
							echo "###    seems to have failed."
						fi
						echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
					done

					cd -

				;;
			esac
			;;

			* )
				echo "Aspect of your video, \$j_asp_cut: $j_asp_cut,"
				echo "is currently not supported"
				echo "(try and tweak the script yourself)."
			;;
		esac
		cd ../
	fi

else
	echo "\$j.leni ([len]gth [i]nteger only):"
	cat $j.leni
	echo "\$j.leni must be smaller than 240s if not, script wrong."
	thecut=`echo $(<${j}.leni)-2|bc`;
	echo $(basename $0) point 0Z001
	#read FAKE
	cd Fs_4m-/
	ln -s ../$j.mkv ; ln -s ../$j.leni
	echo "mkvmerge -o ${j}_.mkv --split timecodes:3s,`echo $thecut`s $j.mkv"
	mkvmerge -o ${j}_.mkv --split timecodes:3s,`echo $thecut`s $j.mkv
	mkdir ${j}_-001.d
	echo "ffmpeg -i ${j}_-001.mkv -f image2 ${j}_-001.d/$j-%3d.png"
	ffmpeg -i ${j}_-001.mkv -f image2 ${j}_-001.d/$j-%3d.png
	cd ${j}_-001.d
	ls -1 *.png | head -n1 > first_shot.ls-1
	cp -av `cat first_shot.ls-1` ../
	mv -v first_shot.ls-1 ../
	cd ../
	cat first_shot.ls-1|sed 's/_fs-[0-9][0-9][0-9]/_fs-first/' > \
		first_shot.ren
	cp -av `cat first_shot.ls-1` `cat first_shot.ren`
	ls -l $j-first.png
	#echo "Now display \$j-first.png"
	display $j-first.png & pid=$! ; sleep 3 ; kill $pid
	echo $(basename $0) point 0Z002
	#read FAKE ;
	rm -rf ${j}_-001.d
	rm -v ${j}.mkv ${j}.leni ${j}-???.png

	mkdir ${j}_-003.d
	ffmpeg -i ${j}_-003.mkv -f image2 ${j}_-003.d/$j-%3d.png
	cd ${j}_-003.d
	ls -1 *.png | tail -n1 > last_shot.ls-1
	cp -av `cat last_shot.ls-1` ../
	mv -v last_shot.ls-1 ../
	cd ../
	cat last_shot.ls-1|sed 's/_fs-[0-9][0-9][0-9]/_fs-last/' > \
		last_shot.ren
	cp -av `cat last_shot.ls-1` `cat last_shot.ren`
	#echo "Now display \$j-last_png"
	display $j-last.png & pid=$! ; sleep 3 ; kill $pid
	echo $(basename $0) point 0Z003
	#read FAKE
	rm -rf ${j}_-003.d ${j}-???.png
	echo $(basename $0) point 0Z0
	#read FAKE
	cd ../

	case "$j_asp_cut" in
			3333 )
				if [ -e "../Auxil-contrib/EMPTY_20s_AV_1333.mkv" ]
					then
						ln -s ../Auxil-contrib/EMPTY_20s_AV_1333.mkv
				fi
				echo $(basename $0) point 0Z1
				#read FAKE
				case "$r" in
					25 )
						EMPTY_5s=EMPTY_5s_AV_1333.mkv
						EMPTY_38s=EMPTY_38s_AV_1333.mkv
					;;

					30 )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;

					50 )
						EMPTY_5s=EMPTY_5s_AVr50_1333.mkv
						EMPTY_38s=EMPTY_38s_AVr50_1333.mkv
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;
				esac

				echo \$EMPTY_5s: $EMPTY_5s
				echo \$EMPTY_38s: $EMPTY_38s

				echo $(basename $0) point 1 ; pwd
				#read FAKE
				mv -v Fs_4m-/${j}_-001.mkv Fs_4m-/${j}_-002.mkv \
				Fs_4m-/${j}_-003.mkv Fs_4m-/${j}-first.png \
				Fs_4m-/${j}-last.png ../ALLEG_4x3
				cd ../ALLEG_4x3
				ln -s ../$fSlog
				ls -l ../$fSlog $fSlog
				if [ -e "../Auxil-contrib/$EMPTY_5s" ]
					then
						ln -s ../Auxil-contrib/$EMPTY_5s
					else
						echo "../Auxil-contrib/make_empty_mkv.sh 5 $j_asp_cut $wid $r"
						../Auxil-contrib/make_empty_mkv.sh 5 $j_asp_cut $wid $r
						mv -v $EMPTY_5s ../Auxil-contrib/
						ln -s ../Auxil-contrib/$EMPTY_5s
				fi
				echo $(basename $0) point 2
				#read FAKE
				if [ -e "../Auxil-contrib/$EMPTY_38s" ]
					then
						ln -s ../Auxil-contrib/$EMPTY_38s
					else
						echo "../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r"
						../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r
						mv -v $EMPTY_38s ../Auxil-contrib/
						ln -s ../Auxil-contrib/$EMPTY_38s
				fi
				echo "We're in \$j.leni lt 240, we should be in ALLEG_4x3 dir"
				ln -s $EMPTY_5s $j-first.mkv
				echo $(basename $0) point 3
				#read FAKE
				ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-first_4CAT.mkv
				ln -s $EMPTY_38s $j-last.mkv
				echo $(basename $0) point 4
				#read FAKE
				ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
					-c:v libx264 -r $r -map 0:a -c:a copy -vf \
					movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
					${j}-last_4CAT.mkv
				cd -
				cd ../ALLEG_4x3 ;
						ln -s ../$fSlog
						ls -l ../$fSlog $fSlog
				echo pwd: ; pwd
				echo "$j.leni, seems lt 240, dir ALLEG_4x3"
				mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
				ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
				echo $(basename $0) point 5
				#read FAKE
				for j in `cat lsV`; do
					echo "../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
					${j}_-001.mkv"
					../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
					${j}_-001.mkv
				done ;
				for j in `cat lsV`; do
					echo "../Auxil-contrib/Fs_filter_complex.sh ${j}_-003.mkv \
					${j}-last_4CAT.mkv"
					../Auxil-contrib/Fs_filter_complex.sh ${j}_-003.mkv \
					${j}-last_4CAT.mkv
				done ;
				cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
				cat lsV | sed 's/_fs/_fs_-003_CONCAT/' > lsVl
				mkdir -p ../../Licet_MOV ;

				echo $(basename $0) point 6
				#read FAKE
				case "$r" in
					25 )
						workdir=`pwd`
						echo $workdir
						mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_4x3_at0_on_black_nLOGO.mov
						echo $(basename $0) point 7
						#read FAKE
						if [ ! -e "$mov_file" ] ; then
							cd ../ALLEG_First_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_ALLEG_4x3_at0.sh ../ALLEG_4x3/lsVf &> /dev/null"
							./Fs_ALLEG_4x3_at0.sh ../ALLEG_4x3/lsVf &> /dev/null
							mv -v Fs_ALLEG_4x3_at0_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point 8
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_ALLEG_4x3_at0_on_black_nLOGO.mov
							../ALLEG_First_4x3/Fs_ALLEG_4x3_at0_on_lsVf.sh lsVf
						echo $(basename $0) point 9
						#read FAKE
						mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_4x3_on_black_nLOGO.mov
						if [ ! -e "$mov_file" ] ; then
							cd ../ALLEG_Last_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_ALLEG_4x3.sh ../ALLEG_4x3/lsVl &> /dev/null"
							./Fs_ALLEG_4x3.sh ../ALLEG_4x3/lsVl &> /dev/null
							mv -v Fs_ALLEG_4x3_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point A
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_ALLEG_4x3_on_black_nLOGO.mov
							../ALLEG_Last_4x3/Fs_ALLEG_4x3_on_lsVl.sh lsVl
						echo $(basename $0) point A01
						#read FAKE
					;;

					30 )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;

					50 )
						workdir=`pwd`
						echo $workdir
						mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_4x3r50_at0_on_black_nLOGO.mov
						echo $(basename $0) point B
						#read FAKE
						if [ ! -e "$mov_file" ] ; then
							cd ../ALLEG_First_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_ALLEG_4x3r50_at0.sh ../ALLEG_4x3/lsVf &> /dev/null"
							./Fs_ALLEG_4x3r50_at0.sh ../ALLEG_4x3/lsVf &> /dev/null
							mv -v Fs_ALLEG_4x3r50_at0_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point C
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_ALLEG_4x3r50_at0_on_black_nLOGO.mov
							../ALLEG_First_4x3/Fs_ALLEG_4x3r50_at0_on_lsVf.sh lsVf
						mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_4x3r50_on_black_nLOGO.mov
						echo $(basename $0) point D
						#read FAKE
						if [ ! -e "$mov_file" ] ; then
							cd ../ALLEG_Last_4x3
							ln -s ../$fSlog
							ls -l ../$fSlog $fSlog
							echo "./Fs_ALLEG_4x3r50.sh ../ALLEG_4x3/lsVl &> /dev/null"
							./Fs_ALLEG_4x3r50.sh ../ALLEG_4x3/lsVl &> /dev/null
							mv -v Fs_ALLEG_4x3r50_on_black_nLOGO.mov ../../Licet_MOV/
							cd -
						echo $(basename $0) point E
						#read FAKE
						fi
							ln -s ../../Licet_MOV/Fs_ALLEG_4x3r50_on_black_nLOGO.mov
							../ALLEG_Last_4x3/Fs_ALLEG_4x3r50_on_lsVl.sh lsVl
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;
				esac

				echo $(basename $0) point F ; pwd
				#read FAKE
				echo "Licence-over done. Now producing the final"
				echo "flowstamped licenced-over video."
				k=`echo $j|sed 's/fs/fL/'`
				echo $k
				echo $(basename $0) point G
				#read FAKE
				for j in `cat lsV` ; do
					echo "###    mkvmerge sometimes would not merge right at all!"
					#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
						#${j}_-002.mkv + ${j}_-003_CONCAT_LICET.mkv
					../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
						${j}_-002.mkv ${j}_-003_CONCAT_LICET.mkv
					mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
					echo "###    The final:"
					echo "###    $k.mkv"
					echo "###    with licet sequences added at start and end"
					if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
						echo "###    appears to have been made."
					else
						echo "###    seems to have failed."
					fi
					echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
				done

				echo $(basename $0) point H ; pwd
				#read FAKE
				cd -
			echo $(basename $0) point I
			#read FAKE
			;;

			7778 )
				echo $(basename $0) point J ; pwd
				#read FAKE
				case "$wid" in
				768 )
					if [ -e "../Auxil-contrib/EMPTY_20s_AV.mkv" ]
						then
							ln -s ../Auxil-contrib/EMPTY_20s_AV.mkv
					fi
					echo $(basename $0) point K
					#read FAKE
					case "$r" in
						25 )
							EMPTY_5s=EMPTY_5s_AV.mkv
							EMPTY_38s=EMPTY_38s_AV.mkv
						;;

						30 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						50 )
							EMPTY_5s=EMPTY_5s_AVr50.mkv
							EMPTY_38s=EMPTY_38s_AVr50.mkv
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo \$EMPTY_5s: $EMPTY_5s
					echo \$EMPTY_38s: $EMPTY_38s

					echo $(basename $0) point L ; pwd
					#read FAKE
					mv -v Fs_4m-/${j}_-001.mkv Fs_4m-/${j}_-002.mkv \
						Fs_4m-/${j}_-003.mkv Fs_4m-/${j}-first.png \
						Fs_4m-/${j}-last.png ../ALLEG_16x9
					cd ../ALLEG_16x9
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo $(basename $0) point M
					#read FAKE
					if [ -e "../Auxil-contrib/$EMPTY_5s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_5s
						else
							echo "../Auxil-contrib/make_empty_mkv.sh 5 $j_asp_cut $wid $r"
							../Auxil-contrib/make_empty_mkv.sh 5 $j_asp_cut $wid $r
							mv -v $EMPTY_5s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_5s
					fi
					echo $(basename $0) point N
					#read FAKE
					if [ -e "../Auxil-contrib/$EMPTY_38s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_38s
						else
							echo "../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r"
							../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r
							mv -v $EMPTY_38s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_38s
					fi
					echo "We're in \$j.leni lt 240, we should be in ALLEG_16x9 dir"
					ln -s $EMPTY_5s $j-first.mkv
					echo $(basename $0) point O
					#read FAKE
					echo "ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-first_4CAT.mkv"
					ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-first_4CAT.mkv
					ln -s $EMPTY_38s $j-last.mkv
					echo $(basename $0) point P
					#read FAKE
					ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-last_4CAT.mkv
					cd -
					cd ../ALLEG_16x9 ;
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo pwd: ; pwd
					echo "$j.leni lt 240, dir ALLEG_16x9"
					mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
					ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
					echo $(basename $0) point Q
					#read FAKE
					for j in `cat lsV`; do \
						echo "../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
							${j}_-001.mkv"
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
							${j}_-001.mkv
					done ;
					for j in `cat lsV`; do
						echo "../Auxil-contrib/Fs_filter_complex.sh ${j}_-003.mkv \
							${j}-last_4CAT.mkv"
						../Auxil-contrib/Fs_filter_complex.sh ${j}_-003.mkv \
							${j}-last_4CAT.mkv
					done ;
					cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
					cat lsV | sed 's/_fs/_fs_-003_CONCAT/' > lsVl
					mkdir -p ../../Licet_MOV ;

					echo $(basename $0) point R
					#read FAKE
					case "$r" in
						25 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_at0_on_black_nLOGO.mov
							echo $(basename $0) point S
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null"
								./Fs_ALLEG_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null
								mv -v Fs_ALLEG_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point T
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_at0_on_black_nLOGO.mov
								../ALLEG_First_16x9/Fs_ALLEG_at00000_on_lsVf.sh lsVf &> /dev/null
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_on_black_nLOGO.mov
							echo $(basename $0) point U
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG.sh ../ALLEG_16x9/lsVl &> /dev/null"
								./Fs_ALLEG.sh ../ALLEG_16x9/lsVl &> /dev/null
								mv -v Fs_ALLEG_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point V
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_on_black_nLOGO.mov
								../ALLEG_Last_16x9/Fs_ALLEG_on_lsVl.sh lsVl
						;;

						30 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_r30_at0_on_black_nLOGO.mov
							echo $(basename $0) point W
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG_r30_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null"
								./Fs_ALLEG_r30_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null
								mv -v Fs_ALLEG_r30_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point X
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_r30_at0_on_black_nLOGO.mov
								../ALLEG_First_16x9/Fs_ALLEG_r30_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_r30_on_black_nLOGO.mov
							echo $(basename $0) point Y
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG_r30.sh ../ALLEG_16x9/lsVl &> /dev/null"
								./Fs_ALLEG_r30.sh ../ALLEG_16x9/lsVl &> /dev/null
								mv -v Fs_ALLEG_r30_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point Z
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_r30_on_black_nLOGO.mov
								../ALLEG_Last_16x9/Fs_ALLEG_r30_on_lsVl.sh lsVl
						echo $(basename $0) point a
						#read FAKE
						;;

						50 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo $(basename $0) point b
					#read FAKE
					echo "Licence-over done. Now producing the final"
					echo "flowstamped licenced-over video."
					k=`echo $j|sed 's/fs/fL/'`
					echo $k
					echo $(basename $0) point c
					#read FAKE
					for j in `cat lsV` ; do
						echo "###    mkvmerge sometimes would not merge right at all!"
						#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
							#${j}_-002.mkv + ${j}_-003_CONCAT_LICET.mkv
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
							${j}_-002.mkv ${j}_-003_CONCAT_LICET.mkv
						mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
						echo "###    The final:"
						echo "###    $k.mkv"
						echo "###    with licet sequences added at start and end"
						if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
							echo "###    appears to have been made."
						else
							echo "###    seems to have failed."
						fi
						echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
					done

					cd -
				echo $(basename $0) point d
				#read FAKE
				;;

				1920 )
					echo $(basename $0) point e
					#read FAKE
					if [ -e "../Auxil-contrib/EMPTY_20s_AV.mkv" ]
						then
							ln -s ../Auxil-contrib/EMPTY_20s_AV.mkv
					fi
					echo $(basename $0) point f
					#read FAKE
					case "$r" in
						25 )
							EMPTY_5s=EMPTY_5s_AV.mkv
							EMPTY_38s=EMPTY_38s_AV.mkv
						;;

						30 )
							EMPTY_5s=EMPTY_5s_AV1920r30.mkv
							EMPTY_38s=EMPTY_38s_AV1920r30.mkv
						;;

						50 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;

						* )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo \$EMPTY_5s: $EMPTY_5s
					echo \$EMPTY_38s: $EMPTY_38s

					echo $(basename $0) point g
					#read FAKE
					mv -v Fs_4m-/${j}_-001.mkv Fs_4m-/${j}_-002.mkv \
						Fs_4m-/${j}_-003.mkv Fs_4m-/${j}-first.png \
						Fs_4m-/${j}-last.png ../ALLEG_16x9
					cd ../ALLEG_16x9
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo $(basename $0) point h
					#read FAKE
					if [ -e "../Auxil-contrib/$EMPTY_5s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_5s
						else
							echo "../Auxil-contrib/make_empty_mkv.sh 5 $j_asp_cut $wid $r"
							../Auxil-contrib/make_empty_mkv.sh 5 $j_asp_cut $wid $r

							mv -v $EMPTY_5s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_5s
					fi
					echo $(basename $0) point i
					#read FAKE
					if [ -e "../Auxil-contrib/$EMPTY_38s" ]
						then
							ln -s ../Auxil-contrib/$EMPTY_38s
						else
							echo "../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r"
							../Auxil-contrib/make_empty_mkv.sh 38 $j_asp_cut $wid $r
							mv -v $EMPTY_38s ../Auxil-contrib/
							ln -s ../Auxil-contrib/$EMPTY_38s
					fi
					echo "We're in \$j.leni lt 240, we should be in ALLEG_16x9 dir"
					ln -s $EMPTY_5s $j-first.mkv
					echo $(basename $0) point j
					#read FAKE
					ffmpeg -y -i $j-first.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-first.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-first_4CAT.mkv
					ln -s $EMPTY_38s $j-last.mkv
					echo $(basename $0) point k
					#read FAKE
					ffmpeg -y -i $j-last.mkv -async 1 -map 0:v -g 10 \
						-c:v libx264 -r $r -map 0:a -c:a copy -vf \
						movie=$j-last.png\ [logo],[in][logo]\ overlay=0:0\ [out] \
						${j}-last_4CAT.mkv
					cd -
					cd ../ALLEG_16x9 ;
					ln -s ../$fSlog
					ls -l ../$fSlog $fSlog
					echo pwd: ; pwd
					echo "$j.leni lt 240, dir ALLEG_16x9"
					mkdir -p DEL/ ; mv -v *CONCAT.mkv *LICET*.mkv DEL/ ;
					ls -1 *-first_4CAT.mkv|sed 's/-first_4CAT.mkv//' > lsV
					echo $(basename $0) point l
					#read FAKE
					for j in `cat lsV`; do \
						echo "../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
							${j}_-001.mkv"
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT.mkv \
							${j}_-001.mkv
					done ;
					echo $(basename $0) point m
					#read FAKE
					for j in `cat lsV`; do
						echo "../Auxil-contrib/Fs_filter_complex.sh ${j}_-003.mkv \
							${j}-last_4CAT.mkv"
						../Auxil-contrib/Fs_filter_complex.sh ${j}_-003.mkv \
							${j}-last_4CAT.mkv
					done ;
					cat lsV | sed 's/_fs/_fs-first_4CAT_CONCAT/' > lsVf
					cat lsV | sed 's/_fs/_fs_-003_CONCAT/' > lsVl
					mkdir -p ../../Licet_MOV ;

					echo $(basename $0) point n
					#read FAKE
					case "$r" in
						25 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_at0_on_black_nLOGO.mov
							echo $(basename $0) point o1
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null"
								./Fs_ALLEG_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null
								mv -v Fs_ALLEG_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point o2
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_at0_on_black_nLOGO.mov
								../ALLEG_First_16x9/Fs_ALLEG_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_on_black_nLOGO.mov
							echo $(basename $0) point o3
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG.sh ../ALLEG_16x9/lsVl &> /dev/null"
								./Fs_ALLEG.sh ../ALLEG_16x9/lsVl &> /dev/null
								mv -v Fs_ALLEG_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point o4
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_on_black_nLOGO.mov
								../ALLEG_Last_16x9/Fs_ALLEG_on_lsVl.sh lsVl
						echo $(basename $0) point o5
						#read FAKE
						;;

						30 )
							workdir=`pwd`
							echo $workdir
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_r30_at0_on_black_nLOGO.mov
							echo $(basename $0) point p1
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_First_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG_r30_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null"
								./Fs_ALLEG_r30_at00000.sh ../ALLEG_16x9/lsVf &> /dev/null
								mv -v Fs_ALLEG_r30_at0_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point p2
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_r30_at0_on_black_nLOGO.mov
								../ALLEG_First_16x9/Fs_ALLEG_r30_at00000_on_lsVf.sh lsVf
							mov_file=$workdir/../../Licet_MOV/Fs_ALLEG_r30_on_black_nLOGO.mov
							echo $(basename $0) point p3
							#read FAKE
							if [ ! -e "$mov_file" ] ; then
								cd ../ALLEG_Last_16x9
								ln -s ../$fSlog
								ls -l ../$fSlog $fSlog
								echo "./Fs_ALLEG_r30.sh ../ALLEG_16x9/lsVl &> /dev/null"
								./Fs_ALLEG_r30.sh ../ALLEG_16x9/lsVl &> /dev/null
								mv -v Fs_ALLEG_r30_on_black_nLOGO.mov ../../Licet_MOV/
								cd -
							echo $(basename $0) point p4
							#read FAKE
							fi
								ln -s ../../Licet_MOV/Fs_ALLEG_r30_on_black_nLOGO.mov
								../ALLEG_Last_16x9/Fs_ALLEG_r30_on_lsVl.sh lsVl
						echo $(basename $0) point p5
						#read FAKE
						;;

						50 )
							echo "Some of the values:"
							echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
							echo "is not currently supported."
							echo ; echo ; echo ;
							echo "Your video $i.mkv"
							echo "was not worked for this functionality for the reasons above."
							echo ; echo ; echo ;
						;;
					esac

					echo $(basename $0) point q
					#read FAKE
					echo "Licence-over done. Now producing the final"
					echo "flowstamped licenced-over video."
					k=`echo $j|sed 's/fs/fL/'`
					echo $k
					echo $(basename $0) point r
					#read FAKE
					for j in `cat lsV` ; do
						echo "###    mkvmerge sometimes would not merge right at all!"
						#mkvmerge -o ../../$k.mkv $j-first_4CAT_CONCAT_LICET.mkv + \
							#${j}_-002.mkv + ${j}_-003_CONCAT_LICET.mkv
						../Auxil-contrib/Fs_filter_complex.sh $j-first_4CAT_CONCAT_LICET.mkv \
							${j}_-002.mkv ${j}_-003_CONCAT_LICET.mkv
						mv -v $j-first_4CAT_CONCAT_LICET_CONCAT.mkv ../../$k.mkv
						echo "###    The final:"
						echo "###    $k.mkv"
						echo "###    with licet sequences added at start and end"
						if [[ -e "../../$k.mkv" && -s "../../$k.mkv" ]] ; then
							echo "###    appears to have been made."
						else
							echo "###    seems to have failed."
						fi
						echo "###    It is now $(date +'%Y-%m-%d %H:%M:%S')"
					done

					cd -
				;;
			esac

			;;

			* )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;
		esac
		cd ../
	fi

cd ../
mv -v Cut4Licet.d/ DEL/

echo ""
echo "############################################################################"
echo "Reminder: You absolutely use this program solely at your own responsability!"
echo "############################################################################"
echo ""

echo $(basename $0) point zz
#read FAKE
exit 0
