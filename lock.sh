#!/bin/sh
# pauses dunst before locking; no more flickering
killall dunst
notify-send DUNST_COMMAND_PAUSE
slock
notify-send DUNST_COMMAND_RESUME
