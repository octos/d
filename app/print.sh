#!/bin/sh
ver=150928 # toggles CUPS. 
#User must be allowed to passwordlessly execute systemctl (in visudo).
#TODO: if dwb not running, use simpler browser.
r='\e[0;31m' g='\e[0;32m' x='\e[0m'

cups=$(systemctl status cups cups-browsed | grep -c inactive)

if [[ $cups == 2 ]]; then
  echo -e "${g}starting${x} cups cups-browsed.."
  sudo systemctl start cups cups-browsed &&
  sleep 2; dwb localhost:631; exit
else
  echo -e "${r}stopping${x} cups cups-browsed.."
  sudo systemctl stop cups cups-browsed
fi
~/d/xsetroot.sh
