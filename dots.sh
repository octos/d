#!/bin/bash
# .make.sh
# creates symlinks from ~ to dotfiles in ~/d

dir=~/d                    # dotfiles dir
olddir=~/d_old             # old dotfiles backup dir
files="bashrc bash_profile Xdefaults xinitrc mplayer themes"    # list of files/folders to symlink in homedir

echo "mkdir: $olddir (for backup of existing dotfiles in ~)"
mkdir -p $olddir
echo "..done"

echo "cd: $dir" 
cd $dir
echo "..done"

# move old dots from ~ to $olddir, 
# then create symlinks from the ~ to all $files in $dir
for file in $files; do
    echo "mv: existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/d_old/
    echo "ln -s: creating symlink to $file in ~."
    ln -s $dir/$file ~/.$file
done
