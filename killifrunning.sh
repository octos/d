#!/bin/bash
a=$1
sig=$2
PIDS=`ps cax | grep $a | grep -o '^[ ]*[0-9]*'`
if [[ $2 == "" ]]; then
    sig=15; fi
if [ -z "$PIDS" ]; then
  echo "$a was not running." 1>&2
  exit 1
else
  for PID in $PIDS; do
      kill -s $sig $PID #SIGTERM (15) is the default and safest kill. SIGQUIT (3) is safer.
  done; fi
