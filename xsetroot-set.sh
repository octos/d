#!/bin/bash
# updates xsetroot, is executed by ~/.xinitrc and dwm
# once used "stlarch" font by https://bbs.archlinux.org/viewtopic.php?pid=1096029#p1096029
#red=`ps cax | grep redshift | grep -o '^[ ]*[0-9]*'`
mute=`amixer get Master | tail -1 | cut -d " " -f 8`
sound=`amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/'`
cups=$(systemctl status cups cups-browsed | grep -c inactive)
#kbd=$(setxkbmap -print | grep symbols | cut -d ' ' -f 6 | sed --n 's/([^()]*)//g' | sed 's/[^"]*+\([^"]*\)+[^"]*/\1 /g' | sed 's/ *\t.*//')
kbdsimple=$(setxkbmap -print | grep symbols) 

case $mute in
    "[off]") MUTE="($sound)" ;;
    *) MUTE="$sound" ;;
esac
case $cups in 
    2) cups="";;
    *) cups="cups ";;
esac

case $kbdsimple in
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
        *) kbd="????" ;;
esac

xsetroot -name "$(echo "$cups""$kbd" "$MUTE"; date +"%y%m%d %R")"
