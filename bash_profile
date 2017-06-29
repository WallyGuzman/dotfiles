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
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Set path
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Set default options
export EDITOR=/usr/bin/vim
export FIGNORE="~"
export TERM=xterm

# Bash options
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

# Aliases
# Move this into .bash_aliases
alias ...='cd ../../'
alias ..='cd ..'
alias bc='bc -l'
alias cp='cp -v'
alias grep='grep --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias ls='ls -FG'
alias l='ls'
alias mkdir='mkdir -pv'
alias mv='mv -v -i'
alias ping='ping -c 3'
# alias rm='rm -i' # Way too annoying
alias vi='vim'
alias ~='cd'
alias -- -='cd -'

# Tmux should use these instead of .bashrc
alias ta='tmux -2 a -t'
alias tls='tmux ls'
alias tnew='tmux -2 new -s'

# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

#   extract:  Extract most known archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
