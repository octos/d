#!/bin/sh
#v.151004X toggles $1 (with optional custom SIG)
sig=$2
case $1 in
  *pomi.sh) sig=6;; #pomi.sh must be killed with sig 9
  *noise.sh|noise) realnm=play;;
  -e) $EDITOR $0; exit;;
  -l) ps cax; exit;;
  ""|-*) echo "Usage: $0 [-e] \"program [ARGUMENT]\" SIG"; exit;;
  *) realnm=$1;;
esac

PIDS=`ps cax | grep $realnm| grep -o '^[ ]*[0-9]*'`
case $2 in  ''|*[!0-9]*) sig=15;; esac #if $2 is not a number

if [ -z "$PIDS" ]; then
 echo "running $1"
  case $1 in
    *pomi.sh) ~/c/d/app/pomi.sh;;
    *noise.sh|noise) ~/c/d/app/noise.sh &;;
    redshift) redshift -l 45.425:-75.70 &;;
    unclutter) unclutter -noevents -idle 1 &;;
    *) $1 &;;
  esac
 exit
else
 for PID in $PIDS; do
   echo "killing $1 ($realnm)"
   case $1 in #pomi.sh here below should probably be simpler
     pomi.sh) kill -s $sig $PID; notify-send -u low -t 100 "pomi stopped"; ~/c/d/app/xsetroot.sh;; # SIGABRT (6) to rm .pomodoro
     *) kill -s $sig $PID;;
   esac
 done
fi
