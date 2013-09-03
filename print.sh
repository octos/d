#!/bin/sh
ver="130205" #toggles CUPS. To work, user must be allowed to passwordlessly execute systemctl (in visudo).
#TODO: run if dwb runs, run like this; if not, dwb sinle page, no addons, or simpler browser.
r='\e[0;31m' g='\e[0;32m' x='\e[0m'

cups=$(systemctl status cups cups-browsed | grep -c inactive)

if [[ $cups == 2 ]]; then
  echo -e "${g}starting${x} cups cups-browsed.." 
  sudo systemctl start cups cups-browsed &&
  sleep 1; dwb localhost:631; exit
else
  echo -e "${r}stopping${x} cups cups-browsed.."
  sudo systemctl stop cups cups-browsed
fi
~/d/xsetroot-set.sh
