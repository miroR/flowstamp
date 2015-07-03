#!/bin/bash
#
# make_empty_mkv.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."
echo pwd:
pwd

if [ ! -n "$1" ] || [ ! -n "$2" ] || [ ! -n "$3" ] || [ ! -n "$4" ]
	then
	echo "`basename $0` needs four arguments,"
	echo "$1 is the length in seconds and can be"
	echo "5, 20, 38, 100 and 190"
	echo "$2 is the fractional part of the aspect ratio and can be"
	echo "at this time either 3333 or 7778 only, where give 3333 for 4/3"
	echo "and give 7778 for 16/9"
	echo "$3 is the width of the video,"
	echo "and probably will work for only 768 and 1920 at this time"
	echo "$4 is the rate in fps, 25, 30 and 50 only will be tested,"
	echo "and floats are not expected to work at all."
	echo "Tweak it yourself for any other than the values above."
	echo "and then tweak the scripts that call this script and those"
	echo "that need and use its resulting EMPTY<...>.mkv videos."
fi

# To be able to add a video sequence to your video, it must be same or
# compatible size, aspect, rate and more. And not all common sizes and rates
# are supported yet. Compatible means for some manipulation properties do not
# have to be exactly same (such as you can overlay span onto a pal size video
# --although you can not add spal licet sequence to it).
#
# This note is appropriate here, because here we produce the base empty video
# onto which the pictures taken from your video will overlay, for the licet
# start and ending sequence to be added.
#
# In this mid-2015 I wish I might be starting my attempts at adapting the
# script for most standard sizes and rates, which there are numerous... Maybe
# even too numerous for the method I was able to deploy...
#
# Still, the sizes and rates already supported are enough for me at this time,
# as they are pretty appropriate for purposes such as lots of old DVD/old TV
# capture card resolution videos, and also lots of people have those the most
# of, and they are well suited for wholesale archiving of those, and some other
# supported sizes and rates here are suitable for, say, the HD cellphone camera
# footage.
#
# As far as old DVD/TV standards, pls. see the note on my use of 768:576
# instead of the more common 720:576 in the README.
#
# Surely at least all the video sizes listed in 'man ffmpeg-all' ought to be
# supported, just I need some sooner than other sizes... And similarly for the
# rates.

echo $1 > mkv_len_tmp
mkv_len=`cat mkv_len_tmp`
echo $mkv_len

echo $2 > mkv_asp_tmp
mkv_asp=`cat mkv_asp_tmp`
echo $mkv_asp

echo $3 > mkv_wid_tmp
mkv_wid=`cat mkv_wid_tmp`
echo $mkv_wid

echo $4 > mkv_rate_tmp
mkv_rate=`cat mkv_rate_tmp`
echo $mkv_rate

# This is going to be a script done in ignorant repetitive way, as I don't have
# weeks of time available to study bash and find the right way to do it.
# Really sorry!

case "$mkv_wid" in
	768 )
	case "$mkv_rate" in
		25 )
		case "$mkv_asp" in
			3333 )

				ln -sf ../Auxil-contrib/EMPTY_20s_AV_1333.mkv

				if [ -e "../Auxil-contrib/EMPTY_60s_AV_1333.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_60s_AV_1333.mkv
					else
						mkvmerge -o EMPTY_60s_AV_1333.mkv EMPTY_20s_AV_1333.mkv + \
							EMPTY_20s_AV_1333.mkv + EMPTY_20s_AV_1333.mkv

						mv -v EMPTY_60s_AV_1333.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_60s_AV_1333.mkv
				fi

				if [ -e "../Auxil-contrib/EMPTY_180s_AV_1333.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_180s_AV_1333.mkv
					else
						mkvmerge -o EMPTY_180s_AV_1333.mkv EMPTY_60s_AV_1333.mkv + \
							EMPTY_60s_AV_1333.mkv + EMPTY_60s_AV_1333.mkv

						mv -v EMPTY_180s_AV_1333.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_180s_AV_1333.mkv
				fi

				case "$mkv_len" in
					5 )
						mkvmerge -o EMPTY_20s_AV_1333_.mkv --split timecodes:5s \
							EMPTY_20s_AV_1333.mkv
						rm -v EMPTY_20s_AV_1333_-002.mkv
						mv -v EMPTY_20s_AV_1333_-001.mkv EMPTY_5s_AV_1333.mkv
					;;

					20 )
					echo "Nothing to do. Video there already, Namely"
					echo "20s EMPTY aspect 1.333 (4/3) video is currently shipped"
					echo "with the Flowstamp program."
					;;

					38 )
						mkvmerge -o EMPTY_60s_AV_1333_.mkv --split timecodes:38s \
							EMPTY_60s_AV_1333.mkv
						rm -v EMPTY_60s_AV_1333_-002.mkv
						mv -v EMPTY_60s_AV_1333_-001.mkv EMPTY_38s_AV_1333.mkv
					;;

					100 )
						mkvmerge -o EMPTY_180s_AV_1333_.mkv --split timecodes:100s \
							EMPTY_180s_AV_1333.mkv
						rm -v EMPTY_180s_AV_1333_-002.mkv
						mv -v EMPTY_180s_AV_1333_-001.mkv EMPTY_100s_AV_1333.mkv
					;;

					190 )
						mkvmerge -o EMPTY_200s_AV_1333.mkv EMPTY_180s_AV_1333.mkv + \
							EMPTY_20s_AV_1333.mkv
						mkvmerge -o EMPTY_200s_AV_1333_.mkv --split timecodes:190s \
							EMPTY_200s_AV_1333.mkv
						rm -v EMPTY_200s_AV_1333_-002.mkv
						mv -v EMPTY_200s_AV_1333_-001.mkv EMPTY_190s_AV_1333.mkv
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported. Can't do anything with it."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;


				esac

			;;

			7778 )

				if [ -e "../Auxil-contrib/EMPTY_20s_AV.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_20s_AV.mkv
					else
						ln -sf ../Auxil-contrib/EMPTY_20s_AV_1333.mkv
						ffmpeg -i EMPTY_20s_AV_1333.mkv -c:v libx264 -g 5 -c:a copy \
							-vf scale=768:576,setdar=16/9,setsar=4/3 EMPTY_20s_AV.mkv

						mv -v EMPTY_20s_AV.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_20s_AV.mkv
				fi

				if [ -e "../Auxil-contrib/EMPTY_60s_AV.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_60s_AV.mkv
					else
						mkvmerge -o EMPTY_60s_AV.mkv EMPTY_20s_AV.mkv + \
							EMPTY_20s_AV.mkv + EMPTY_20s_AV.mkv

						mv -v EMPTY_60s_AV.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_60s_AV.mkv
				fi

				if [ -e "../Auxil-contrib/EMPTY_180s_AV.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_180s_AV.mkv
					else
						mkvmerge -o EMPTY_180s_AV.mkv EMPTY_60s_AV.mkv + \
							EMPTY_60s_AV.mkv + EMPTY_60s_AV.mkv

						mv -v EMPTY_180s_AV.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_180s_AV.mkv
				fi

				case "$mkv_len" in
					5 )
						mkvmerge -o EMPTY_20s_AV_.mkv --split timecodes:5s \
							EMPTY_20s_AV.mkv
						rm -v EMPTY_20s_AV_-002.mkv
						mv -v EMPTY_20s_AV_-001.mkv EMPTY_5s_AV.mkv
					;;

					20 )
					echo "Nothing to do. Video there already, Namely, while"
					echo "20s EMPTY aspect 1.778 (16/9) video is NOT currently shipped"
					echo "with the Flowstamp program, the conversion is trivial and"
					echo "already done above first thing for 7778 case."
					;;

					38 )
						mkvmerge -o EMPTY_60s_AV_.mkv --split timecodes:38s \
							EMPTY_60s_AV.mkv
						rm -v EMPTY_60s_AV_-002.mkv
						mv -v EMPTY_60s_AV_-001.mkv EMPTY_38s_AV.mkv
					;;

					100 )
						mkvmerge -o EMPTY_180s_AV_.mkv --split timecodes:100s \
							EMPTY_180s_AV.mkv
						rm -v EMPTY_180s_AV_-002.mkv
						mv -v EMPTY_180s_AV_-001.mkv EMPTY_100s_AV.mkv
					;;

					190 )
						mkvmerge -o EMPTY_200s_AV.mkv EMPTY_180s_AV.mkv + \
							EMPTY_20s_AV.mkv
						mkvmerge -o EMPTY_200s_AV_.mkv --split timecodes:190s \
							EMPTY_200s_AV.mkv
						rm -v EMPTY_200s_AV_-002.mkv
						mv -v EMPTY_200s_AV_-001.mkv EMPTY_190s_AV.mkv
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported. Can't do anything with it."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;


				esac

			;;

			* )

			echo "Value \$mkv_asp is not among the hard coded values in the script"
			echo "I can't do anything with it currently."
			;;

		esac
		;;

		30 )
		case "$mkv_asp" in
			3333 )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;

			7778 )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;

			* )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;

		esac
		;;

		50 )
		case "$mkv_asp" in
			3333 )

				if [ -e "../Auxil-contrib/EMPTY_20s_AVr50_1333.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_20s_AVr50_1333.mkv
					else
						ln -sf ../Auxil-contrib/EMPTY_20s_AV_1333.mkv
						ffmpeg -i EMPTY_20s_AV_1333.mkv -c:v libx264 -g 5 -c:a copy \
							-vf scale=768:576,setdar=4/3,setsar=1/1 -r 50 \
							EMPTY_20s_AVr50_1333.mkv

						mv -v EMPTY_20s_AVr50_1333.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_20s_AVr50_1333.mkv
				fi

				if [ -e "../Auxil-contrib/EMPTY_60s_AVr50_1333.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_60s_AVr50_1333.mkv
					else
						mkvmerge -o EMPTY_60s_AVr50_1333.mkv EMPTY_20s_AVr50_1333.mkv + \
							EMPTY_20s_AVr50_1333.mkv + EMPTY_20s_AVr50_1333.mkv

						mv -v EMPTY_60s_AVr50_1333.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_60s_AVr50_1333.mkv
				fi

				if [ -e "../Auxil-contrib/EMPTY_180s_AVr50_1333.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_180s_AVr50_1333.mkv
					else
						mkvmerge -o EMPTY_180s_AVr50_1333.mkv EMPTY_60s_AVr50_1333.mkv + \
							EMPTY_60s_AVr50_1333.mkv + EMPTY_60s_AVr50_1333.mkv

						mv -v EMPTY_180s_AVr50_1333.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_180s_AVr50_1333.mkv
				fi

				case "$mkv_len" in
					5 )
						mkvmerge -o EMPTY_20s_AVr50_1333_.mkv --split timecodes:5s \
							EMPTY_20s_AVr50_1333.mkv
						rm -v EMPTY_20s_AVr50_1333_-002.mkv
						mv -v EMPTY_20s_AVr50_1333_-001.mkv EMPTY_5s_AVr50_1333.mkv
					;;

					20 )
					echo "Nothing to do. Video there already."
					echo "20s EMPTY aspect 1.333 (4/3) 50/1 rate video"
					echo "has been made a few lines above, the"
					echo "EMPTY_20s_AVr50_1333.mkv"
					;;

					38 )
						mkvmerge -o EMPTY_60s_AVr50_1333_.mkv --split timecodes:38s \
							EMPTY_60s_AVr50_1333.mkv
						rm -v EMPTY_60s_AVr50_1333_-002.mkv
						mv -v EMPTY_60s_AVr50_1333_-001.mkv EMPTY_38s_AVr50_1333.mkv
					;;

					100 )
						mkvmerge -o EMPTY_180s_AVr50_1333_.mkv --split timecodes:100s \
							EMPTY_180s_AVr50_1333.mkv
						rm -v EMPTY_180s_AVr50_1333_-002.mkv
						mv -v EMPTY_180s_AVr50_1333_-001.mkv EMPTY_100s_AVr50_1333.mkv
					;;

					190 )
						mkvmerge -o EMPTY_200s_AVr50_1333.mkv EMPTY_180s_AVr50_1333.mkv + \
							EMPTY_20s_AVr50_1333.mkv
						mkvmerge -o EMPTY_200s_AVr50_1333_.mkv --split timecodes:190s \
							EMPTY_200s_AVr50_1333.mkv
						rm -v EMPTY_200s_AVr50_1333_-002.mkv
						mv -v EMPTY_200s_AVr50_1333_-001.mkv EMPTY_190s_AVr50_1333.mkv
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported. Can't do anything with it."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;

				esac

			;;

			7778 )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ""
				echo ""
			;;

			* )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ""
				echo ""
			;;

		esac
		;;

	esac
	;;

	1920 )
	case "$mkv_rate" in
		25 )
		case "$mkv_asp" in
			3333 )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ""
				echo ""
			;;

			7778 )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;

			* )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;

		esac
		;;

		30 )
		case "$mkv_asp" in
			3333 )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;

			7778 )

				if [ -e "../Auxil-contrib/EMPTY_20s_AV1920r30.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_20s_AV1920r30.mkv
					else
						ln -sf ../Auxil-contrib/EMPTY_20s_AV_1333.mkv
						ffmpeg -i EMPTY_20s_AV_1333.mkv -c:v libx264 -g 5 -c:a copy \
							-vf scale=1920:1080,setdar=16/9,setsar=1/1 -r 30 \
							EMPTY_20s_AV1920r30.mkv

						mv -v EMPTY_20s_AV1920r30.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_20s_AV1920r30.mkv
				fi

				if [ -e "../Auxil-contrib/EMPTY_60s_AV1920r30.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_60s_AV1920r30.mkv
					else
						mkvmerge -o EMPTY_60s_AV1920r30.mkv EMPTY_20s_AV1920r30.mkv + \
							EMPTY_20s_AV1920r30.mkv + EMPTY_20s_AV1920r30.mkv

						mv -v EMPTY_60s_AV1920r30.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_60s_AV1920r30.mkv
				fi

				if [ -e "../Auxil-contrib/EMPTY_180s_AV1920r30.mkv" ]
					then
						ln -sf ../Auxil-contrib/EMPTY_180s_AV1920r30.mkv
					else
						mkvmerge -o EMPTY_180s_AV1920r30.mkv EMPTY_60s_AV1920r30.mkv + \
							EMPTY_60s_AV1920r30.mkv + EMPTY_60s_AV1920r30.mkv

						mv -v EMPTY_180s_AV1920r30.mkv ../Auxil-contrib/
						ln -sf ../Auxil-contrib/EMPTY_180s_AV1920r30.mkv
				fi

				case "$mkv_len" in
					5 )
						mkvmerge -o EMPTY_20s_AV1920r30_.mkv --split timecodes:5s \
							EMPTY_20s_AV1920r30.mkv
						rm -v EMPTY_20s_AV1920r30_-002.mkv
						mv -v EMPTY_20s_AV1920r30_-001.mkv EMPTY_5s_AV1920r30.mkv
					;;

					20 )
						if [ -e "../Auxil-contrib/EMPTY_20s_AV1920r30.mkv" ]
							then
								ln -sf ../Auxil-contrib/EMPTY_20s_AV1920r30.mkv
							else
								ln -sf ../Auxil-contrib/EMPTY_20s_AV_1333.mkv
								ffmpeg -i EMPTY_20s_AV_1333.mkv -c:v libx264 -g 5 -c:a copy \
									-vf scale=1920:1080,setdar=16/9,setsar=1/1 -r 30 \
									EMPTY_20s_AV1920r30.mkv

								mv -v EMPTY_20s_AV1920r30.mkv ../Auxil-contrib/
								ln -sf ../Auxil-contrib/EMPTY_20s_AV1920r30.mkv
						fi
					;;

					38 )
						mkvmerge -o EMPTY_60s_AV1920r30_.mkv --split timecodes:38s \
							EMPTY_60s_AV1920r30.mkv
						rm -v EMPTY_60s_AV1920r30_-002.mkv
						mv -v EMPTY_60s_AV1920r30_-001.mkv EMPTY_38s_AV1920r30.mkv
					;;

					100 )
						mkvmerge -o EMPTY_180s_AV1920r30_.mkv --split timecodes:100s \
							EMPTY_180s_AV1920r30.mkv
						rm -v EMPTY_180s_AV1920r30_-002.mkv
						mv -v EMPTY_180s_AV1920r30_-001.mkv EMPTY_100s_AV1920r30.mkv
					;;

					190 )
						mkvmerge -o EMPTY_200s_AV1920r30.mkv EMPTY_180s_AV1920r30.mkv + \
							EMPTY_20s_AV1920r30.mkv
						mkvmerge -o EMPTY_200s_AV1920r30_.mkv --split timecodes:190s \
							EMPTY_200s_AV1920r30.mkv
						rm -v EMPTY_200s_AV1920r30_-002.mkv
						mv -v EMPTY_200s_AV1920r30_-001.mkv EMPTY_190s_AV1920r30.mkv
					;;

					* )
						echo "Some of the values:"
						echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
						echo "is not currently supported. Can't do anything with it."
						echo ; echo ; echo ;
						echo "Your video $i.mkv"
						echo "was not worked for this functionality for the reasons above."
						echo ; echo ; echo ;
					;;


				esac

			;;

			* )
				echo "Some of the values:"
				echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
				echo "is not currently supported. Can't do anything with it."
				echo ; echo ; echo ;
				echo "Your video $i.mkv"
				echo "was not worked for this functionality for the reasons above."
				echo ; echo ; echo ;
			;;

		esac
		;;

	esac
	;;

	* )
		echo "Some of the values:"
		echo "\$mkv_asp: $mkv_asp, \$mkv_rate: $mkv_rate, and \$mkv_wid: $mkv_wid,"
		echo "is not currently supported. Can't do anything with it."
		echo ; echo ; echo ;
		echo "Your video $i.mkv"
		echo "was not worked for this functionality for the reasons above."
		echo ""
		echo ""
	;;

esac
