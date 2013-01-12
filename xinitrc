while true; do
   z/xsetroot-set.sh
   sleep 1m    # update every 1m
done &

redshift -l 45.427778:-75.710556 &
unclutter -idle 2 -noevents &
urxvtd &
xset r rate 260 50
setxkbmap us -variant altgr-intl

#exec dwm
z/startdwm  #refreshable dwm
