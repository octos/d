#!/bin/bash
#v.151202X kill $1 if it's running

[ -z "$1" ] && cat $0 && echo "Usage: $0 program_to_kill" && exit
sig=$2

PIDS=`ps cax | grep -i $1 | grep -o '^[ ]*[0-9]*'`
if [[ $2 == "" ]]; then
    sig=15; fi
if [ -z "$PIDS" ]; then
  echo "$1 was not running." 1>&2
  exit 1
else
  for PID in $PIDS; do
      kill -s $sig $PID #SIGTERM (15) is the default and safest kill. SIGQUIT (3) is safer.
  done; fi
