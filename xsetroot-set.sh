#!/bin/bash
# updates xsetroot dwm when executed. is executed by ~/.xinitrc
# once used "stlarch" font by https://bbs.archlinux.org/viewtopic.php?pid=1096029#p1096029
mute=`amixer get Master | tail -1 | cut -d " " -f 8`
red=`ps cax | grep redshift | grep -o '^[ ]*[0-9]*'`
sound=`amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/'`
mem=$(free -m |awk '/cache:/ { print $3"M" }')
cups=$(systemctl status cups cups-browsed | grep -c inactive)

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
case $cups in    #capital P: printing on, lower p: printing off
    2) cups="p0";;
    *) cups="P1";;
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
xsetroot -name "$(echo "$cups" "$kbd" "$MUTE" "$mem"; date +"%y%m%d-%u %R")"
exit
