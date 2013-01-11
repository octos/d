#!/bin/bash
# .make.sh
# Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/dots                    # dotfiles directory
olddir=~/dots_old             # old dotfiles backup directory
files=".bashrc .Xdefaults .xinitrc"    # list of files/folders to symlink in homedir

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
    mv ~/$file ~/dots_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
