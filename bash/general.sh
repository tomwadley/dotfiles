### General bash configuration

# Prompt
export PS1=' \[\e[1;30m\]\D{%H:%M:%S} \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
export PS2=' \[\e[1;32m\]>\[\e[m\] '

# Aliases
alias ls='ls -F --color=auto'
alias ll='ls -la'
alias grep='grep --color --exclude-dir=.git'

# Additional ls colors
eval $(dircolors -b)

# VI mode for readline
set -o vi

# Fix ctrl-arrow keys in vi mode
bind '"\e[1;5D": backward-word'
bind '"\e[1;5C": forward-word'

# Wrapper around find
function search {
  find . -iname "*$1*"
}

# History config
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# Put my scripts on the path
export PATH=~/bin:$PATH
