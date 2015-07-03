#!/bin/bash
#
# Fs_filter_complex.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."

echo "###    TO DO: Surely array should apply here. Some day, hopefully..."

if [ ! -z "$1" ] && echo "Argument #1 = $1" && [ ! -z "$2" ] && echo "Argument #2 = $2"
	then
	if [ ! -z "$3" ] && echo "Argument #3 = $3"
		then
		if [ ! -z "$4" ] && echo "Argument #4 = $4"
			then
			if [ ! -z "$5" ] && echo "Argument #5 = $5"
				then
				if [ ! -z "$6" ] && echo "Argument #6 = $6"
					then

						r1=$(echo $1|sed 's/.mkv//')

						r2=$(echo $2|sed 's/.mkv//')

						r3=$(echo $3|sed 's/.mkv//')

						r4=$(echo $4|sed 's/.mkv//')

						r5=$(echo $5|sed 's/.mkv//')

						r6=$(echo $6|sed 's/.mkv//')

						ffmpeg -i $r1.mkv -i $r2.mkv -i $r3.mkv -i $r4.mkv \
							-i $r5.mkv -i $r6.mkv -filter_complex \
							"[0:0] [0:1] [1:0] [1:1] [2:0] [2:1] [3:0] [3:1] [4:0] [4:1] [5:0] [5:1] concat=n=6:v=1:a=1 [v] [a]" \
							-map "[v]" -map "[a]" -c:v libx264 -g 10 \
							-c:a libvorbis ${r1}_CONCAT.mkv

						echo ${r1}_CONCAT.mkv made

					else

						r1=$(echo $1|sed 's/.mkv//')

						r2=$(echo $2|sed 's/.mkv//')

						r3=$(echo $3|sed 's/.mkv//')

						r4=$(echo $4|sed 's/.mkv//')

						r5=$(echo $5|sed 's/.mkv//')

						ffmpeg -i $r1.mkv -i $r2.mkv -i $r3.mkv -i $r4.mkv \
							-i $r5.mkv -filter_complex \
							"[0:0] [0:1] [1:0] [1:1] [2:0] [2:1] [3:0] [3:1] [4:0] [4:1] concat=n=5:v=1:a=1 [v] [a]" \
							-map "[v]" -map "[a]" -c:v libx264 -g 10 \
							-c:a libvorbis ${r1}_CONCAT.mkv

						echo ${r1}_CONCAT.mkv made

				fi
				else

					r1=$(echo $1|sed 's/.mkv//')

					r2=$(echo $2|sed 's/.mkv//')

					r3=$(echo $3|sed 's/.mkv//')

					r4=$(echo $4|sed 's/.mkv//')

					ffmpeg -i $r1.mkv -i $r2.mkv -i $r3.mkv -i $r4.mkv \
						-filter_complex \
						"[0:0] [0:1] [1:0] [1:1] [2:0] [2:1] [3:0] [3:1] concat=n=4:v=1:a=1 [v] [a]" \
						-map "[v]" -map "[a]" -c:v libx264 -g 10 \
						-c:a libvorbis ${r1}_CONCAT.mkv

					echo ${r1}_CONCAT.mkv done

			fi
			else

				r1=$(echo $1|sed 's/.mkv//')

				r2=$(echo $2|sed 's/.mkv//')

				r3=$(echo $3|sed 's/.mkv//')

				ffmpeg -i $r1.mkv -i $r2.mkv -i $r3.mkv -filter_complex \
					'[0:0] [0:1] [1:0] [1:1] [2:0] [2:1] concat=n=3:v=1:a=1 [v] [a]' \
					-map "[v]" -map "[a]" -c:v libx264 -g 10 \
					-c:a libvorbis ${r1}_CONCAT.mkv

				echo ${r1}_CONCAT.mkv done

		fi
		else

			r1=$(echo $1|sed 's/.mkv//')

			r2=$(echo $2|sed 's/.mkv//')

			ffmpeg -i $r1.mkv -i $r2.mkv -filter_complex \
				"[0:0] [0:1] [1:0] [1:1] concat=n=2:v=1:a=1 [v] [a]" \
				-map "[v]" -map "[a]" -c:v libx264 -g 10 \
				-c:a libvorbis ${r1}_CONCAT.mkv

			echo ${r1}_CONCAT.mkv made

	fi
	else

		echo "Give two (or three... or max, six) mkv files to concat, first"
		echo "video and first audio stream of each one, will be concat"

fi
