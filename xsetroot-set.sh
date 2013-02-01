#!/bin/bash
# updates xsetroot dwm when executed. is executed by ~/.xinitrc
# used to use "stlarch" font by https://bbs.archlinux.org/viewtopic.php?pid=1096029#p1096029
mute=`amixer get Master | tail -1 | cut -d " " -f 8`
red=`ps cax | grep redshift | grep -o '^[ ]*[0-9]*'`
sound=`amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/'`
mem=$(free -m |awk '/cache:/ { print $3"M" }')
#MUTE="dunno"
#echo $sound
case $sound in
    0%) sound=" 0%" ;;
    3%) sound=" 3%" ;;
    6%) sound=" 6%" ;;
    100%) sound="00%" ;;
esac
#echo $mute
case $mute in
    "[off]") MUTE="($sound)" ;;
    *) MUTE=" $sound " ;;
esac

setxkbmap -print | grep -q colemak
if [ $? -eq 0 ]; then
    kbd="C"
    #echo $kbd
else
    kbd="Q"
    #echo $kbd
fi

#echo $red
# if red doesn't work..
#if [ -z "$red" ]; then
#    RED=""
#else
#    RED=""
#fi
xsetroot -name "$(echo "$kbd" "$MUTE" "$mem"; date +"%y%m%d-%u %R")"
exit
