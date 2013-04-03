#!/bin/bash
a=$1
PIDS=`ps cax | grep $a | grep -o '^[ ]*[0-9]*'`
if [ -z "$PIDS" ]; then
  echo "running $a"
    case $a in
      redshift) redshift -l 45.427778:-75.710556 &;;
      unclutter) unclutter -noevents -idle 1 &;;
      *) $a;;
    esac
  exit
else
  for PID in $PIDS; do
      echo "killing $a"
      kill $PID
  done
fi
