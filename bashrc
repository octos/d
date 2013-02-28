# dupeless history
export HISTCONTROL="ignoredups"
#export PATH=$PATH:/usr/sbin/:/usr/local/bin:/home/kv/.gem/ruby/1.9.1/bin
export EDITOR=vim
export PAGER=less

# org
alias df='df -h'
alias sudo='sudo '

# app
alias a='ranger'
alias A='sudo ranger'
alias y='youtube-viewer -C'
alias v='vim'
alias V='sudo vim'
alias h='history | grep $@'
alias ccc='setxkbmap us -variant colemak; d/xsetroot-set.sh'
alias qqq='setxkbmap us -variant altgr-intl; d/xsetroot-set.sh'
alias res='xrandr --output VGA1 --mode 1680x1050'
alias redwm='cd ~/d/dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; cd'
alias scgt='d/killifrunning.sh rejoystick; rejoystick -d; cd .wine/drive_c/Program\ Files/SCGTmini/; wine Spcar.exe'

# pkg
alias R='sudo pacman -R'
alias S='sudo pacman -S --needed --noconfirm'
alias s='yaourt'
alias U='sudo pacman -Syyu; exit'

# sys
alias Q='systemctl hibernate'
alias W='systemctl suspend'
alias Z='systemctl poweroff'
alias ZZ='systemctl reboot'


alias t='google-translate da en'
