#!/bin/sh
# pauses dunst before locking; no more flickering
killall dunst
setxkbmap us altgr-intl
notify-send DUNST_COMMAND_PAUSE
slock
notify-send DUNST_COMMAND_RESUME
