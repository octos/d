while true; do
  d/xsetroot-set.sh
  sleep 30s    # update every 30s
done &

xset +fp /usr/share/fonts/local
xset fp rehash

redshift -l 45.427778:-75.710556 &
unclutter -idle 2 -noevents &
urxvtd &
xset r rate 250 50
setxkbmap us -variant altgr-intl
hsetroot -full d/wall.jpg

#exec dwm
d/startdwm  #refreshable dwm
