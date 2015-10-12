#!/bin/bash
#v.150928  set unicode kbd layout. Executed by dwm

sel=`head -7 ~/d/app/layout.sh | tail -4 | sed 's/#//'| dmenu -i -fn $FONT -sb "#660000" -p "setxkbdmap:"`
kbdsimple=$(setxkbmap -print | grep symbols) 

case $sel in
    cans) kbd="iu" ;;
    latn) kbd="us altgr-intl" ;;
    clmk) kbd="colemak" ;;
    cyrl) kbd="ru phonetic" ;;
    !) $EDITOR d/app/layout.sh ;;
    *) kbd="$sel" ;;
esac
setxkbmap $kbd
~/d/xsetroot.sh
notify-send $sel -t 10
