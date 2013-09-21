#!/bin/bash
#TODO: after ZZ, .pomi not cleared
# X to refresh xset after stopping, .bar in dwm works; but replace it.
# pomi will unlock manually-locked screen once "work" is reached.
#
function brek {
  notify-send "Brk! $1"
  mplayer --really-quiet gui.wav
  sleep 5  #give time to store keyboard
  killall dunst #to prevent flickering
  echo -e "off"
  d/lock.sh &
  #xset dpms force off
}

function soon {
  notify-send -u low "Brk in 1"
  echo -e "break soon"; }

function work {
  killall slock
  #xset dpms force on
  notify-send -u low -t 100 "Wrk! $1"
#  sleep 6  #give monitor time to load
  mplayer --really-quiet gui.wav
  echo -e "on"
}

function zzz {
  notify-send -u low "SLEEP!"
  mplayer --really-quiet gui.wav
#  sleep 6  #give time to save
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

echo "wrk $wrk, brk $brk" #temp

while true; do
#if [[ $dt > "2200" ]]; then
  #  zzz
#fi
	for a in {1..2} ; do
	  	
        work "$wrk" 
        while [ $wrk -gt 0 ]; do
	        for w in {1..$wrk} ; do
            if [[ $wrk = "1" ]]; then soon; fi #notify when 1 minute remaining
                echo -e "$wrk\r"
                echo -e -n "$wrk`for (( x = 1; x <= $wrk; x += 1)); do echo -n "\\\\";done` " > $log #"\\\\" elegantly shows half of what it should =)
#                echo -e -n "`for (( x = 1; x <= $wrk; x += 1)); do echo -n "+";done` $wrk " > $log #original
#                echo "$wrk " > $log          #replacement is above (with progress testing)
                /home/kv/d/xsetroot-set.sh
                wrk=$((wrk-1)) 
	        	sleep 1m
             done
        done
        brek " $((-$brk))" 

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
                echo "longbreakk " > $log #TEST write long break in .pomodoro
    sleep $((-$brk*3))m
done

