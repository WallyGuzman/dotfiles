# My bash_profile file
#
# Maintainer:	Wally Guzman
# Last change:	Thu Sep  8 23:28:26 CDT 2016

# Customize prompt
export PS1="\$? \u@\h: \W\\$ "

# Add completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Set Java Home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Set history options
export HISTCONTROL=ignoreboth:erasedups
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
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dirspell
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s histappend
shopt -s nocaseglob

# SSH aliases
alias gallardo='ssh gguzman@gallardo.cs.utexas.edu'
alias mario='ssh gguzman@mario.ece.utexas.edu'

# Aliases
alias ..='cd ..'
alias ...='cd ../../'
alias ~='cd'
alias ls='ls -G'
alias ll='ls -la'
alias la='ls -a'
alias grep='grep --color=auto'
alias bc='bc -l'
alias mkdir='mkdir -pv'
alias vi='vim'
alias ping='ping -c 3'
alias rm='rm -i'

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# added by Anaconda2 4.1.1 installer
export PATH="/Users/wallyguzman/anaconda2/bin:$PATH"
