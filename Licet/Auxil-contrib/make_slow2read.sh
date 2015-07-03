#!/bin/bash
#
# make_logo.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."
convert -size 120x100 xc:none -background transparent transp_120x100.png

convert -background transparent -fill "#ffc8e4" \
	-font /usr/share/fonts/ubuntu-font-family/Ubuntu-B.ttf \
	-pointsize 16 -size 80 -gravity Center caption:"Slow down or pause to read!" slow2read_e0.png
composite slow2read_e0.png -geometry +33+6 \
	-blend 60x40 transp_120x100.png slow2read_e_on_120x100.png

convert -background transparent -fill "#84fff7" \
	-font /usr/share/fonts/ubuntu-font-family/Ubuntu-B.ttf \
	-pointsize 16 -size 80 -gravity Center caption:"Uzpori ili ustavi za čitanje!" slow2read_h0.png
composite slow2read_h0.png -geometry +33+6 \
	-blend 60x40 transp_120x100.png slow2read_h_on_120x100.png

convert -size 768x576 xc:none -background transparent transp_768x576.png
convert -size 1024x576 xc:none -background transparent transp_1024x576.png

composite slow2read_e_on_120x100.png transp_768x576.png -geometry +632+344 slow2read_e_4x3.png
composite slow2read_e_on_120x100.png transp_1024x576.png -geometry +20+292 slow2read_e.png

composite slow2read_h_on_120x100.png transp_768x576.png -geometry +632+184 slow2read_h_4x3.png
composite slow2read_h_on_120x100.png transp_1024x576.png -geometry +860+292 slow2read_h.png

composite slow2read_e_4x3.png slow2read_h_4x3.png slow2read_eh_4x3.png
composite slow2read_e.png slow2read_h.png slow2read_eh.png

rm -v slow2read_?_* slow2read_?.png transp*.png

