#!/bin/bash
# select from all keyboard layouts supported by Unicode. Executed by dwm

#cans
#latn
#cyrl
##xsux

sel=`head -7 ~/d/layout.sh | tail -4 | sed 's/#//'| dmenu`
kbdsimple=$(setxkbmap -print | grep symbols) 

case $sel in
    cans) kbd="iu" ;;
    latn) kbd="us altgr-intl" ;;
    clmk) kbd="colemak" ;;
    cyrl) kbd="ru phonetic" ;;
    *) kbd="$sel" ;;
esac
setxkbmap $kbd
~/d/xsetroot-set.sh
notify-send $sel
