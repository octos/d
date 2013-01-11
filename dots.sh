#!/bin/bash
# .make.sh
# creates symlinks from ~ to dotfiles in ~/d

dir=~/d                    # dotfiles dir
olddir=~/d_old             # old dotfiles backup dir
files=".bashrc .bash_profile .Xdefaults .xinitrc .mplayer"    # list of files/folders to symlink in homedir

# create dots_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dots directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dots in homedir to dots_old directory, then create symlinks from the homedir to any files in the ~/dots directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/d_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
