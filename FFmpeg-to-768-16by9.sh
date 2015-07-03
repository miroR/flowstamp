#|/bin/bash
#
# FFmpeg-to-768-16by9.sh -- this script is part of Flowstamp program
#
# please replace the two occurrences of '???' with '????' if the extension of
# your videos is four letters and not three, like .webm
#
# See the README of the Flowstamp package for instructions.
#
ls -1 *.??? | cut -d. -f1 > ls-1_vid-to-768
for i in `cat ls-1_vid-to-768`
	do
		nice -n19  ffmpeg -i $i.??? -async 1  -map 0:v -g 10 \
			-c:v libx264 -map 0:a -c:a libvorbis \
			-vf scale=768:576,setsar=1/1,setdar=16/9  ${i}_to-768-16by9.mkv
		echo
		echo
		echo
		echo "####################################################"
		echo
		echo
		echo "Try and move ${i}_to-768-16by9.mkv into"
		echo "the Flowstamp's directory and run ./flowstamp on it"
		echo
		echo
		echo "####################################################"
		echo
		echo
		echo
	done
