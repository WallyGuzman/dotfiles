# My bash_profile file
#
# Maintainer:	Wally Guzman
# Last change:	Thu Jun 23 18:47:43 CDT 2016
#
# To use it, copy it to
#     for Unix and OS/2:  ~/.vimrc
#	      for Amiga:  s:.vimrc
#  for MS-DOS and Win32:  $VIM\_vimrc
#	    for OpenVMS:  sys$login:.vimrc

# Capture last return value
function nonzero_return() {
    RETVAL=$?
    echo "$RETVAL"
}

# Customize prompt
export PS1="\`nonzero_return\` \u@\h: \W\\$ "

# Set Java Home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Fix path stuff
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export EDITOR=/usr/bin/vim
export FIGNORE="~"
export TERM=xterm

# Set options
shopt -s extglob
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s nocaseglob

# Aliases
alias gallardo='ssh gguzman@gallardo.cs.utexas.edu'
alias mario='ssh gguzman@mario.ece.utexas.edu'

alias ..='cd ..'
alias ~='cd'
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'

