
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

export PATH=${PATH}:${HOME}/bin:/usr/local/bin:~/bin:~/bin/git:~/Library/Android/sdk/platform-tools
export MAKEFILES=${HOME}/bin/makefile
export CLICOLOR=1
export LSCOLORS=fxdxcxgxBxHxexbDfDehbh
export HISTCONTROL="erasedups"
export HISTIGNORE="ls:ll:la:lab"
export JENKINS_DIR=${HOME}/bin/jinkens
export EDITOR=nvim
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export ANDROID_HOME=${HOME}/Library/Android/sdk
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

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
