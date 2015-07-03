#!/bin/sed -nf
#
# Obviously this is under some GNU GPL. Read below. It's not my fault, but you
# might need to replace it if you want to use my program for your company.
#
# It's so little, but necessary, amount of code, but difficult for me to grasp,
# and I hope someone will help (again: read below) sooner than later.
#
# This is verbatim pasted over from 'info sed' examples
# No (I have tried but) don't understand it. Stuff like info sed I need a few
# more days of dedicated study to really grasp. No time.
#
# If any of you experts is reading this, and can do a patch, pls. make one for
# the following purpose:
#
# There are lines that I get from previous more manual edit of my
# pango-prepared text, as you can see from my Licet_prep.sh script, and what I
# would like to be able to get, is, those lines, namely:
# markup_top_default
# and
# markup_btm_default
#
# I wanted to remove the ending lines from them. But I want to remove what
# comes before the markup_btm_default, to be able to have no spaces btwn the
# text files for pango, if I want to.
#
# Is it possible to adjust this script to, on top of exactly what it does, also
# remove just the ending line of the file?
#
# Thanks if someone helps here!
#
# delete all (leading) blanks

echo -e "\n===> $(basename $0) executing."
/./!d

# get here: so there is a non empty
:x
# print it
p
# get next
n
# got chars? print it again, etc...
/./bx

# no, don't have chars: got an empty line
:z
# get next, if last line we finish here so no trailing
# empty lines are written
n
# also empty? then ignore it, and get next... this will
# remove ALL empty lines
/./!bz

# all empty lines were deleted/ignored, but we have a non empty.  As
# what we want to do is to squeeze, insert a blank line artificially
i\

bx
