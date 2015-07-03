This is README.licet from Flowstamp program.

The Flowstamp program, a set of scripts in Bash, and the name Flowstamp are:

Copyright (C) 2015 Miroslav Rovis, <http://www.CroatiaFidelis.hr/>

released under BSD license, pls. see LICENSE

Pls. see also the main README.

The optional Licet functionality of the Flowstamp program adds a text such as
licensing sequence at start and at end of an (optionally) already flowstamped
video.

'licet' in Latin language means 'it is permitted', third person singular of verb
to allow, permit, and it is pronounced leetzet.

This archive contains all that is necessary for ALLEG/MODER/LENTO (which stands
for 'allegro'/'moderato'/'lento', meaning, in Italian, at fast pace/at moderate
pace/at slow pace) pics moving by 2/4/10 pixels per frame (we are talking about
overlaying 25fps videos, the move by pixel is different for 30fps and 50fps
which are also supported for some video sizes). Best fit (currently hardcoded):

ALLEG is for under 4 minutes videos, adds 1+- min altogether, while MODER is
for over 4 but under 40 minutes and LENTO is for over 40 minutes videos.

MODER/LENTO add some 20/40 seconds at start and 2-/3+ minutes at end (for 25fps).

They all add these sequences to videos which have previously been optionally
flowstamped with their own sha256 sum (the principal purpose for the coming to
existence of this script, but it can still be left out, read the README and
scripts for instructions how to do it, grep flowstamp script proper for the
string 'touch no-sum-stamping').

See the section 'Known problems:' in bottom.

So if there are available previously made files such as these:
$ ls -l Licet_MOV/
total 19036976
-rw-r--r-- 1 miro miro   45504115 2015-07-02 18:06 Fs_ALLEG_4x3_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  241407081 2015-07-03 10:02 Fs_ALLEG_4x3_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro   45504115 2015-07-02 17:44 Fs_ALLEG_4x3r50_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  241407081 2015-07-02 18:01 Fs_ALLEG_4x3r50_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro   43372613 2015-07-02 18:29 Fs_ALLEG_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  242515500 2015-07-03 09:33 Fs_ALLEG_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  247554943 2015-07-02 17:11 Fs_ALLEG_r30_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro 1397409099 2015-07-02 17:38 Fs_ALLEG_r30_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  174644731 2015-07-02 22:47 Fs_LENTO_4x3_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro 1020648693 2015-07-03 00:12 Fs_LENTO_4x3_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  174644731 2015-07-02 23:46 Fs_LENTO_4x3r50_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro 1020648693 2015-07-03 01:02 Fs_LENTO_4x3r50_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  176052280 2015-07-02 20:59 Fs_LENTO_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro 1025215956 2015-07-02 22:17 Fs_LENTO_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro 1124279137 2015-07-02 17:46 Fs_LENTO_r30_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro 6347741621 2015-07-02 20:08 Fs_LENTO_r30_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  100795151 2015-07-03 03:30 Fs_MODER_4x3_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  552393191 2015-07-03 04:19 Fs_MODER_4x3_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  100795151 2015-07-02 19:57 Fs_MODER_4x3r50_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  552393191 2015-07-02 20:39 Fs_MODER_4x3r50_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  101853516 2015-07-02 18:58 Fs_MODER_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  555019967 2015-07-02 19:43 Fs_MODER_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro  599840972 2015-07-03 01:11 Fs_MODER_r30_at0_on_black_nLOGO.mov
-rw-r--r-- 1 miro miro 3362125791 2015-07-03 02:30 Fs_MODER_r30_on_black_nLOGO.mov
$
then they can be used (of course, those need to be previously made with
flowstamp and/or fit exactly the aspect, the length etc.). Those, on their
part, exactly, are made, if they don't exist (such as, most likely, from a
previous run), with a script of the name:

./Fs_NNNNN[_r30|r50]_xxx.sh

where NNNNN is either ALLEG, LENTO or MODER, and the infix _r30 or _r50 is only
there if the mov file was made for 30fps or 50fps video, and therefore ought to
be of that same rate.

As I said above, and mentioned elsewhere in the scripts and main README, this
program and so this licet functionality can be used for other FPS videos (this
first release has been tested with 25fps, 30fps (768x576 4/3) and 50fps
(1920x1080 16/3), but for any other size/rate you need to tweak it for yourself
(really only advanced users will be able to do that, I'm afraid...).

WARNING: The following is old text, not completely true in April 2015.
Especially I really can't test, as currently I don't have a recent
Debian/Devuan install.

Due to different default fontconfig settings in different GNU/Linuces, and I
have successfully run this first release of Flowstamp on Gentoo and on
(Debian/Devuan?), the result on one can be somewhat different than on the
other. With all the fonts set in the script equally installed, but with
different versions of GTK!  On one (Debian/Devuan?), the fonts are scaled a
little smaller than on the other, with the exactly same script settings, and
one (the Debian/Devuan?) shows the last words of the licet sequences earlier in
the run of the overlayed video than the other (the Gentoo).

I have not anymore days time available to dedicate to this issue and find a way
to get the script achieve same results on both (and likely on OSes of other
users, for which I believe a rewrite in some other programming language would
be necessary).

Known problems:

The licet overlay added to the start and end of video is not of consistent
flowing speed for different rates of videos, and it should be. What I mean, is:
it should flow over the screen in such way as to pass accross the screen
(describing it as the viewer sees it, and describing first the main
flowstamping functionality) the entire loop of two "Flowstamped overlayed"
which correspond to one entire SHA256 sum in the same period of time for all
the supported rates (currently 25, 30 and 50), and in a similar way, for licet
functionality there should be the same appearing of the same sequences of text,
and the added starting and ending sequence to the video, without extra empty
runs (such as most apparently with the 50fps rate video).

And in the licet sections there are pauses (one in the LENTO starting, and a
few in ALLEG/MODER/LENTO ending) that can not be easily controlled. They were
there when I initially wrote those licet managing scripts sometimes in
2012/2013, and have been there ever since. I have not touched them, or very
little, in this 2015.  Those pauses have the purpose of letting the viewer see
particular parts of the corresponding sequence, such as the part that shows the
contacts, or if it is a credit sequence, the main author of a project/of a
film/a documentary/other or whichever that it be. But they should be fixable at
the start of a particular text that pango wants to turn into images, and then
into the mov overlay for our video. And I have not yet even grasped vaguely the
idea how to achieve that.

However, to achieve both of the above, the licet functionality, most notably
the creation of the licet mov from the picture, need to he rewritten
altogether. No time, and probably no time soon, on my part. Patches that fix
this properly will be gratefully accepted though (just remember my slowliness
in replying, and in doing things, please!).

On the other hand, the entire idea of how to flow the text, how to pause it,
how to add transparency and more is there for you to develop on, if you are one
of the real programmers than could likely be able to do it in a fraction of
time that I dedicated to it! (Well, probably not that you either didn't know
that, or that you wouldn't figure it out pretty easily yourself, if you are one
of the wizards, but, lo, I haven't seen anything similar, or at least any
complete idea like this one, deployed yet and available as GPL-compliant code
--and for non-GPL compliant I really couldn't care less--...)

This README is not comprehensive. However, my scripts are heavily commented and
the log for the whole run of the script records for you what happens as the
program runs. Examine it if the program misbehaves!
