#!/bin/bash
a=$1
PIDS=`ps cax | grep $a | grep -o '^[ ]*[0-9]*'`
if [ -z "$PIDS" ]; then
  echo "$a was not running." 1>&2
  exit 1
else
  for PID in $PIDS; do
    kill $PID
  done
fi
