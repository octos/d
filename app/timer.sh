#!/bin/sh
#v.151008X simple timer with countdown 
#Usage: timer [-e] n_minutes
#TODO: rewrite in C
#TODO: fails with 009 and goes negative with 0

#Pomodorization suggestions:
# Whitenoise for 25 minutes, then stop
#  $ noise; timer 25; toggle noise
# Silent for 25 minutes, then ring
#  $ timer 25; (sox something)
# Whitenoise for 25 minutes, then radio
#  $ noise; timer 25; radio

#[ -z "$1" ] && cat $0 && echo "Usage: $0 minutes" && exit
case $1 in -e) $EDITOR $0; exit;;
  ''|*[!0-9]*) sed '2,3!d' $0 | sed 's/^#//'; exit ;;
esac

n=$(( $1-1 ));
for m in $(seq $n 0); do
    printf " %02d : %02d \r"  $m $s | tee ~/.pomodoro  #write to file every minute
    for s in $(seq 59 0); do
        printf " %02d : %02d \r"  $m $s
        sleep 1
    done
done
