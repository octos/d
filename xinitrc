while true; do
  d/xsetroot-set.sh
  sleep 30s    # update every 30s
done &

xset +fp /usr/share/fonts/local
xset fp rehash

rm ~/.pomodoro
unclutter -idle 2 -noevents -root &
redshift -l 45.425:-75.70 &
urxvtd &
keynav &
xset r rate 250 50
setxkbmap us -variant altgr-intl
setxkbmap -option caps:escape -option compose:rwin #win_R is compose key (',a,á)
hsetroot -full "$(find d/wall -type f | shuf -n1)"
#display -window root "$(find d/wall -type f | shuf -n1)" #had problems with compton
mpd

#exec dwm
d/startdwm  #refreshable dwm
