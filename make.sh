#!/bin/bash
############################
# .make.sh:w
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

# Install Homebrew https://brew.sh
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# Install emacs via Homebrew
if brew ls --versions emacs > /dev/null; then
    echo "emacs already installed"
else
    brew install emacs --with-cocoa
fi


# variables
dir=~/.dotfiles                         # dotfiles directory
olddir=~/dotfiles_old                   # old dotfiles backup directory
files="bash_profile vimrc vim gitconfig config emacs.d/init.el"      # list of files/folders to symlink in homedir

# move dotfiles to .dotfiles hidden folder
cp ~/dotfiles $dir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

ln -s $dir/syspython2/ ~/syspython2
