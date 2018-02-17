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


############################################
# Homebrew
#############################################
# Install neo vim via Homebrew
if brew ls --versions neovim > /dev/null; then
    echo "neovim already installed"
else
    brew install neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# Install emacs via Homebrew
if brew ls --versions emacs > /dev/null; then
    echo "emacs already installed"
else
    brew install emacs --with-cocoa
fi
# Install aspell
if brew ls --version aspell > /dev/null; then
    echo "aspell already installed"
else
   brew install aspell
fi


##########################################
# git clones
#########################################
if [ ! -d ~/Documents/github/git ];
then
    echo "Clone git repo"
    cd ~/Documents/github
    git clone git@github.com:git/git.git
    cd ~/Documents/github/dotfiles
fi

if [ ! -e ~/Documents/github/djinni-mode.el ];
then
    echo "Clone threeve repo"
    cd ~/Documents/github
    git clone https://github.com/threeve/djinni-mode.el.git
    cd ~/Documents/github/dotfiles
fi

###############################################
# Dotfiles
##############################################
# variables
olddir=~/dotfiles_old                   # old dotfiles backup directory
files="bashrc bash_profile vimrc vim gitconfig config emacs.d"      # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s "$(pwd)"/.$file ~/.$file
done
