#!/bin/bash

function brek {
  notify-send "Break! $1"
  mplayer --really-quiet gui.wav
  sleep 4  #give time to store keyboard
  echo -e "off"
  xset dpms force off
}

function work {
  xset dpms force on
  notify-send "Work! $1"
  sleep 6  #give monitor time to load
  mplayer --really-quiet gui.wav
  echo -e "on"
}

function zzz {
  notify-send "SLEEP!"
  mplayer --really-quiet gui.wav
  sleep 6  #give time to save
  echo -e "zzz"
#  systemctl suspend
}


 #[25,5,25,5,25,5,25,15]


log=~/.pomodoro
dt=`date +%H%M`
#rm -f $log #clear old log first (not needed; removed on exit)
trap 'rm ~/.pomodoro' EXIT TERM


if [[ $2 == "" ]]; then
  wrk=25
  brk=-5
else
  wrk=$1
  brk=-$2
fi

echo "wrk $wrk" #temp
echo "brk $brk" #temp

while true; do
if [[ $dt > "2200" ]]; then
    zzz
fi
	for a in {1..3} ; do
	  	
        work "for $wrk" 
        while [ $wrk -gt 0 ]; do
	        for w in {1..$wrk} ; do
                echo -e "$wrk\r"
                echo -e -n "`for (( x = 1; x <= $wrk; x += 1)); do echo -n "#";done` $wrk " > $log
#                echo "$wrk " > $log          #replacement is above (with progress testing)
                wrk=$((wrk-1)) 
	        	sleep 1m
             done
        done
        brek "for $((-$brk))" 

        while [ $brk -lt 0 ]; do
	        for b in {1..$brk} ; do
                echo -e "$brk\r"
                echo "$brk " > $log
                brk=$((brk+1)) 
	    	    sleep 1m
            done
        done

        wrk=25 #resets counter to def 25 or $1 (not var yet)
        brk=-5 #resets counter to def 05 or $2 (not var yet)

	done

    brek "long break" 
    echo -e "long $((-$brk*3))-min break" #temp
    sleep $((-$brk*3))m
done

