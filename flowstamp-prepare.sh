#!/bin/bash
#
# flowstamp-prepare.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#
echo
echo "This script helps newbies to choose options for the next Flowstamp"
echo "run."
echo
echo "If you haven't edited the files yourself, but only used this script"
echo "to set the settings (options) for the previous run, we can now"
echo "first restore defaults. Low reliability. Use the digitally signed"
echo "archive for more/better."
echo
echo "Hit Enter, to first get back the defaults in case of having made"
echo "some prevoious tries!"
echo
echo "No action will be taken yet if there have been no previuos changes"
echo "to the scripts, and there is nothing to restore."
echo
echo "========================================"
echo
read FAKE ;

mkdir -p JIC/

if [ -e "flowstamp_KEEP" ]
	then
		diff flowstamp flowstamp_KEEP > flowstamp.diff
		if [ -e "flowstamp.diff" ]
			then
				if [ ! -s "flowstamp.diff" ]
					then
						echo "flowstamp and flowstamp_KEEP same"
					else
#read FAKE
						cp -a flowstamp_KEEP flowstamp
				fi
		fi
	else
		cp -a flowstamp flowstamp_KEEP
fi
if [ -e "flowS_noSum_KEEP" ]
	then
		diff flowS_noSum flowS_noSum_KEEP > flowS_noSum.diff
		if [ -e "flowS_noSum.diff" ]
			then
				if [ ! -s "flowS_noSum.diff" ]
					then
						echo "flowS_noSum and flowS_noSum_KEEP same"
					else
#read FAKE
						cp -a flowS_noSum_KEEP flowS_noSum
				fi
		fi
	else
		cp -a flowS_noSum flowS_noSum_KEEP
fi
if [ -e "flowS_noSum_KEEP" ]
	then
		mv flowS_noSum_KEEP JIC/flowS_noSum_KEEP_`date +%s`
fi
cp -a flowS_noSum flowS_noSum_KEEP
rm -f no-licet no-sum-stamping Licet/Make_licet_TXT/licet-no-expert
ls -1 *_fs.mkv | grep -v ls-1_fs_mkv > ls-1_fs_mkv
for i in `cat ls-1_fs_mkv` ; do
	if [ -e "$i" ] ; then
		if [ ! -s "$i" ] ; then
		echo "removing empty file:"
			rm -v $i
		fi
	fi
done
rm ls-1_fs_mkv

echo "You can achieve this functionality by editing the relevant lines in the"
echo "flowstamp (proper) script, and other scripts, yourself. This script is"
echo "to aide the less advanced users."
echo
echo "Pls. read the README and/or the scripts if you don't understand the"
echo "questions below."
echo
echo "You can interrupt this script at any time by Ctrl-C, which means keeping"
echo "down the Control key and while it's down hitting letter C."
echo
echo "E.g., to keep the defaults you can just Ctrl-C now to exit this script!"
echo
echo "That can be fine for familiarizing with the program, but pls., for production,"
echo "replace at least the line \"www.CroatiaFidelis.hr\" so stupid/malicious"
echo "people like those in the regime currently in power in Croatia, wouldn't"
echo "blame your works on me (and I don't want credit for stuff not mine"
echo "either). You can do that in some of the next options of this script."
echo
echo "Tired, cutting corners to see the first release finally out. Will"
echo "improve later."
echo
echo "========================================"
echo
echo "If you want the licet functionality (visit README for details),"
echo "type capital three letters YES, anything else will *not* do the licet:"
read licet_reply
if [ "$licet_reply" == "YES" ] ; then
	echo "Do you want just the licet functionality, no stamping (watermarking)"
	echo "in any way of the whole video?"
	echo "If so, pls. type capital four letters ONLY, anything else"
	echo "has no effect:"
	read only_licet
	if [ "$only_licet" == "ONLY" ] ; then
			sed -i.bak 's/\#touch \${i}_fs.mkv/touch \${i}_fs.mkv/' flowstamp
		else
			echo "========================================"
			echo
			echo "Do you want to stamp your video only with words? No calculating the"
			echo "SHA256 sum of the video and stamping it in btwn the two (very short)"
			echo "lines of words?"
			echo "If so, pls. type capital five letters NOSUM, anything else"
			echo "overlays the sum:"
			read no_sum_stamping
			if [ "$no_sum_stamping" == "NOSUM" ] ; then
				sed -i.bak 's/\#touch no-sum-stamping/touch no-sum-stamping/' flowstamp
			fi

			echo "========================================"
			echo
			echo "You probably saw, if I keep posted somewhere, my demo video. Or tried"
			echo "flowstamping a video and you noticed that the first (very short)"
			echo "line of words was, the top line: \"Flowstamp overlayed\", give  a text"
			echo "string of similar number of character that you want to see instead"
			echo "(if too short, you leave too much space between, if too long, it will"
			echo "overlap). Ah, and, I guess, no special characters, plain Unicode text"
			echo "(but Asian codepages I have not tested)."
			echo
			echo "So your name/phrase/other words instead of \"Flowstamp overlayed\" are:"
			read user_top_line
			sed -i.bak "s/Flowstamp overlayed/$user_top_line/" flowS_noSum
		
			echo "And the bottom line: \"www.CroatiaFidelis.hr\", which is not your"
			echo "NGO's website but mine, so give the overlay to your videos of something"
			echo "yours, the website or your name or something else, similar number of"
			echo "chars for the same reason as above said for top line:"
			echo
			echo "So your name/phrase/other words instead of \"www.CroatiaFidelis.hr\" are:"
			read user_btm_line
			sed -i.bak "s/\"www.CroatiaFidelis.hr\"/\"$user_btm_line\"/" flowS_noSum
	fi
	echo ""
	echo "========================================"
	echo
	echo "DISREGARD THIS SECTION, I THINK IT'S CURRENTLY BROKEN"
	echo "Just hit Enter to go passed it."
	echo "This program uses plain text files (well, with pango markup) to"
	echo "create images and then video overlay for start and end of your"
	echo "video. It can use a script to do so from an arbitrary text of"
	echo "yours, but that script, Licet_prep.sh, is in dirty and experimental"
	echo "phase. You can try using it, or you can have it make a clean"
	echo "Licet/Make_licet_TXT/ directory from my text."
	echo ""
	echo "In that directory you can then edit those files for you. Yes, if you"
	echo "don't touch any of the markup at start and end of the files,"
	echo "all from <markup ... to the last > in the top, usually just one or"
	echo "two lines, and all from < ... to /markup> in the bottom, usually"
	echo "just (part of) one line, the last line, if you don't touch any of"
	echo "that markup but replace"
	echo "my text with your text, then you can go that way, and not use the"
	echo "Licet_prep.sh script at all, after its first run, and still get all"
	echo "of your text turned into images and overlayed onto your video(s)."
	echo ""
	echo "Just you really have to leave all the markup in place. If any of"
	echo "especially < or > went missing, nothing will work right if at all."
	echo "You can change the settings in the markup, of course, see README and"
	echo "other docs."
	echo ""
	echo "If you want to try and use the script, don't type YES here."
	echo ""
	echo "If you want to get that script to make files that you can edit in"
	echo "the way I just explained, then type YES here."
	echo ""
	echo "DISREGARD THIS SECTION, I THINK IT'S CURRENTLY BROKEN"
	echo ""
	echo "Just hit Enter to go passed it."
	echo "========================================"
	read licet_no_expert
	if [ "$licet_no_expert" == "YES" ] ; then
		sed -i.bak 's/\#touch licet-no-expert/touch licet-no-expert/' \
			Licet/Make_licet_TXT/Licet_prep.sh
	fi

else
	echo "========================================"
	echo "No licet. Only stamping (watermarking) the video(s)"
	sed -i.bak 's/\#touch no-licet/touch no-licet/' flowstamp

	echo "Do you want to stamp your video(s) only with words? No calculating"
	echo "SHA256 sum of the video(s) and stamping it in btwn the two"
	echo "(very short) lines of words?"
	echo "If so, pls. type capital five letters NOSUM, anything else"
	echo "overlays the sums:"
	read no_sum_stamping
	if [ "$no_sum_stamping" == "NOSUM" ] ; then
		sed -i.bak 's/\#touch no-sum-stamping/touch no-sum-stamping/' flowstamp
	fi
	echo "========================================"
	echo
	echo "You probably saw, if I keep posted somewhere, my demo video. Or tried"
	echo "flowstamping a video and you noticed that the first (very short)"
	echo "line of words was, the top line: \"Flowstamp overlayed\", give  a text"
	echo "string of similar number of characters that you want to see instead"
	echo "(if too short, you leave too much space, if too long, it will ovelap)."
	echo "Ah, and no special characters, plain Unicode (meaning letters used in"
	echo "names worldwide; well, haven't tried all, such as Asian):"
	read user_top_line
	sed -i.bak "s/Flowstamp overlayed/$user_top_line/" flowS_noSum

	echo "And the bottom line: \"www.CroatiaFidelis.hr\", which is not your"
	echo "NGO's website but mine, so give the overlay to your videos something"
	echo "yours, the website or your name or something else, similar number of"
	echo "chars for the same reason as top line:"
	read user_btm_line
	sed -i.bak "s/\"www.CroatiaFidelis.hr\"/\"$user_btm_line\"/" flowS_noSum
echo "========================================"
fi

echo "And finally, guess since you are reading here, then you may have acquainted"
echo "yourself with the Flowstamp by now, and maybe you want to remove the delay"
echo "at start of the script."
echo
echo "Do you want to remove the delay, and the need to hit Enter, at the start"
echo "of Flowstamp session? If you do, then type uppercase YES here."
echo
read remove_delay
if [ "$remove_delay" == "YES" ] ; then
		sed -i.bak 's/^sleep 3 ;/\#sleep 3 ;/' flowstamp
		sed -i.bak 's/read FAKE ; \#delay/\#read FAKE ; \#delay/' flowstamp
fi

echo "========================================"
echo "Your settings are in the script. Now you can run the flowstamp program."
echo "Just again, this is not the substitute for the README, and maybe you"
echo "might need more studying and tweaking to get my Flowstamp program to"
echo "work with your videos."
echo
echo "May you live a happy life and not do evil like Google did to me!"
echo "Run ./flowstamp (<options>) now."
