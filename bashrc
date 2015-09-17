# dupeless history
export HISTCONTROL="erasedups"
export HISTSIZE=2048
export PATH=$PATH:/usr/sbin/:/usr/local/bin:/home/kv/.gem/ruby/1.9.1/bin
export EDITOR=vis
export VISUAL=vis
export BROWSER=dwb
export PAGER=less
export FONT="-*-profont-*-*-*-*-10-*-*-*-*-*-*-*"

# org
alias df='df -h'
alias ls='ls -G' #was broken on OS X
alias grep='grep --color=auto' 
alias sudo='sudo '
alias vless='vim -u /usr/share/vim/vim7*/macros/less.vim'
alias xidel='./xidel --user-agent="Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0"'
alias curl='curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0"'
alias ejects='eject /dev/sr0; eject /dev/sr1'

# app
alias a='ranger'
alias A='sudo ranger'
alias m='mpv'
alias p='sxiv' #needs X
alias v='vis'
alias V='sudo vis'
alias x='mutt'
alias y='mpsyt /'
alias z='htop'
alias h='history | grep $@'
alias con='column -s , -t con.csv'
alias radio='mpv --no-cache --term-osd-bar=no http://radio.2f30.org:8000/live.ogg'
alias ccc='setxkbmap us -variant colemak; d/xsetroot-set.sh'
alias qqq='setxkbmap us -variant altgr-intl; d/xsetroot-set.sh'
alias res='xrandr --output VGA1 --mode 1680x1050'
alias redwm='cd ~/d/dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; cd'
alias scgt='~/d/killifrunning.sh rejoystick; rejoystick -d; cd .wine/drive_c/Program\ Files/SCGTmini/; wine Spcar.exe'
alias va='vim ~/d/archsetup'
alias en='./jjj.sh -en' #$@ | fmt -t -w $(($(tput cols)+0)) --goal=$(($(tput cols)+0)) | sed "s/   /  /g" | less -RFXE #very nice output for long articles
alias fr='./jjj.sh -fr' #$@ | fmt -t -w $(($(tput cols)+0)) --goal=$(($(tput cols)+0)) | sed "s/   /  /g" | less -RFXE
alias anti='~/d/killifrunning.sh antidote; sudo iptables -A OUTPUT -m owner --gid-owner ni -j DROP; cd .wine/drive_c/Program\ Files/Druide/Antidote\ 7/Programmes32/; sg ni "wine antido32.exe" & sleep 5; exit'

# pkg
alias R='sudo pacman -R'
alias S='sudo pacman -S --color=always --needed --noconfirm'
alias s='yaourt --noconfirm'
alias U='sudo reflector -l 8 -p http -f 5 --connection-timeout 3 --save /etc/pacman.d/mirrorlist; sudo pacman --color=always --noconfirm -Syyu'
alias u='yaourt --sucre --needed'

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
