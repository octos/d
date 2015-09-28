#!/bin/sh
ver=150928 # creates symlinks from ~ to dotfiles in ~/d

dir=~/c/d                    # dotfiles dir.
olddir=~/c/d_old             # old dotfiles backup dir
files="bashrc bash_profile iocanerc mailcap muttrc muttrc_aliases sxiv tmux.conf Xdefaults xinitrc vimrc
config mpv themes vim"    # list of files/folders to symlink in homedir

if [[ $1 == "-i" ]]; then cd $dir/app
    for f in `ls *.sh`; do echo "$f # `sed -n '2p' $f`"; done | column -t -s '#'; exit
fi

killall -q chromium #because it makes .config/ busy
echo "mkdir: $olddir (old dotfiles will go there)"; mkdir -p $olddir
echo "   cd: $dir"; cd $dir

# move old dots from ~ to $olddir, 
# then create symlinks from ~ to all $files in $dir
    echo "   mv: old dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file $olddir
    echo "ln -s: symlinking $dir/$file"
    ln -s $dir/$file ~/.$file
done
    echo "Done. dotfile info: $0 -i"; echo
