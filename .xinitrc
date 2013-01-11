while true; do
   z/xsetroot-set.sh
   sleep 1m    # update every 1m
done &

redshift -l 45.427778 -75.710556 &
unclutter &
urxvtd &

#exec dwm
z/startdwm  #refreshable dwm
