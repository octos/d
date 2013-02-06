#!/bin/sh
ver="130205" #toggles CUPS. To work, user must be allowed to passwordlessly execute systemctl (in visudo).
r='\e[0;31m' g='\e[0;32m' x='\e[0m'

cups=$(systemctl status cups cups-browsed | grep -c inactive)

if [[ $cups == 2 ]]; then
  echo -e "${g}starting${x} cups cups-browsed.."
  systemctl start cups cups-browsed
  dwb localhost:631
else
  echo -e "${r}stopping${x} cups cups-browsed.."
  sudo systemctl stop cups cups-browsed
fi
~/d/xsetroot-set.sh
