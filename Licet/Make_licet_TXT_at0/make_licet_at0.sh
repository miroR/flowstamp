#!/bin/bash
#
# make_licet_at0.sh -- This script is part of flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#
# This script is just reedited make_licet.sh, that is why it is named
# make_licet_at0.sh. Most certainly there should be only one script with the
# functionality of both make_licet.sh and make_licet_at0.sh. Sorry, too tired.
#
# Transparent canvas of size exactly: 768x3036
#
# Also the top margin is currently hard wired: 200
#
# Pls. see make_licet.sh script for more. This one is, again, left all dirty
# with useless code, out of my sheer exhaustion, not sloppiness...
#

echo -e "\n===> $(basename $0) executing."
mkdir -p JIC # for Just In Case, if need for simple debugging arises...
mkdir -p DEL # delete, similar, but stuff less likely to be needed
mv -v lines JIC/lines_`date +%s` ;
mv -v CMD JIC/CMD_`date +%s`
mv -v PNG_TMP JIC/PNG_TMP_`date +%s`
mv -v Fs_at00000.png JIC/Fs_at00000.png_`date +%s`
mv -v Fs_4x3_at0.png JIC/Fs_4x3_at0.png_`date +%s`
mv -v Fs_name JIC/Fs_name_`date +%s`
mv -v ls* DEL ; mv *.png DEL ; mv *.len DEL ; mv width* DEL ;
mv -v arrayPNGsL* DEL/ ;
mv -v my_gravity DEL/my_gravity_`date +%s` ;
mv -v *gravity* DEL/ ;
mv -v *geo_left_marg* DEL/ ;

echo "64" > geo_left_marg_e
echo "394" > geo_left_marg_h
if [ -n "$1" ]
	then
	echo "You gave $1 as argument to `basename $0`. \
		Let's see if I can use it."
	case "$1" in
		center )
			echo "You gave $1"
			echo "$1" > my_gravity
			echo "64" > geo_left_marg_e
			echo "394" > geo_left_marg_h
			echo "Fs_at00000.png" > Fs_name
			;;
		East )
			echo "You gave $1"
			echo "$1" > my_gravity
			echo "22" > geo_left_marg_e
			echo "340" > geo_left_marg_h
			echo "Fs_4x3_at0.png" > Fs_name
			echo "There is a fix needed here, for imagemagick formatting"
			echo "pango text input differently when East or West, the rise"
			echo "makes theses overly compact in comparison with center"
			echo "UPDATE: that was the case +- 1 yr ago, not needed anymore"
			#for i in `ls -1 Licet_p??_at0.txt` ; do
			#	sed -i.bak 's/rise="8200"/rise="13350"/' $i ; done
			;;
		West )
			echo "You gave $1"
			echo "$1" > my_gravity
			echo "418" > geo_left_marg_h
			echo "88" > geo_left_marg_e
			echo "Fs_4x3_at0.png" > Fs_name
			echo "Pls. see explanation under East case"
			for i in `ls -1 Licet_p??_at0.txt` ; do
				sed -i.bak 's/rise="8200"/rise="13350"/' $i ; done
			;;
		* )
			echo "You gave $1"
			echo "Only 'center', 'East' and 'West' can be given as first"
			echo "argument. Input disregarded. The default 'center' is kept."
			echo "center" > my_gravity
			echo "64" > geo_left_marg_e
			echo "394" > geo_left_marg_h
			echo "Fs_QQQ.png" > Fs_name
		;;
	esac
fi

if [ "$1" == "East" ] || [ "$1" == "West" ]
	then
		echo "668x" > width_b
	else
		echo "768x" > width_b
fi
echo "310x" > width_e
echo "310x" > width_h
echo "center" > gravity_b
if [ -e "my_gravity" ] ; then cat my_gravity > gravity_e ;
	else echo "center" > gravity_e ; fi
if [ -e "my_gravity" ] ; then cat my_gravity > gravity_h ;
	else echo "center" > gravity_h ; fi
if [ -e "Fs_name" ]
	then
		cat Fs_name ;
	else
		echo "Pls. take notice that no other cases worked if \$1 is non extant"
		echo "Fs_at00000.png" > Fs_name
fi
#read FAKE
# Just like I said further above, I'm tired. And since this much more
# restricted purpose script to do it's work, in other bigger one's script's
# shoes, I'll try and work around the differences the least possible, to
# achieve the purpose... Obviously both script will be run completely
# separately, each in it's own directory, so this clumsiness won't cause any
# urgent necessity and it might be long from now when I turn my attention here
# and solve this in proper way... So:
chcase -x 's/_at0//' Licet_p??_at0.txt
# I hope the above is all the remaining change, and the script makes the
# Fs_4x3_at0.png or Fs_at00000.png depending whether given the first argument
# 'East' or 'center' or just no argument at all.
# And we'll only need to rename the same files back later...
echo ; echo ; echo ; echo ; echo "Now imagemagick is convert'ing \
	pango:@TEXT files to png's"
echo ; echo ; echo ;

for i in `ls -1 Licet_p*.txt | sed 's/.txt//'`
	do
		j=`echo $i | sed 's/Licet_p[0-9]//'`
		cat width_$j > width_TMP
		cat gravity_$j > gravity_TMP
		convert -size `cat width_TMP` -background transparent \
			-gravity `cat gravity_TMP` pango:@$i.txt $i.png
	done

ls -1 Licet_p[1-9]b.png | sed 's/b.png//' > ls_both

cat ls_both

ls -1 Licet_p[0-9]e.png | sed 's/e.png//' > ls_lang

for i in `cat ls_lang`
	do
		identify ${i}b.png | cut -d'x' -f2|cut -d' ' -f1 > \
			${i}b_H.len
	done
for i in `cat ls_lang`
	do
		identify ${i}e.png | cut -d'x' -f2|cut -d' ' -f1 > \
			${i}e_H.len
	done
for i in `cat ls_lang`
	do
		identify ${i}h.png | cut -d'x' -f2|cut -d' ' -f1 > \
			${i}h_H.len
	done
for i in `cat ls_lang`
	do
		if [ `cat ${i}e_H.len` -gt `cat ${i}h_H.len` ]
			then
				cat ${i}e_H.len > ${i}lang_H.len
			else
				cat ${i}h_H.len > ${i}lang_H.len
		fi
	done
for i in `cat ls_lang`
	do
		echo \${i}lang_H.len ${i}lang_H.len: `cat ${i}lang_H.len`
		echo "because ${i}e_H.len is `cat ${i}e_H.len` and ${i}h_H.len \
			is `cat ${i}h_H.len`"
	done

ls -1 Licet_p*.png | grep -v e.png | sed 's/.png//' > ls_bh_png
mv -v ls_lengs_all JIC/ls_lengs_all_`date +%s`
for i in `cat ls_bh_png`
	do
		j=`echo $i | sed 's/Licet_p[0-9]//'`
		if [ "$j" == "h" ]
			then
				k=`echo $i | sed 's/h/lang_H.len/'`
				echo \$k: $k
				cat $k
				echo $k >>ls_lengs_all
			else
				k=`echo $i | sed 's/Licet_p\([0-9]\)b/Licet_p\1b_H.len/'`
				echo \$k: $k
				cat $k
				echo $k >>ls_lengs_all
		fi
	done

#for i in `cat ls_lengs_all` ; do
#	lang_png_e=`cat $i | sed 's/lang_H.len/e.png'`
#	lang_png_h=`cat $i | sed 's/lang_H.len/h.png'`

ls -1 *.png > ls_png
#arrayPNGs=(`cat ls_png`)
#for i in ${arrayPNGs[@]} ; do
#	j=`echo $i | sed 's/[beh].png//'`;
#	echo $j ;
#	if [ -e ${j}b_H.len ] ; then echo ${j}b_H.len: ;
#		cat ${j}b_H.len ; fi
#	if [ -e ${j}lang_H.len ] ; then echo ${j}lang_H.len: ;
#		cat ${j}lang_H.len ; fi
#done ;
#echo ; echo ; echo ;
#echo "That was the array, and the uninitialized members"
#echo "returning empty, assigned members returning the height of their image"
#echo ; echo ; echo ;

echo "What we need is calculate the height offset for each png"
echo "at exactly the end of all the previous pngs composited"
echo "one after the other, the cumul, cumulative height."
echo "The hard wired first height offset for the"
echo "first png is 614 (note 200 in this rearrangement). It is to be"
echo "added to the end after echo a particular iteration, or?..."
echo ; echo ; echo ;

#cat ls_png | grep -v e.png > ls_L_png
#arrayPNGsL=(`cat ls_L_png`)
#	ls -l ${arrayPNGsL[@]} ;

echo "Best to start with:"
ls -l ls_lengs_all ; echo

arrayPNGsL=(`cat ls_lengs_all`)
	ls -l ${arrayPNGsL[@]} ;

	wc -l ls_lengs_all | cut -d' ' -f1 > lines
	echo lines: `cat lines`

for ((i=0; i <= "`cat lines`" ; i++ ))
	do
		#ls -l ${arrayPNGsL[i]} ;
		k=`echo $i+1|bc`
		echo -n "200" > arrayPNGsL_${k}_sum
		for ((j=0; j < $i ; j++ ))
			do
				echo -n "+" >> arrayPNGsL_${k}_sum
				echo -n "`cat ${arrayPNGsL[j]}`" >> arrayPNGsL_${k}_sum
			done
		cat arrayPNGsL_${k}_sum ; echo
	done

echo

for ((i=1; i <= "`cat lines`" ; i++ ))
	do
		echo $i
		echo "ls -l \${arrayPNGsL\[i\]\}"
		ls -l ${arrayPNGsL[i]} ;
		echo echo \`cat arrayPNGsL_$\{i\}_sum\`\|bc
		echo `cat arrayPNGsL_${i}_sum`|bc
		echo `cat arrayPNGsL_${i}_sum`|bc > arrayPNGsL_top_${i}
		echo arrayPNGsL_top_\$\{i\}, arrayPNGsL_top_${i}:
		cat arrayPNGsL_top_${i}
	done

rm arrayPNGsL_choice_TMP

echo "convert -size 768x3036 xc:none -background transparent \\" >> CMD

for ((i=1; i <= "`cat lines`" ; i++ ))
	do
		cat arrayPNGsL_top_${i} > arrayPNGsL_top_TMP

		j=`echo $i-1|bc`
		ls -l ${arrayPNGsL[j]} ;
		echo ${arrayPNGsL[j]} | sed 's/Licet_p[0-9]//' | \
			sed 's/_H.len//' > arrayPNGsL_choice_TMP
		cat arrayPNGsL_choice_TMP
		if [ "`cat arrayPNGsL_choice_TMP`" = "b" ]
			then
			echo "arrayPNGsL_choice_TMP is b for ${arrayPNGsL[j]}"

			echo ${arrayPNGsL[j]} | sed 's/_H.len/.png/' > PNG_TMP
			ls -l `cat PNG_TMP`; cat arrayPNGsL_top_TMP
			echo -n "`cat PNG_TMP` -geometry +0+`cat arrayPNGsL_top_TMP` \\
				-composite " >> CMD

		fi
		if [ "`cat arrayPNGsL_choice_TMP`" = "lang" ]
			then
				echo "arrayPNGsL_choice_TMP is lang for ${arrayPNGsL[j]}"
					cp -v geo_left_marg_e geo_left_marg
				echo ${arrayPNGsL[j]} | sed 's/_H.len/.png/' | \
					sed 's/lang/e/' > PNG_TMP
				ls -l `cat PNG_TMP`
				cat arrayPNGsL_top_TMP
				echo -n "`cat PNG_TMP` \\
					-geometry +`cat geo_left_marg`+`cat arrayPNGsL_top_TMP` \\
					-composite " >> CMD
					cp -v geo_left_marg_h geo_left_marg
				echo ${arrayPNGsL[j]} | sed 's/_H.len/.png/' | \
					sed 's/lang/h/' > PNG_TMP
				ls -l `cat PNG_TMP`
				cat arrayPNGsL_top_TMP
				echo -n "`cat PNG_TMP` \\
					-geometry +`cat geo_left_marg`+`cat arrayPNGsL_top_TMP` \\
					-composite " >> CMD
		fi
	done
echo " `cat Fs_name`"
echo " `cat Fs_name`" >> CMD
chmod 755 CMD
			echo "We might reverse for center case."
		for i in `ls -1 Licet_p??.txt` ; do
			sed -i.bak 's/rise="13350"/rise="8200"/' $i ; done
			mv -v Licet_p??*.txt.bak JIC/
# let's rename the Licet pango text files back.
chcase -x 's/.txt/_at0.txt/' Licet_p??.txt
			mv -v Licet_p??*.txt.bak JIC/
./CMD
