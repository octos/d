#!/bin/bash
ver="130222" #recompiles dwm
cd /home/kv/d/dwm
notify-send "recompiling dwm";
urxvt -e makepkg -g >> PKGBUILD;
urxvt -e makepkg -efi --noconfirm;
cd ~;
notify-send "..done! restarting it"
killall dwm
