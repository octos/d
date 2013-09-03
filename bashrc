. ~/d/bash_private # source my private variables

#set -o vi #not yet
# dupeless history
export HISTCONTROL="ignoredups"
export HISTSIZE=4000
export PATH=$PATH:/usr/sbin/:/usr/local/bin:/home/kv/.gem/ruby/1.9.1/bin
export EDITOR=vim
export BROWSER=dwb
export PAGER=less
export FONT="-*-profont-*-*-*-*-10-*-*-*-*-*-*-*"

# org
alias df='df -h'
alias ls='ls --color=always'
alias grep='grep --color=auto' #'always' broke some scripts
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
alias scgt='~/d/killifrunning.sh rejoystick; rejoystick -d; cd .wine/drive_c/Program\ Files/SCGTmini/; wine Spcar.exe'
alias va='vim ~/d/archsetup'

# pkg
alias R='sudo pacman -R'
alias S='sudo pacman -S --color=always --needed --noconfirm'
alias s='yaourt --noconfirm'
alias U='sudo pacman --color=always -Syyu'
#alias UU='sudo reflector --verbose -l 12 -p http --sort rate  --save /etc/pacman.d/mirrorlist; U'
alias UU='sudo reflector --verbose -l 8 -p http -f 5 --connection-timeout 3 --save /etc/pacman.d/mirrorlist; U'

# sys
alias Q='sed -i '/Q/d' .bash_history; systemctl hibernate'
alias W='sed -i '/W/d' .bash_history; systemctl suspend'
alias Z='sed -i '/Z/d' .bash_history; systemctl reboot'
alias ZZ='systemctl poweroff; sed -i '/ZZ/d' .bash_history'

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
drop(){
echo 3 | sudo tee /proc/sys/vm/drop_caches
}
mem(){
sudo python2 ~/d/ps_mem.py
}
g(){
#python2 /usr/share/groove-dl/groove.py "$@"
python2 ~/d/groove.py "$@"
}
#https://bbs.archlinux.org/viewtopic.php?pid=927323#p927323
shellram(){
local shell=$1;
ps -C $shell -o rss= -o vsize= -o cmd= | awk '{rss+=$1;virt+=$2}END {
  print "COUNT: " NR;
  print "RESIDENT: " int(rss/1024) " MB";
  print "VIRTUAL: " int(virt/1024) " MB"}'
}
