#!/bin/bash
a=$1
sig=$2
PIDS=`ps cax | grep $a | grep -o '^[ ]*[0-9]*'`
if [[ $2 == "" ]]; then
    sig=15; fi
if [ -z "$PIDS" ]; then
 echo "running $a"
  case $a in
    pomi.sh) ~/d/pomi.sh;;
    redshift) redshift -l 45.427778:-75.710556 &;;
    unclutter) unclutter -noevents -idle 1 &;;
    *) $a;;
  esac
 exit
else
 for PID in $PIDS; do
    echo "killing $a"
  case $a in #pomi.sh needs to be killed with sig 9
   pomi.sh) kill -s 9 $PID; rm ~/.pomodoro; notify-send "pomi.sh killed";;
         *) kill -s $sig $PID;;
  esac
 done
fi
