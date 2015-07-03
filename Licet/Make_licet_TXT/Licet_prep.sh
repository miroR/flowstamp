#!/bin/bash
#
# Licet_prep.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#
# This script is run on manually prepared text file for the Licet functionality
# of the Flowstamp program. See README.licet
#
# This serves to demonstrate for less advanced users how the text is, with only
# that manual editing of text which only humans can do, prepared
# to be "convert ... pango:@that_text ..." into images for video overlays.
#
# We will transform into images, the text from the non-technical file, included
# in the Flowstamp package, flowstamp_HR_U_demo.txt, which this script takes as the
# first argument.
#
# I actually decided to write this script when the first few, and already in
# both e and h, English and Croatian, separate text files for the final Licet
# overlay were there and understood how much more splitting and file naming
# there would be, too much for manually doing it. So in the demo video you will
# see the text that I work here after \"Enough of Schmoogle\" (and I then
# arrange the already done ones with the new ones). But the principle is just
# the same had I not had those already done at this time. Once the separate
# text files from the starting text are ready, they probably need to be
# manually edited for some style and similar. But the splitting from the one
# starting file into new text files is done by this script. Use your
# immagination, or rewrite this script/make a different one if you can't do
# with two equal colums for two different languages, and a center column, or
# can't use those columns to your satisfaction.
#
# Since this is a demonstration with real files and which can be repeated by
# users as they study my scripts, here's my command line that I used
# (important):
#
# ./Licet_prep.sh flowstamp_HR_U_demo.txt "lost the honest and knowledgeable"
#

echo -e "\n===> $(basename $0) executing."
ln -s ../../flowstamp_HR_U_demo.txt
echo ""
echo "Your attention is required."
echo ""
echo "While, for the sake of the demonstration, this script will run to create"
echo "files and images and then create the video overlay out of mere text, and"
echo "also include non-text images in the overlay, if you are to attain the"
echo "know-how to use that functionality with your own texts and non-text"
echo "images you want to overlay onto your video, you are strongly advised:"
echo ""
echo "to try and study the script as it executes, and scatter those"
echo " \"read FAKE\" lines to see exactly how things are done to then be able"
echo "to tweak it to your needs (a few are there as the program ships, just"
echo "uncomment them)."
echo ""
# Indeed! So you opened this script in Vim or Emacs or some other text editor?
# Fine. Find the paragraph, in the introduction above with the string:
# "Enough of Schmoogle". Pls. read that, and see it applied now. Namely this
# Licet_prep.sh script it run in Licet/Make_licet_TXT/ directory (or some
# other directory if all the content is moved over).
#
# But since I, at the time of writing this script, already have in place all
# the files that produce the images necessary for the overlay that you can see
# in the actual final overlay as the program is published, exactly before, and
# not including, that "Enough of Schmoogle" string, you need to remove that
# part of the script to be able to run it on your texts and images if you will
# be, which is usually the case, building the overlay files from zero.
#
echo "This may be a place for the user to comment out, once he tries to work"
echo "his own text. Pls. read the script at this place carefully."
echo ""
# these two lines below you probably don't need. Comment them out:
#mkdir -pv Already_made.d/
#mv -iv Licet_p[0-9][0-9][beh].txt Already_made.d/
# I don't need them either. After a few entire days writing this script, I just
# keep those previous in the Already_made.d/ dir, every time I (still) work to
# finish this script. I keep them in the git, and consequently they are so in
# the user downloaded package.
mv -v Licet_p[0-9][0-9][beh]_00.txt JIC/
#echo "$(basename $0) point 0"
#read FAKE

# the lines below, however, are probably needed if you don't want too much
# clutter in your trial and errors till you achieve the right order, format and
# looks for your overlay
mkdir -p JIC/
mkdir -p DEL/
echo ""
echo "We want to have a temporary file, so we can experiment till we are"
echo "confident all is well, and simply throw away into DEL/ or JIC/ any"
echo "temporary files that we make. Just use your_file istead of"
echo "flowstamp_HR_U_PART, sure only once you have figured out how it all"
echo "works:"
text4pango=flowstamp_HR_U_PART_`date +%s`
echo \$text4pango:
echo $text4pango
#echo "$(basename $0) point 1"
#read FAKE
# We'll take the entire section after what $2, the second argument, tells us to
# take. And, see above the command this script is run with, and find it in
# ./Licet/Auxil-contrib/Cut4Licet.sh. That text, in my case is
# "lost the honest and knowledgeable", and 'man grep' is your friend.
echo "grep -A500 \"$2\" $1 > $text4pango"
grep -A500 "$2" $1 > $text4pango

# However, I don't want the last two lines, and I want to add, at start,
# \"Enough of Schmoogle\", and also a pointer to this script from that overlay.
lines=`cat $text4pango | wc -l`
lines_cor=`echo $lines-2|bc`
echo \$lines: $lines
echo \$lines_cor: $lines_cor
#echo "$(basename $0) point 2"
#read FAKE

mv $text4pango ${text4pango}_OLD
head -$lines_cor ${text4pango}_OLD > $text4pango
#echo "$(basename $0) point 3"
#read FAKE


mv $text4pango ${text4pango}_OLD
echo "Enough of Schmoogle. Back talking to Flowstamp users." >> $text4pango
echo "" >> $text4pango
cat ${text4pango}_OLD >> $text4pango
#echo "$(basename $0) point 4"
#read FAKE
# From the user's point of view, the names of the future files, which without
# extension (.png or .txt), share the same name as the "convert
# pango:@THIS_NAMESPACE.txt" created THIS_NAMESPACE.png's, from the user's
# point of view, those names to be, should be in front of the text.

# Here a little user editing is indispensable. Create if necessary, separate
# files to be, which may hold just titles, as you will see I did, or other such
# information which fits in the central column, relevant for both the left and
# the right column.
#
# It will again be clearer to you if you see what edits I decided to do in my
# text. You can get what the first-stage edited text looks like if you, without
# any modifications, run the script in this first run to just introduce
# yourself to it.
#
# Your file to edit, in this non-modified run, is:
echo ls -l \$text4pango
ls -l $text4pango
#echo "$(basename $0) point 5"
#read FAKE
#
# Now, to not clobber my program with excessive files, I'll keep the patch that
# you can easily apply onto $text4pango and get my first-stage edits:
#
patch $text4pango -p0 < flowstamp_HR_U_PART_s1.patch
#
echo "Just now $text4pango patched first-stage"
#echo "$(basename $0) point 6"
#read FAKE

# And once you have finished designing your text to be split into left, right
# and center columns, put some of these at start of where you want the separate
# files to be split from off your \$text4pango which you are preparing:
#
# Licet_p01b (b is for both)
# Licet_p01e (e is for English)
# Licet_p01h (h is for Hrvatski, Croatian)
# Licet_p02b
# Licet_p02e
# Licet_p03b
# Licet_p03e
# Licet_p03h
# ...
# I wrote "some of these" not because their order is irrelevant, it is, and
# they are taken to be processed in alphabetical way, b the first, then e, then
# h, and of course the left to write whether ciphers or chars is the priority,
# same as if you issue ls -1 or ls -l on a directory and see what shows first.
#
# So the order is natural, but I am saying "some of these" because there can be
# left and right column, and no center column, or anyhow, columns can be
# missing, and only one type of column consecutive, such as they must not be
# out of order, such as Licet_p04b appearing before Licet_p03b, if you don't
# want them to appear out of your probably desired order on the final overlay
# for your video.
#
# I haven't yet, at the time of writing this line, haven't yet translated my
# text into Croatian, so I actually don't have any of the Licet_p0[1-7]h, I'll
# simply copy their English counterparts into their names-to-be named files and
# do the translation later, but that is how your $text4pango needs to be
# arranged to be split into files to become images to be overlayed onto the end
# of the video (in this case).
#
sha256sum $text4pango | cut -d' ' -f1 > text4pango_sum
text4pango_var=`cat text4pango_sum`
# Sorry for the missing Licet_p0[1-7]h making the example that much less clear,
# but if you want to see how I prepared the aforesaid part of the
# flowstamp_HR_U_demo.txt, patch the $text4pango again with the second patch and it
# will be clearer to you.
#
# If you are following this script-guide closely, then once you're running this
# script on your own files, here you need to do that other manual modification
# of your text file to be split.
#
# And so I made the script here complain if you don't modify the $text4pango
# because if you don't edit it, there is no point proceeding:

echo "We are waiting for your modifications of $text4pango"
echo ""
echo "            ( 1 seconds )"

patch $text4pango -p0 < flowstamp_HR_U_PART_s2.patch
echo "Just now $text4pango patched second-stage"
#echo "$(basename $0) point 7"
#read FAKE

sleep 1 ;
# Of course this waiting is symbolic. I could've made the script do some
# insertions of those lines anyway even on your text, but you most probably
# would not like the result.
sha256sum $text4pango | cut -d' ' -f1 > text4pango_sum_EDITED
text4pango_EDITED_var=`cat text4pango_sum_EDITED`
echo \$text4pango_var: ; echo "$text4pango_var"
echo \$text4pango_EDITED_var: ; echo "$text4pango_EDITED_var"
#echo "$(basename $0) point 701"
#read FAKE
if [ "$text4pango_var" == "$text4pango_EDITED_var" ]
	then
		echo ""
		echo "You never touched it! Did you work on the wrong file?"
		echo "You were supposed to edit the \$text4pango:"
		echo "$text4pango of this run of Licet_prep.sh."
		echo ""
	else
		echo ""
		echo "Just to remind you that the script isn't checking your work, it"
		echo "will only fail or perform poorly if your work is not right!"
		echo ""
fi

echo "Did text4pango_sum"
cat text4pango_sum
echo "and text4pango_sum_EDITED"
cat text4pango_sum_EDITED
echo "just compared?"?
#echo "$(basename $0) point 702"
#read FAKE

# The last addition to the text, which completes it, has come to my mind at
# the very end of writing this Licet_prep.sh script. No label needed, and I
# can only include it here at this stage. What it does, is, it just expands
# the very first Licet_p01e.png for quite a few lines, and we'll od it with the
# heredoc cat'ing.
# We know all at this point what the very first line of this addition to the
# Flowstamp program final Licet overlay sounds, don't we? Say with me:
# "Enough of Schmoogle..." ;-)
grep -B100 "Enough of Schmoogle. Back talking to Flowstamp users." $text4pango > ${text4pango}_p1
grep -A1000 "Enough of Schmoogle. Back talking to Flowstamp users." $text4pango > ${text4pango}_p3_RAW
lines=`cat ${text4pango}_p3_RAW | wc -l`
lines_cor=`echo $lines-1|bc`
echo \$lines: $lines
echo \$lines_cor: $lines_cor
tail -$lines_cor $text4pango > ${text4pango}_p3

echo "
All the text from here (including what you are reading) below (except some last
two paragraphs at the very bottom), is, turned into images and then overlayed
onto the end of the video via tweaking scripts in the Flowstamp program. The
sole manual work was my traslating of the text during the process (because I
wrote it first in English, to hopefully reach further with my plight and the
plight of my friends, or to wail before the Truth and the world of the sorry
state of my Nation, if you really will).

Users can, with some effort, apply my scripts, now freely published and donated
to good and bad people, just like criminals usually do, don't they? (I am a
convicted offender by this freaking regime currently running my country and for
breaches of copyright, on public TV news and (again: \"public\") public TV (sic!)
documentaries, and I was almost jailed by the traitors)...

But I was saying, you, if you want to use my program, can go and study how this
text below is just the same as the text in the published (well hopefully they
won't knock on my door before I publish it, as they did with lots of my friend,
the notorious visit by regime's men early in the morning) ...You can see how
this text below is the same as the portion of the text about Dr Tomislav Dragun
in \"flowstamp_HR_U_demo.txt\" file in the (hopefully) published archive of the
Flowstamp program, first release. Just this introduction is not in that file,
but in the script \"Licet_prep.sh\".

Any user, well, she/he needs to be somewhat determined to figure things out if
they are less advanced, but she/he can do so just fine with their own texts,
and also images proper, by means of my Flowstamp program." > ${text4pango}_p2

# Of course, the translation is over in Licet_p01h.txt

cat ${text4pango}_p1 ${text4pango}_p2 ${text4pango}_p3 > ${text4pango}_COMPLETE

mv -v ${text4pango}_COMPLETE $text4pango
#echo "$(basename $0) point 70201"
#read FAKE
# The labels are currently as expected from the user's point of view, at start
# of separated to be files.
# But I can't work with them easily with grep. So let's put them at the end of
# every respective text to be split away into files.

grep Licet_p[0-9][0-9][beh] "$text4pango" >ls-1_Licet_pDDa

echo "We just grep'd, on your raw Licet input file, for:"
echo "grep Licet_p[0-9][0-9][beh] \"$text4pango\""

echo "The result is (D for digit, a for alpha):"
echo "cat ls-1_Licet_pDDa"
cat ls-1_Licet_pDDa
#echo "$(basename $0) point 703"
#read FAKE

echo Licet_p000 > ls-1_Licet_slide
cat ls-1_Licet_pDDa >> ls-1_Licet_slide
echo Licet_p999 >> ls-1_Licet_pDDa
paste ls-1_Licet_pDDa ls-1_Licet_slide | sed 's/\t/\//' > ls-1_Licet_ren
cat ls-1_Licet_ren
# I really don't want to clutter with too many of these because it may annoy
# people who don't need any of my comments, but less advanced users may find
# it useful to scatter these on and on in this fashion, and examine how files
# are changed with what commands for our end results. 'man sed' et cetera.
#echo "$(basename $0) point 704"
#read FAKE
cat ls-1_Licet_ren | sed "s/\(.*\)/sed -i \'s\/\1\/\'/" > Licet_ren_00.sh
cat Licet_ren_00.sh | sed 's/\(.*\)/\1 \$@/' > Licet_ren.sh

lines=`cat Licet_ren.sh | wc -l`
lines_cor=`echo $lines-1|bc`
echo \$lines: $lines
echo \$lines_cor: $lines_cor
cat Licet_ren.sh

mv Licet_ren.sh Licet_ren.sh_OLD
head -$lines_cor Licet_ren.sh_OLD > Licet_ren.sh

chmod +x Licet_ren.sh

./Licet_ren.sh $text4pango
echo "Licet_p09b" >> $text4pango
sed -i 's/Licet_p000//' $text4pango


echo ""
echo ""
echo "The $text4pango we work with, first head...:"
head $text4pango
echo "-------------------------------------------------------------------"
echo ""
echo ""
echo "...and then tail:"
tail $text4pango
echo "-------------------------------------------------------------------"
echo ""
#echo "$(basename $0) point 8"
#read FAKE

for i in `cat ls-1_Licet_pDDa | grep -v Licet_p999`
	do
		grep -B1000 $i $text4pango > ${i}_00.txt
		mv -v $text4pango ${text4pango}_OLD
		diff ${text4pango}_OLD ${i}_00.txt | sed 's/< //' > $text4pango
		echo "###################################################################"
		echo "The \${i}_00.txt just made,"
		echo "cat ${i}_00.txt:"
		echo "-------------------------------------------------------------------"
		cat ${i}_00.txt
		echo "###################################################################"

	done ;
mv -iv $text4pango* JIC/
for i in `ls -1 Licet_p[0-9][0-9][e]_00.txt`
	do
		ls -l $i
		j=`echo $i|sed 's/e_00.txt/h_00.txt/'`
		echo $j
		cat $i | sed 's/\(Licet_p[0-9][0-9]\)e/\1h/' > $j
		cat $j
#echo "$(basename $0) point A"
#read FAKE
	done
# The split files to become images and then moving overlay at end of video are
# there. If you are adapting this script to suit your needs for your text for
# the final Licet, pls. notice that this part is not there to include if you
# build from one text only (without a few of those already made like me), so
# you may not need nor be able to apply it when you arrive at this stage of
# creating these files for pango.
#
# I'm taking the default markup top and bottom lines, from already made
# files, so in case I edit that default, this default here also changes
# with them
cat Already_made.d/Licet_p02e.txt | sed 's/>/>\n/g' | tr '\012' '@' | \
	sed 's/>@</></' | tr '@' '\012' | grep '<markup>' > markup_top_default

# I want to have something acceptable for titles, only top needed, btm same

cat ../Make_licet_TXT_at0/Licet_p4b_at0.txt | sed 's/>/>\n/g' | \
	tr '\012' '@' | sed 's/>@</></' | tr '@' '\012' | grep '<markup>' | \
	sed 's/weight/fgcolor="white" weight/' > markup_top_title
#echo "$(basename $0) point A01"
#read FAKE
# (Un)comment (out) three lines below if you (don't) want newlines truncated
#cp -av markup_top_default JIC/markup_top_default_`date +%s`
#cat markup_top_default | tr '\012' '@' | sed 's/@//g' > markup_top_default_TMP
#mv -v markup_top_default_TMP markup_top_default

cat Already_made.d/Licet_p02e.txt | sed 's/>/>\n/g' | tr '\012' '@' | \
	sed 's/>@</></' | sed 's/>@</></' | sed 's/\([^>]\)</\1\n</'  | \
	tr '@' '\012' | grep '<\/markup>' > markup_btm_default
# (Un)comment (out) three lines below if you (don't) want newlines truncated
#cp -av markup_btm_default JIC/markup_btm_default_`date +%s`
#cat markup_btm_default | tr '\012' '@' | sed 's/@//g' > markup_btm_default_TMP
#mv -v markup_btm_default_TMP markup_btm_default
echo "cat markup_top_default"
cat markup_top_default
echo "cat markup_btm_default"
cat markup_btm_default

for i in `ls -1 Licet_p[0-9][0-9][beh]_00.txt`
	do
		ls -l $i
		k=`echo $i|sed 's/_00.txt/.txt/'`
		echo "\$k: $k"
		echo "cat \$i, cat $i"
		cat $i
		cat $i | sed 's/[0-9]\{1,2\},[0-9]\{1,4\}[a-z][0-9]\{1,4\}//' > $k
		cp -v $k ${k}_s1
		cat ${k}_s1 | sed 's/Licet_p[0-9][0-9][beh]//' > $k
		cp -v $k ${k}_s2
		cat ${k}_s2 | cat -s > $k
		cp -v $k ${k}_s3
		cat ${k}_s3 | ./sed_del_blanks.sh > $k
		echo "cat \$k, cat $k"
#echo "$(basename $0) point A02"
#read FAKE
# And here, I need to do the translation, since the text is in all the
# Licet_p[0-9][0-9]h.txt clean, only translation needed.
#echo "$(basename $0) point A1 ready for translation?"
#read FAKE
# It was. And it is translated. That was so much less work, not little work at
# all, but much less than this sole script. To be honest. I'm not really a
# programmer. but I absolutely needed a program with these functionalities, and
# I couldn't even bother searching for or even knowing about anything in any
# way non-free, I mean not under GNU GPL or compatible license.
	done
#
# So I got now all the text, and I am not changing this script for this
# release. It is not urgent, because the newbie can simply take the already
# split files and simply replace my text with his own, without ever using this
# particular Licet_prep.sh script.
#
echo ""
echo "Your attention is required. Read $(basename $0) at where these exact"
echo "words are."
echo ""
echo ""
# At this here stage, I have the text I translated into Croatian, and I am not
# rearranging the script. Rather, I put my translated Licet_p0[1-8]h.txt in a
# separate directory:
ls -l Newly_made_h.d/
# and all I need to do is replace the bogus Licet_p0[1-8]h.txt (bogus because
# they're just copies of the English text) from this ./ directory with
# translations from that directory.
#
#echo "$(basename $0) point B major rewriting, no prompting follows below"
#read FAKE
cp -av Newly_made_h.d/* .
# If you are building from zero files, you probably don't need the renaming
# below. Comment the for loop below:
for i in `ls -1 Licet_p[0-9][0-9][beh].txt`
	do
		j=`echo $i| sed 's/Licet_p0//'`
		mv -iv $i Licet_p1$j
	done
for i in `ls -1 Licet_p[0-9][0-9][beh].txt`
	do
		lines=`cat $i | wc -l`
		tail -1 $i > ${i}_tail1

		cp -av ${i}_tail1 ${i}_tail1_OLD
		cat ${i}_tail1 | tr '\012' '@' | sed 's/@//g' > ${i}_tail1_TMP

		mv -v ${i}_tail1_TMP ${i}_tail1
		cp -av ${i}_tail1 ${i}_tail1_TMP
		cat ${i}_tail1_TMP | sed 's/miro.roviscro/miro.rovis@cro/' >  ${i}_tail1
#echo "$(basename $0) point B01"
#read FAKE
		echo \$lines: $lines
		lines_cor=`echo $lines-1|bc`
		echo "mv -v $i ${i}_OLD"
		mv -v $i ${i}_OLD
		echo \$lines: $lines
		echo \$lines_cor: $lines_cor
#if [ "$lines_cor" = "" ]
#	then lines_cor="0"
#fi
echo \$lines_cor: $lines_cor
				echo "head -$lines_cor ${i}_OLD > $i"
				head -$lines_cor ${i}_OLD > $i
echo $lines_cor

				mv $i ${i}_OLD
				cat ${i}_OLD ${i}_tail1 > $i

#echo "$(basename $0) point C"
#read FAKE
	done

#echo "$(basename $0) point B01 Right before adding markup_???_default, more sed needed"
#read FAKE
for i in `ls -1 Licet_p1[0-9][eh].txt`
	do
		cp -av $i ${i}_s4
		# f9qw7fqwf is just a random enough string
		# (well, for a few kilos of text, it should be)
		cat ${i}_s4 | tr '\012' '@' | sed "s/@@/f9qw7fqwf/g" | \
			sed 's/@/ /g' | sed 's/f9qw7fqwf/\n\n/g' | \
			sed 's/  / /g' | sed 's/ $//g' > $i
#echo "$(basename $0) point C01"
#read FAKE
	done
for i in `ls -1 Licet_p[0-9][0-9][eh].txt`
	do
		cp -av $i ${i}_s5
		cat markup_top_default ${i}_s5 markup_btm_default > $i
	done
#echo "$(basename $0) point C02"
#read FAKE
for i in `ls -1 Licet_p[0-9][0-9]b.txt`
	do
		cp -av $i ${i}_s5
		cat markup_top_title ${i}_s5 markup_btm_default > $i
	done
#echo "$(basename $0) point C03"
#read FAKE
for i in `ls -1 Licet_p[0-9][0-9]b.txt | tail -1`
	do
		cat markup_top_default ${i}_s5 markup_btm_default > $i
	done
#echo "$(basename $0) point C04"
#read FAKE

# And now, the texts that existed before my putting together this script:
cp -av Already_made.d/* .

mv -v Licet_p[0-9][0-9][beh].txt_OLD Licet_p[0-9][0-9][beh].txt_tail1 DEL/
mv -v Licet_p[0-9][0-9][beh]_00.txt Licet_p[0-9][0-9][beh].txt_s1 \
	Licet_p[0-9][0-9][beh].txt_s2 Licet_p[0-9][0-9][beh].txt_s3 \
	 Licet_p[0-9][0-9][beh].txt_s4 Licet_p[0-9][0-9][beh].txt_s5 DEL/

mv -v Licet_ren_00.sh Licet_ren.sh Licet_ren.sh_OLD ls-1_Licet_pDDa \
	ls-1_Licet_ren ls-1_Licet_slide text4pango_sum text4pango_sum_EDITED JIC/
mv -v Licet_p[0-9][0-9][beh]_00.txt JIC/
mv -vf flowstamp_HR_U_PART_14* JIC/
mv -v markup_???_default JIC
mv -vf Licet_ren* ls-1_Licet* Licet_p999* DEL/
rm -vf text4pango_sum* DEL/
rm -vf flowstamp_HR_U_demo.txt
# If you uncomment this, then when this script is run, it will clean this
# entire directory, leaving just the Licet_p[0-9][0-9][beh].txt files and
# the make_licet.sh script. You can then work with an editor to replace the text
# in the Licet_p[0-9][0-9][beh].txt files with you text, without all the
# intricacies of Licet_prep.sh script (this script file), which will also be
# removed.
#touch licet-no-expert
if [ -e "licet-no-expert" ]
	then
		mkdir DEL/
		mv -v * DEL/
		mv -v DEL/Licet_p[0-9][0-9][beh].txt DEL/make_licet.sh .
		mv -v DEL/CC_Gospa .
#		rm -rf DEL/
fi
#echo "$(basename $0) point D"
#read FAKE
echo "All should be prepared now for running make_licet.sh on this directory."
echo "This directory should be ready for the regular Flowstamp run."
