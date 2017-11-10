########################################################################################
# .bash_profile
#
# Author(s):
#	Riley Crebs
#
# Description:
#	When opening a terminal window this ".bash_profile" gets called to set up a
#	terminal BASH shell configuration.
# Notes:
#
########################################################################################

# Having some fun with Mac OS X voices
#say -v Trinoids "Terminal!"

########################################################################################
# Environtment Variables
#
#	PATH - Specifies a set of directories where executable programs are located.
#	HOME - Specifies the home directory.
#	MAKEFILES - Specifies the directory where a makefile is located
#	CLICOLOR -
#	LSCOLORS -
#	HISTCONTROL -
#	HISTIGNORE -
#	EDITOR -
########################################################################################
export PATH=${PATH}:${HOME}/bin:/usr/local/bin:~/bin:~/bin/git:~/Library/Android/sdk/platform-tools
export MAKEFILES=${HOME}/bin/makefile
export CLICOLOR=1
export LSCOLORS=fxdxcxgxBxHxexbDfDehbh
export HISTCONTROL="erasedups"
export HISTIGNORE="ls:ll:la:lab"
export JENKINS_DIR=${HOME}/bin/jinkens
export EDITOR=nvim
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Setup a red prompt for root and a green one for users.
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
BROWN="\[\e[1;33m\]"
CYAN="\[\e[1;36m\]"

# Make bash check its window size after a process completes
shopt -s checkwinsize

# This is for git auto complete stuff.
source ~/Documents/github/git/contrib/completion/git-completion.bash

# Git extensions
source ~/Documents/github/git/contrib/completion/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "$GREEN\u:$CYAN[\w]" $BROWN"\\\$ $NORMAL"'
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"

# Command aliases
alias ?='pwd'
alias hm='cd ~'
alias bk='cd ..'
alias rm='rm -i'
alias ls='ls -F'
alias ll='ls -lF'
alias la='ls -alF'
alias gsubmodule='git submodule update --init --recursive'
alias s='say -v Daniel'
alias vim=nvim
alias emx=emacs

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# point to postgresql
export PATH=/usr/local/Cellar/postgresql/9.4.0/bin:$PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Function to run git operations
git-checkout() {
	git checkout $1
	gs 'git checkout '$1' || :'
}

git-checkout-force() {
	git checkout -f $1
	gs 'git checkout -f '$1' || :'
}

git-pull() {
	git pull $1 $2
	gs 'git pull '$1' '$2' || :'
}

git-pull-rebase () {
	git pull --rebase $1 $2
	# gs 'git pull --rebase '$1' '$2' || :'
}

git-fetch() {
	git fetch $1
	gs 'git fetch '$1' || :'
}

git-reset-hard () {
	git reset --hard $1/$2
	gs 'git reset --hard '$1'/'$2' || :'
}

git-merge () {
	git merge $1
	gs 'git merge '$1' || :'
}

git-push-submodules () {
	git push $1 $2
	gs 'git push '$1' '$2' || :'
}

git-branch () {
	git checkout -b $1
	gs 'git checkout -b '$1' || :'
}

git-delete-branch () {
	git branch -D $1
	gs 'git branch -D '$1' || :'
}

git-delete-remote-branch() {
	git push $1  --delete $2
	gs 'git push '$1' --delete '$2' || :'
}

git-stash () {
	git stash
	gs 'git stash || :'
}

git-sync () {
	git submodule sync --recursive
}
