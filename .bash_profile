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

