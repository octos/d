#!/bin/sh
#v.150930X plays background noise. Need sox
#Exec with pomi.sh, toggle wtih toggle.sh or killall play
play -qn synth pinknoise band -n 1200 200 &
