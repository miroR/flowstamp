#!/bin/bash
#
# flowstamp-debian.sh -- this script is part of Flowstamp program
#
# sample changes, and all runs well on Debian
#
# pls. see README, there is more to do
#
sed -i.bak 's/\/fonts\/ubuntu/\/fonts\/truetype\/ubuntu/' \
      ./Licet/Auxil-contrib/make_logo.sh
sed -i.bak 's/\/fonts\/urw-fonts/\/fonts\/type1\/gsfonts/' \
      ./Licet/Auxil-contrib/make_logo.sh
sed -i.bak 's/\/fonts\//\/fonts\/truetype\//' \
      ./Licet/Auxil-contrib/make_slow2read.sh
sed -i.bak 's/\/fonts\/dejavu/\/fonts\/truetype\/dejavu\//' ./flowS_noSum


sed -i.bak 's/midentify/my-midentify/' ./flowstamp
sed -i.bak 's/midentify/my-midentify/' \
      ./Licet/Auxil-contrib/Cut4Licet.sh
