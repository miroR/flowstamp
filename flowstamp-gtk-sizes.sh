#!/bin/bash
#
# flowstamp-gtk-sizes.sh -- this script is part of Flowstamp program
#
# I think the small sizes of fonts which I get with Debian are due to GTK3 in
# Debian versus GTK2 in Gentoo (which I have there for a reason, search for
# "unfacilitate remote seats" on Gentoo Forums).
#
# So, if assumption correct, the sizes would all need to be increased to get
# same or similar, or corresponding anyhow, overlay font sizes.
#
# The latter assumption correct in the sense that the script
# increases/decreases the font sizes for the overlay correctly.
#
# Of course, the use of this script is not just adjusting sizes btwn GTK2 and
# GTK3, but generally keeping a ratio btwn font sizes of different fonts
# settings in your pango text files in same ratio when increasing/decreasing
# all the font sizes.
#
echo ""
echo ""
echo "You did or not give: \$1: $1"
echo ""
echo ""
echo "This message remains the same, for your right or bad or null input."
echo "Really no time here."
echo ""
echo ""
echo "You need to give a float around 1.00 by which to increase or decrease the"
echo "sizes in the pango markup of various files, which will respectively increase"
echo "or decrease the ... size="[0-9][0-9]...[0-9]" ... entry in those files,"
echo "by that number."
echo ""
echo "The entries like size=\"11500\" are affected, and if your number, say, 1.25,"
echo "that entry wherever it is found in this directory will be turned into"
echo "size=\"11500\", while if you give the number, say 0.85, all those same"
echo "instances will be turned into  size=\"9200\""
echo ""
echo "No time to learn to accomodate error checking in here. Just the script"
echo "will work."
echo ""
read FAKE
echo ""
echo ""
echo ""
echo ""
echo "Just hit Enter for moving on, if what you're shown on the screen is fine."
echo ""
echo ""
echo ""
echo ""
read FAKE

# And we will save these, just the digits ready for putting in an array:
grep -r ' size="' ./Licet/ | sed 's/.* size="\([0-9]\{3,6\}\)".*/\1/' | sort -u > Sizes
# Right?
echo "cat Sizes:"
cat Sizes

# Creating that array
arraySizes=(`cat Sizes`)
	echo "ls -l \${arraySizes[@]}:"
	echo ${arraySizes[@]}

# Now we need to do calculations based on the fraction given to us as the $1,
# the first argument.
LOOP=`cat Sizes | wc -l`
for (( i=0 ; i < "$LOOP" ; i++ ))
	do
		j="${arraySizes[i]}"
		k=`echo ${arraySizes[i]}*$1|bc`
		echo \$j: "echo $j"
		echo \$k: "echo $k"
		# R for real
		kR=`echo $k|cut -d. -f1`
		echo \$kR: "echo $kR"
read FAKE

	grep -rI " size=\"$j" ./Licet/ | cut -d: -f1 | sort -u > FilesFoundIn

	cat FilesFoundIn
read FAKE

# Creating the FilesFoundIn array
arrayFilesFoundIn=(`cat FilesFoundIn`)
	echo "ls -l \${arrayFilesFoundIn[@]}:"
	echo ${arrayFilesFoundIn[@]}

	LOOPF=`cat FilesFoundIn | wc -l`
	for (( m=0 ; m < "$LOOPF" ; m++ ))
		do
			echo \$LOOPF: "echo $LOOPF"
			echo \$m: "echo $m"
			echo \$j: "echo $j"
			echo \$kR: "echo $kR"
read FAKE
			l=${arrayFilesFoundIn[m]}
			sed -i.bak "s/ size=\"$j\"/ size=\"$kR\"/" $l
read FAKE
			ls -l $l $l.bak
read FAKE
			diff $l $l.bak
		done
	done
