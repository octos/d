#!/bin/bash
ver="130126" #recompiles dwm
cd /home/kv/z/dwm
urxvt -e "notify-send "recompiling dwm"
makepkg -g >> PKGBUILD
makepkg -efi --noconfirm
cd ~
notify-send "..done! restart it""
