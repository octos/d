#!/bin/sh
ver=150928L # pomodoro. Needs dwm,toggle.sh,lock.sh,xsetroot.sh
# [25,5,25,5,25,5,25,15]

function brek {
  notify-send "$1 $2m"
  mpv --really-quiet gui.wav
  sleep 5  #give time to store keyboard
  echo -e "off"
# xset dpms force off
  ~/d/lock.sh & }

soon() {
  notify-send -u low "$1 in 1m"
  echo -e "$1 in 1m"; }

function work {
  killall -q slock #unlocks even if locked manually
# xset dpms force on
# sleep 6  #give monitor time to load
  notify-send -u low "Wrk! $1m"
  mpv --really-quiet gui.wav
  echo -e "on"; }

function zzz {
  notify-send -u low "SLEEP!"
  mpv --really-quiet gui.wav
  sleep 1m  #give time to save
# systemctl suspend
  echo -e "zzz"; }

trap 'rm ~/.pomodoro; ~/d/xsetroot.sh' EXIT TERM
log=~/.pomodoro
dt=`date +%H%M`

while true; do
#if [[ $dt > "2200" ]]; then zzz; fi #works until 00:00

	for a in {1..3} ; do #1..3 bcause 4th pomo is followed by long break
	
        if [[ $2 == "" ]]; then wrk=25; brk=5  #reset wrk and brk value
        else wrk=$1; brk=$2
        fi
      	
        work "$wrk" 
        while [ $wrk -gt 0 ]; do
	        for w in {1..$wrk} ; do
            if [[ $wrk = "1" ]]; then soon "Brk"; fi #notify 1m before brk
                echo -ne "$wrk\r"
                echo -ne "$a-$wrk`for (( x = 1; x <= $wrk; x += 1)); do echo -n "\\\\";done` " > $log #"\\\\" each '\' is elegantly 2m
                ~/d/xsetroot.sh
                wrk=$((wrk-1)) 
	        	sleep 1m
             done
        done

        brek "Brk" "$brk" 
        while [ $brk -gt 0 ]; do
	        for b in {1..$brk} ; do
                echo -ne "$brk\r"
                echo -ne "$a-$brk`for (( x = 1; x <= $brk; x += 1)); do echo -n "z";done` " > $log
                ~/d/xsetroot.sh
                brk=$((brk-1)) 
	    	    sleep 1m
            done
        done

	done #completed 25,5 x3
        
        if [[ $2 == "" ]]; then wrk=25; brk=$((5*3))  #brk set to x3 for long break
        else wrk=$1; brk=$((brk*3))
        fi
       
        work "$wrk"
        while [ $wrk -gt 0 ]; do #same as wrk above, only $a+1 (cycle), because a new loop started. Also soon gets diff 'soon' arg.
	        for w in {1..$wrk} ; do
            if [[ $wrk = "1" ]]; then soon "LongBrk"; fi #notify 1m before brk
                echo -ne "$wrk\r"
                echo -ne "$(($a+1))-$wrk`for (( x = 1; x <= $wrk; x += 1)); do echo -n "\\\\";done` " > $log
                ~/d/xsetroot.sh
                wrk=$((wrk-1)) 
	        	sleep 1m
             done
        done

        brek "LongBrk" "$brk"
        while [ $brk -gt 0 ]; do
            for g in {1..$brk} ; do
                echo -ne "$brk\r"
                echo -ne "l`for (( x = 1; x <= $brk; x += 1)); do echo -n "o";done`ng " > $log
                ~/d/xsetroot.sh
                brk=$((brk-1)) 
	    	    sleep 1m
            done
        done
done
