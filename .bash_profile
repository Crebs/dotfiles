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

# Load the .bashrc 
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

# point to postgresql
export PATH=/usr/local/Cellar/postgresql/9.4.0/bin:$PATH


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
