#!/bin/sh
# color picker by kv 130109. execute from dwm.
#picked=`xoris -N | sed 's/#//'`
picked=`printf "%02X%02X%02X\n" $(stint)`
luma=$(echo $((0x$picked)) )

if [ $luma -gt 8388607 ]  # if lighter than 50% gray..
then
    fgtxt="#000000"       # make txt black
else
    fgtxt="#ffffff"
fi

notify-send "#$picked" -h string:bgcolor:#$picked -h string:fgcolor:$fgtxt
echo "#$picked" | tr \\n \\0 | xsel -i
#echo "#$picked"
