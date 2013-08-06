. ~/d/bash_private # source my private variables

# dupeless history
export HISTCONTROL="ignoredups"
export HISTSIZE=4000
export PATH=$PATH:/usr/sbin/:/usr/local/bin:/home/kv/.gem/ruby/1.9.1/bin
export EDITOR=vim
export PAGER=less
export FONT="-*-profont-*-*-*-*-8-*-*-*-*-*-*-*"

# org
alias df='df -h'
alias ls='ls --color=always'
alias grep='grep --color=always'
alias sudo='sudo '
alias vless='vim -u /usr/share/vim/vim7*/macros/less.vim'

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
alias va='vim ~/d/archsetup'

# pkg
alias R='sudo pacman -R'
alias S='sudo pacman -S --color=always --needed --noconfirm'
alias s='yaourt --noconfirm'
alias U='sudo pacman --color=always -Syyu'

# sys
alias Q='systemctl hibernate'
alias W='systemctl suspend'
alias Z='systemctl reboot'
alias ZZ='systemctl poweroff'

man() {                                                                                           
env LESS_TERMCAP_mb=$'\e[1;32m' \
LESS_TERMCAP_md=$'\e[1;34m' \
LESS_TERMCAP_me=$'\e[0m' \
LESS_TERMCAP_se=$'\e[0m' \
LESS_TERMCAP_so=$'\e[1;44;33m' \
LESS_TERMCAP_ue=$'\e[0m' \
LESS_TERMCAP_us=$'\e[4;31m' \
man "$@"                                                                                      
} 

freq(){                                                                
history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -20
}
