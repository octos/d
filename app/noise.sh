#!/bin/sh
#v.150930X plays background noise. Need sox
#Usage: exec with pomi.sh, toggle wtih toggle.sh or killall play
[ -z !"$1" ] && cat $0 && exit
play -qn synth pinknoise band -n 1200 200 &
