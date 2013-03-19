#!/bin/bash
# updates xsetroot, is executed by .xinitrc and dwm
mute=`amixer get Master | tail -1 | awk '{print $NF}'`
vol=`amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/' | sed 's/%//'`
cups=$(systemctl status cups cups-browsed | grep -c inactive)
kbd=$(setxkbmap -print | grep symbols) 
pomi=$(cat ~/.pomodoro) 

case $mute in
    "[off]") sound="$vol""M" ;;
    *) sound="$vol%" ;;
esac
case $cups in 
    2) cups="";;
    *) cups="cups ";;
esac

case $kbd in
    *+am*) kbd="Armn" ;;
   *+ara*) kbd="Arab" ;;
    *+ca*) kbd="Cans" ;;
    *chr*) kbd="Cher" ;;
    *+ru*) kbd="Cyrl" ;;
    *+ge*) kbd="Geor" ;;
    *+gr*) kbd="Grek" ;;
    *+il*) kbd="Hebr" ;;
*colemak*) kbd="Clmk" ;;
    *+us*) kbd=""     ;;
        *) kbd="kbd?" ;;
esac

xsetroot -name "$(echo "$pomi""$cups""$kbd" "$sound"; date +"%y%m%d %R")"
