#!/bin/sh
# dwb: xk
# plays khan academy in mpv
set -e
if [[ ! $1 == "" ]]; then
    vid=`echo "$1" | sed 's#.*/##'`; echo "playing form stdin"
elif [[ ! $DWB_URI == "" ]]; then
    vid=`echo "$DWB_URI1" | sed 's#.*/##'`; echo "playing form DWB_URI"
else
    vid=$(xsel -o); echo "playing from clipboard" #no need to sed out final part, here.
    notify-send "playing "$vid""
    mpv --quiet --speed=1.46 "$vid" | jshon -e download_urls -e mp4 -u 2>/dev/null
    exit
fi
notify-send "playing $vid"
mpv --quiet --speed=1.46 `curl -S http://www.khanacademy.org/api/v1/videos/"$vid" | jshon -e download_urls -e mp4 -u 2>/dev/null`
exit
