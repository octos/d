#!/bin/sh
#v.151003X simple timer with countdown 
#Usage: $0 [-e] n_minutes

#[ -z "$1" ] && cat $0 && echo "Usage: $0 minutes" && exit
case $1 in -e) $EDITOR $0; exit;;
  ''|*[!1-9]*) sed '2,3!d' $0 | sed 's/^#//'; exit ;;
esac

n=$(( $1-1 ));
for m in $(seq $n 0); do
    for s in $(seq 59 0); do
        printf " %02d : %02d \r"  $m $s
        sleep 1
    done
done
