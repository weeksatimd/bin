#!/bin/bash
 
# ======= CONFIG ============================================
workdir=~/bin/tmp
infile="$workdir/combo.png"
# set this to the location of ImageMagick's convert command
CONVERTER="/usr/local/bin/convert"
# set this to the location where your Image geeklet will look
OUTFILE="$workdir/reflected.png"
# ===========================================================
 
# don't mess with these
 
# create the pieces of the date (year, month, day) in $TMPDIR
#date +'%Y' | $CONVERTER -background none -fill white -kerning -9 -font Helvetica -pointsize 120 -trim -bordercolor none -border 0x8 label:@- $workdir/year.png
date +'%A %I:%M' | $CONVERTER -background none -fill white -kerning 10 -font Helvetica -pointsize 70 -trim -bordercolor none -border 0x8 label:@- $workdir/day.png
date +'%B %d' | $CONVERTER -background none -fill white -kerning 0 -font Helvetica -pointsize 200 label:@- -trim $workdir/month.png
# stack the day on top of the month
$CONVERTER $workdir/day.png $workdir/month.png -background none -transparent black -trim -append $infile
# rotate the result 90 degrees
# $CONVERTER $workdir/daymonth.png -background none -trim -rotate 90 $workdir/daymonth90.png
# stack the year on top of the rotated day/month and rotate the result -90 degrees
#$CONVERTER $workdir/year.png $workdir/daymonth90.png -gravity northeast -background none -append -rotate -90 $infile
# set the width and height variables
ww=`$CONVERTER $infile -format "%w" info:`
hh=`$CONVERTER $infile -format "%h" info:`
#hhr=`$CONVERTER xc: -format "%[fx:$hh*40/50]" info:`
# clone the original image, flip it, composite a gradient and append it below the original
$CONVERTER $infile \
\( -size ${ww}x0 xc:none \) \
\( -clone 0 -flip +repage \) \
\( -clone 0 -alpha extract -flip +repage \
-size ${ww}x${hh} gradient: +level 0x50% \
-compose multiply -composite \) \
\( -clone 2 -clone 3 -alpha off -compose copy_opacity -composite \) \
-delete 2,3 -channel rgba -alpha on -background none -append $OUTFILE
exit 0
