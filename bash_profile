[[ -f ~/.bashrc ]] && . ~/.bashrc

# starts X at login
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx #verbose
 [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null #quiet
