#!/bin/bash
#
# make_logo.sh -- this script is part of Flowstamp program
#
# Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>
#
# released under BSD license, pls. see LICENSE
#

echo -e "\n===> $(basename $0) executing."
convert -size 156x64 xc:none -background transparent transp_156x64.png

convert -background transparent -fill "#0099CC" \
	-font /usr/share/fonts/ubuntu-font-family/Ubuntu-C.ttf \
	-pointsize 14 label:"overlayed with" fS_1_overLw_14pt.png
composite fS_1_overLw_14pt.png -geometry +35+6 \
	-blend 80x20 transp_156x64.png fS_1_overLw_on_156x64.png

convert -background transparent -fill "#0099CC" \
	-font /usr/share/fonts/urw-fonts/n019064l.pfb \
	-pointsize 24 label:"Flowstamp" fS_2_fS_24pt.png
composite fS_2_fS_24pt.png -geometry +12+16 \
	-blend 70x30 transp_156x64.png fS_2_fS_on_156x64.png

convert -background transparent -fill "#0099CC" \
	-font /usr/share/fonts/ubuntu-font-family/Ubuntu-C.ttf \
	-pointsize 13 label:"www.CroatiaFidelis.hr" fS_3_CF_13pt.png
composite fS_3_CF_13pt.png -geometry +13+46 \
	-blend 90x10 transp_156x64.png fS_3_CF_on_156x64.png

composite fS_1_overLw_on_156x64.png fS_2_fS_on_156x64.png fS_1+2.png

composite fS_1+2.png fS_3_CF_on_156x64.png fS_1+2+3.png

convert -size 768x576 xc:none -background transparent transp_768x576.png
convert -size 1024x576 xc:none -background transparent transp_1024x576.png

composite fS_1+2+3.png transp_768x576.png -geometry +636+46 LOGO_Flowstamp_4x3.png
composite fS_1+2+3.png transp_1024x576.png -geometry +865+58 LOGO_Flowstamp.png

rm -v fS*.png transp*.png

