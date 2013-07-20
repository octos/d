. ~/d/bash_private # source my private variables

# dupeless history
export HISTCONTROL="ignoredups"
export HISTSIZE=4000
export PATH=$PATH:/usr/sbin/:/usr/local/bin:/home/kv/.gem/ruby/1.9.1/bin
export EDITOR=vim
export PAGER=less
export FONT="-*-profont-*-*-*-*-11-*-*-*-*-*-*-*"

# org
alias df='df -h'
alias ls='ls --color=always'
alias grep='grep --color=always'
alias sudo='sudo '

# app
alias a='ranger'
alias A='sudo ranger'
alias m='mplayer'
alias p='sxiv' #needs X
alias y='youtube-viewer -C'
alias v='vim'
alias V='sudo vim'
alias x='mutt'
alias z='htop'
alias h='history | grep $@'
alias ccc='setxkbmap us -variant colemak; d/xsetroot-set.sh'
alias qqq='setxkbmap us -variant altgr-intl; d/xsetroot-set.sh'
alias res='xrandr --output VGA1 --mode 1680x1050'
alias redwm='cd ~/d/dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; cd'
alias scgt='d/killifrunning.sh rejoystick; rejoystick -d; cd .wine/drive_c/Program\ Files/SCGTmini/; wine Spcar.exe'
alias sto='~/sto.sh'

# pkg
alias R='sudo pacman -R'
alias S='sudo pacman -S --color=always --needed --noconfirm'
alias s='yaourt'
alias U='sudo pacman --color=always -Syyu'

# sys
alias Q='systemctl hibernate'
alias W='systemctl suspend'
alias Z='systemctl reboot'
alias ZZ='systemctl poweroff'
