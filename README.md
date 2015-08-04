The Flowstamp program, a set of scripts in Bash, and the name Flowstamp are:

Copyright (c) 2015 Croatia Fidelis, Miroslav Rovis, www.CroatiaFidelis.hr

Please see also the separate `license' text included.

This Flowstamp program, more precisely, set of bash scripts (optionally)
stamps (a/number of) video(s) with transparent moving watermark (optionally)
containing checksum of the original. It (optionally) adds a user-tailored
(with a text editor), licencing/crediting sequence at beginning and end of
(each) video. Optional all of those are, but obviously you will want to use
some of those, else the program would do nothing useful.

For easier understanding of Flowstamp, there is an old video, just a
flowstamped the licet-overlayed video, that I made for the purpose of
demonstration, find it in the old content of the page, but with time the page
should be reworked:

http://www.CroatiaFidelis.hr/foss/Flowstamp

The program is called Flowstamp because it is the sum-stamping which is its
primary raison d'étre.

A word of caution is necessary. I have not time to engage in checking if
Flowstamp works on platforms other than such as:

my Gentoo GNU Linux machines and my (Debian/Devuan?) machines.

[ a note on Debian. The Debian community have kind of commited suicide of
Debian true FOSS (Free Open Source Software) nature by their overhaul to
systemd, so I'm not using Debian anymore. I have not had time to install its
true FOSS Devuan fork, although I plan to. So notes on working under Debian
below are to be revised some day. Then I'll remove the `?'. ]

[[ another note on Debian, in mid 2015: can't check on whichever I wrote here
or elsewhere on (Debian/Devuan?) as I don't have a recent install of it. The
various pieces of advice of concern, which I wrote first sometime mid-2014,
therefore I can not revise. ]]

See the section 'Known problems:' in bottom.

And real programmers, pls. bear with me, I expand here and there with the
newbies in mind (although I tried to move some of it in TIPS.txt), because I
wish more people to learn to use our FOSS Linux, and surely to benefit from my
program. If some passage is too broad and unnecessary for advanced users,
please skip those paragraphs more quickly.

So it could be some tweaking and checking for other GNU/Linux/Unix flavors,
and likely a major porting trouble to get it to work on Mac or Windows. I do
not plan on that venture myself, it'd be an effort beyond me and the time I
have (but I surely guess: rewriting the scripts in some other programming
language would be needed).

This set of scripts, or this (primitive) program, requires:

i)    FFmpeg with various filtering and other options enabled, and binaries
      such as ffprobe included (regarding the entire necessary set of
	  options/components needed, the exact ones I
      guess depend on your videos which you intend to work with Flowstamp, I'm
      not certain if anything much out of the ordinary is needed here, try and
      see if you're lucky).

      Here by FFmpeg I mean the real FFmpeg, and some distros spread the less
      good fork Libav (Avconv) instead. Sometimes even underhandedly by the same
      name. I have miserable, luckily short, track record of use of that fork,
      don't like it, in all distros there is a way to install the real FFmpeg
      somehow. IMO it's the best chance for you too, such as on
      (Debian/Devuan?) I use FFmpeg from www.deb-multimedia.org maintained by
      Christian Marillat.

ii)   a fine install of ImageMagick (I use it on GNU/Linux, I have no
      experience of it on other OS's at this time); ImageMagick must be
      installed in such way as to have various capabilities available, most
      notably support for pango

iii)  the Pango program for ImageMagick to use. The text that you saw, text
      like in articles, on top of the short labels/captions for logos, all that
      is completely under your command via Flowstamp; even the long HTML-like
      texts are done with Pango! See ImageMagick forums for advice how to
      install development pango packages alongside plain regular

iv)   Some (not indispensably ample) understanding of fonts usage and
      configuration, to be able to supply the right paths if the paths offered
      in the unedited Flowstamp archive don't work for your system.
      E.g. currently I've settled on my Gentoo GNU/Linux machines for:

      $ egrep -rI 'ttf|pfb'  ./
      ./flowS_noSum: /usr/share/fonts/dejavu/DejaVuSansCondensed-Bold.ttf \
      ./flowS_noSum: /usr/share/fonts/dejavu/DejaVuSansCondensed-BoldOblique.ttf \
      ./Licet/Auxil-contrib/make_slow2read.sh:	-font
      /usr/share/fonts/ubuntu-font-family/Ubuntu-B.ttf \
      ./Licet/Auxil-contrib/make_logo.sh:	-font
      /usr/share/fonts/ubuntu-font-family/Ubuntu-C.ttf \
      ./Licet/Auxil-contrib/make_logo.sh:	-font
      /usr/share/fonts/urw-fonts/n019064l.pfb \

      ( I also have an Helvetica line, without a path, but that is replaced on
      all system by some alias, Nimbus Sans of some variant, I guess, and works
      fine, so will later improve on that )

      And since on my (Debian/Devuan?), the location of the fonts is different (also I
      needed to download and install the Ubuntu fonts, pls. find guides how to
      do that on the net), I need to:
      $ sed -i.bak 's/\/fonts\/ubuntu/\/fonts\/truetype\/ubuntu/' \
              ./Licet/Auxil-contrib/make_logo.sh
      $ sed -i.bak 's/\/fonts\/urw-fonts/\/fonts\/type1\/gsfonts/' \
              ./Licet/Auxil-contrib/make_logo.sh
      $ sed -i.bak 's/\/fonts\//\/fonts\/truetype\//' \
              ./Licet/Auxil-contrib/make_slow2read.sh
      $ sed -i.bak 's/\/fonts\/dejavu/\/fonts\/truetype\/dejavu\//' ./flowS_noSum

	  It is the correct position of the text on the canvas, that we turn into
	  moving pictures with Flowstamp, which is somewhat tricky, and you can't
	  get the right result without investing a little time to understand and
	  configure the fonts, the layout numbers in the imagemagick commands
	  (convert/composite), and the video overlay. Numeorous tries may
	  sometimes be needed for the right results.

TO DO: In the scripts, the use and functionality of midentify has been mostly
replaced with the ffprobe which is part of FFmpeg. Entire current v) below
ought to be removed when the transition is completed in the few remaining
snippets.

v)    midentify, part of my mplayer install on my Gentoo GNU/Linux I really
	  don't know at this time for other GNU/Linuces or Unices, or some
	  replacement for that exact command if you don't have it, like I don't
	  have it on (Debian/Devuan?). midentify is clean on my Gentoo (not some
	  untypical mplayer install), but on (Debian/Devuan?), similar check on a
	  video I only attain with the command:
      $ mplayer -identify -nosound -endpos 0 $1 the-video.mkv | \
          grep ID_LENG > the-length-of-the-video
      And that works.
      These steps need to be taken.

      As root:
      # cat > /usr/local/bin/my-midentify
      #!/bin/bash
      mplayer -identify -nosound -endpos 0 $1 | grep -v 0.0000
      # chmod +x /usr/local/bin/my-midentify

      And you will get a script my-midentify. It's included in the archive, so
      you may prefer to just copy the script to /usr/local/bin.

      Next, replace occurrences of midentify with my-midentify in flowstamp
      and Cut4Licet.sh
      $ sed -i.bak 's/midentify/my-midentify/' ./flowstamp
      $ sed -i.bak 's/midentify/my-midentify/' \
              ./Licet/Auxil-contrib/Cut4Licet.sh

      This is not the same. my-midentify actually starts playing, silently,
      the '-nosound', and quits, the '-endpos 0', but it throws a lot of
      errors (not on the stdout, just stderr IIUC. Still it is fine, because it
      only clutters the screen, but the output to file is, almost as we need
      it. The grep -v 0.0000 is to eliminate bogus findings by that command.

      Instead of the above commands, if on (Debian/Devuan?), you can check if the script
      flowstamp-debian.sh works for you.

vi)   mkvtoolnix for cutting and joining matroska files, we'll be using command
      line mkvmerge utility a lot, and also mkvinfo.

TO DO: The chcase below should be removed. One file less, since the its
funcionality can be accomplished with simple bash renaming with a loop or
similar. Entire current vii) below ought to be removed.

NOTE: Don't know about the licensing of it, I found it on the net long years
ago, and keep it as I found it. No authors, no contacts, nothing in it
mentioned... I guess it must be public domain by now...

vii)  chcase perl script is also required. It is shipped with the package.
      Don't forget to move it into your path (in this README you noticed that
      it is assumed to be /usr/local/bin)

viii) understanding of checksums, what they are, why you (don't) need them, and
      how to calculate and verify them

ix)   Hopefully I haven't forgot to mention any other programs required, or other
      important notice to give, but do check about it in a later version in
	  the future.

One of my priorities once I release the Flowstamp program will be, apart from
discussions on the Github where I intend to publish this first release), to
try and see what advice people on FFmpeg mailing list, and around
ImageMagick.org as well as other FOSS/Linux people, such as on Gentoo and
Devuan/Debian, might have, after those among them who might be interested to
review the Flowstamp program have looked into it. So in some slow time (I work
really slowly) the next release of Flowstamp will probably have more
information on all the above items, as well as some items will be removed.

As I just said, I work really slowly, not for recklessness or sloppiness, but
simply lack of extraordinary talent in these matters, as well as often
suffering from poor health, so be really patient in you need to contact me.
This program itself is the fruit of hundreds upon hundreds of hours, scattered
in intervals of various duration throughout almost three years' time, usually
of studying before applying what I needed in the program, during which time I
often wasn't available for almost anything else.

This script is currently dirty, very imperfect (there is almost no error
checking whatsoever), and completely unpolished.  But it does the work, for
me, on my Gentoo GNU/Linux boxes, as well as on my (Debian/Devuan?) boxes,
where it does all that I programmed it to do.

#                                                                             #
#      Hereby I also explicitly inform you that this program mostly just      #
#                     -- as of this writing --                                #
#      wouldn't work out-of-the-box. You will probably need to modify         #
#      these scripts to fit your particular needs. Therefore it is            #
#      commented in quite a few places and most of the critical points        #
#      are hopefully sufficiently well explained.                             #
#                                                                             #
#                    Read all before use!                                     #
#                                                                             #

This script will, in the directory you run this script. sum-stamp all the
videos (and/or do other things on them, as already mentioned) which, it is
probably best, should be in some of the formats which are, at the time of the
first release, supported by Flowstamp (you can read the scripts to find out
which formats are supported currently). Such as the formats of the captured
videos with some (old) TV card, or some cellphone camera videos up to
1920x1080, and the videos need to be of aspect ratios either 16/9 or 4/3, and
the supported rates are only 25, 30 and (imperfectly for licet) 50.

To get your video workable for this first release of Flowstamp, you may need
to preprocess it with appropriate ffmpeg options first. I'll expand on this.

E.g., many people may have lots of archives of old footage of news or other TV
programs, as well as many people still capture TV/satellite programs in non-HD
formats such as 720:576 with the display aspect ratio (DAR) 4/3 and
system aspect ratio (SAR) 12/11, or: 704:576 with DAR 16/9 and SAR 64/45, or
maybe with some other, but around there it usually is (HD not included in this
consideration). And they record those by various programs that people use on
various platforms. Often DVD dumps are 7xx:576 and setsar and setdar like that
as well.

Those formats usually do need some preprocessing before applying this
imperfect first release of Flowstamp onto those videos, such as giving the
flowstamp the options: "-vf scale=768:576,setdar=4/3", or "-vf
scale=768:576,setdar=16/9", depending on the aspect ratio of the videos, all
with the option '-g 10' or similar low number (see TIPS.txt), and only then
the resulting videos work with this first release Flowstamp. Since with FFmpeg
almost any video can be maipulated and in so many ways, and for non-advanced
users to not be left behind on this issue, I include the script
FFmpeg-to-768-16by9.sh and FFmpeg-to-768-4by3.sh in this package to do just
that with your videos. Place your videos of similar aspect in a different
empty directory than this one you decompress the Flowstamp archive into, copy
one or the other of FFmpeg-to-768-xx.sh there and run it. Then check: play the
resulting mkv files and move them into this directory, and they should be
flowstampable.

So this prepocessing is currently a requirement (unless you're an expert who
can tweak all the numbers to fit for 720(704):576 and the accompanying SARs
and DARs, in which case, pls. send me the patch! I could do it myself, but I
don't anymore have an not insignificant number of days or weeks of time
available to work on it as I really must soon be done with the first release.

( I started using 768:576, instead of 720:576, for archiving TV card captures,
and also DVD dumps, because I noticed that it was simple to overlay images onto
video and always get the correct ratios and not egglike in vertical or in
horizontal, as well as I noticed I could then more easily have those correct in
Cinelerra, and I kept at it, because I never noticed any degradation in
quality. There probably is some, but really insignificant or close to.

There probably is a reason why 720:576 was, in those times, deemed better and
why it maybe would still be better even here, but as I said no time, the
support for 720(704):576 maybe in some later release. )

All the five or more paragraphs above concern the old resolution videos which
might be still the most common and the most numerous in the current captures
and in the archives of those who might be interested in using the Flowstamp
program.

No attempts will be made on my part, for lack of time, to give the tweaking
advice on numerous formats of cellphone footage ranging from low resolution to
really high resolution. No time now. Tweak it to you heart's desire and your
nerves' endurance. (Just, with those FFmpeg-to-768-xx.sh included, almost any
video can be scaled down/up to the current requirement for Flowstamp
processing.)

And it's worth mentioning that you might still need to preprocess (some of)
your video(s) anyway, even if they are spal (768x576) or hd1080 (1920x1080),
in case they're not seekable for keyframes which need to be at frequent
intervals, and not too wide apart between each other, for splitting with
mkvmerge. See "Why '-g 10' in my commands?" in the TIPS.txt.

Also, convert the audio to ogg vorbis, with ffmpeg's '-c:a libvorbis', or
tweak the script to accept the other format which you might need.

Also you would need to either convert or adapt the script for extensions like
.mp4 (which has mostly AAC video, IIRC, so the paragraph above also applied).

So simply untar the package into (another) empty directory. The usual advice
applies, such as run it as regular user and make certain you have the
necessary permissions.

Then move a few (shorter) video samples and run the base ./flowstamp script in
there to test it, modifying various lines in the scripts as needed.

For other GNU/Linux flavors you can prapare a script similar to
flowstamp-debian.sh, included in the package as example for other flavors, but
sufficient to complete the adjustment of Flowstamp program for
(Debian/Devuan?), and which runs the sed lines explained above.

Once you get the Flowstamp doing the (sum/only words)-stamping, and, unless
you opted for only stamp (watermark)-overlaying, and with/without
licence/credit/whatever overlaying at start and at end of videos, you'll want
to have your own text instead of mine be overlayed, right? And your own
logo/something else overlayed instead of the Flowstamp logo.

For your own top and bottom (very) short lines in the watermark (stamp), you
can use the script flowstamp-prepare.sh which has that option as well.

And for the (whole lot) of text at start and especially at end, that part is
also easy (to understand, but it may be more work to position those as
desired). grep for the words from my overlay at start and at end, and it'll
lead you to where the text that you need to replace with your own text is:

$ ls -1 Licet/Make_licet_TXT_at0
Licet_p1e_at0.txt
Licet_p1h_at0.txt
Licet_p2e_at0.txt
Licet_p2h_at0.txt
$

and

$ ls -1 Licet/Make_licet_TXT
Licet_p1e.txt
Licet_p1h.txt
Licet_p2b.txt
Licet_p2e.txt
Licet_p2h.txt
Licet_p3b.txt
Licet_p3e.txt
Licet_p3h.txt
...
$

Simple editor of course, no need to rename the files. If you don't need all,
just leave the ones you don't need completely empty (or just empty markup),

TO DO: the above may not be correct. CHECK THIS!

and saving the files with your text just where you found them. Learn by
trying on the sizes and colors and other things of the fonts.

Pls. read more on Licet functionality, including what that Latin word means, in
README.licet in the directory Licet of the package.

And please read more about how I, for my current lack of the better way to do
it, troubleshoot my scripts, is the section "Why the 'read FAKE' lines in my
script?" in the TIPS.txt.

This program should eventually do for you any of the things this README claims
and you wish to have it do for you. Once you get it properly
tweaked/fixed/other-action-here, and it does just what you need from it, you
can load as many videos as you have room in your system's storage or
time/other resources for.

I regret, but can't do more for those among the wishful users who can't
understand well enough how to do the above (esp. the tweaking part, which
actually involves pretty much thorough understanding of the program), and if
that is your case, I can only point you to consult your GNU/Linux system for
the necessary documentation or to search the web (never google, rather duck
for the information) for more advice/solution.

I wish many more people, esp. young, would set off into the marvelous world of
the true open software such as the programs used by this script (in comparison
to which my little program pales away into insignificance), but, I can only
write limited amount of explanation.  GNU/Linux is kind of a way of life, and
it usually requires more determined minds to partake more fully in its
beneficial offerings.

About contacting me, first thing is I'm there if I posted something on some of
the related forums/mailing lists mentioned in this documentation of the
Flowstamp program (the FFmpeg, ImagMagick, Gentoo, mailing lists/forums), if I
posted a few hours ago (and even many hours ago still). And surely I will
check for messages on "my" Github account --I have no complaint so far, but
the account is really theirs to allow or not, therefore the quotes-- (or
elsewhere if I publish this elsewhere). But if it is a few days after the last
reply on that forum/other, usually you need to wait more and sometimes it's
even weeks, but if your reply is there waiting for me, I will eventually be
there to answer.

And there may be other concerns, because I live under a regime, with only
parvences and vestages of attempted democracy (but lots of us are working to
depose them and restore the good order) so pls. read what they could even
try and jail me for, read the free speech not allowed in my country Croatia
with more about how to contact me in:

flowstamp_HR_U.txt

included in this Flowstamp archive.

Known problems: 

i) It appears that, for the videos that should sum-stamp the 64 digits from the
	  PRIMAL.sum, if in the second argument the sum is given, that sum, instead
	  of the one from PRIMAL.sum is used.
ii) But the main incompleteness or inconsistent/poor performance is
	  with licet. See in bottom of README.licet.


This README is not comprehensive. However, my scripts are heavily commented and
the log for the whole run of the script records for you what happens as the
program runs. Examine it if the program misbehaves!
