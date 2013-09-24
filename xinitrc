while true; do
  d/xsetroot-set.sh
  sleep 30s    # update every 30s
done &

xset +fp /usr/share/fonts/local
xset fp rehash

redshift -l 45.427778:-75.710556 &
unclutter -idle 2 -noevents -root &
urxvtd &
xset r rate 250 50
setxkbmap us -variant altgr-intl
setxkbmap -option 'compose:rwin' #win_R is compose key (',a,á)
setxkbmap -option caps:escape
#display -window root "$(find ~/d/wall -type f | shuf -n1)" #had problems with compton
#hsetroot -full d/wall.jpg
hsetroot -full "$(find ~/d/wall -type f | shuf -n1)"
#exec dwm
d/startdwm  #refreshable dwm
