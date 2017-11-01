#!/bin/bash
############################
# .make.sh:w
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

# Install Homebrew https://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install emacs via Homebrew
brew install emacs --with-cocoa

# variables
dir=~/.dotfiles                         # dotfiles directory
olddir=~/dotfiles_old                   # old dotfiles backup directory
files="bash_profile vimrc vim gitconfig config emacs.d"      # list of files/folders to symlink in homedir

# move dotfiles to .dotfiles hidden folder
mv ~/dotfiles $dir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

ln -s $dir/syspython2/ ~/syspython2
