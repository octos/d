#!/bin/bash
ver=190926 # toggles $1 with custom arguments
sig=$2
PIDS=`ps cax | grep $1 | grep -o '^[ ]*[0-9]*'`
if ! [[ $2 =~ '^[0-9]+$' ]]; then #if $2 is not a number
    sig=15
fi
if [ -z "$PIDS" ]; then
 echo "running $1"
  case $1 in
    pomi.sh) ~/d/pomi.sh;;
    #play) play -n synth pinknoise band -n 1200 200 2>/dev/null &;;
    play) ~/d/noise.sh &;;
    redshift) redshift -l 45.425:-75.70 &;;
    unclutter) unclutter -noevents -idle 1 &;;
    *) $1;;
  esac
 exit
else
 for PID in $PIDS; do
   echo "killing $1"
   case $1 in #pomi.sh needs to be killed with sig 9
     pomi.sh) kill -s 6 $PID; notify-send -u low -t 100 "pomi stopped"; ~/d/xsetroot-set.sh;; # SIGABRT (6) to rm .pomodoro
     *) kill -s $sig $PID;;
   esac
 done
fi
