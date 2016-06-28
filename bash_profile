# My bash_profile file
#
# Maintainer:	Wally Guzman
# Last change:	Thu Jun 23 18:47:43 CDT 2016

# Customize prompt
export PS1="\$? \u@\h: \W\\$ "

# Add completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Set Java Home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Set history options
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE

# Set path
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH

# Set default options
export EDITOR=/usr/bin/vim
export FIGNORE="~"
export TERM=xterm

# Set options
shopt -s autocd
shopt -s dirspell
shopt -s globstar
shopt -s extglob
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s nocaseglob
shopt -s histappend

# SSH aliases
alias gallardo='ssh gguzman@gallardo.cs.utexas.edu'
alias mario='ssh gguzman@mario.ece.utexas.edu'

# Aliases
alias ..='cd ..'
alias ~='cd'
alias ll='ls -l'
alias la='ls -a'
