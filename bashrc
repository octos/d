# org
alias df='df -h'

# app
alias a='ranger'
alias A='sudo ranger'
alias y='youtube-viewer -C --gcap=/usr/bin/gcap --get-captions'
alias v='vim'
alias V='sudo vim'
alias h='history | grep $@'
alias ccc='setxkbmap us -variant colemak; z/xsetroot-set.sh'
alias qqq='setxkbmap us -variant altgr-intl; z/xsetroot-set.sh'
alias res='xrandr --output VGA1 --mode 1680x1050'
alias redwm='cd ~/z/dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; killall dwm'
alias scgt='z/killifrunning.sh rejoystick; rejoystick -d; cd .wine/drive_c/Program\ Files/SCGTmini/; wine Spcar.exe'

# pkg
alias R='sudo pacman -R'
alias S='sudo pacman -S'
alias s='yaourt'
alias U='sudo pacman -Syyu'

# sys
alias Q='systemctl hibernate'
alias W='systemctl suspend'
alias Z='systemctl poweroff'
alias ZZ='systemctl reboot'
