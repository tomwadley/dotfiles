# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1=' \[\e[1;30m\]\D{%H:%M:%S} \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
export PS2=' \[\e[1;32m\]>\[\e[m\] '

# VI mode for readline
set -o vi

if [ "$(uname)" == "Darwin" ]; then

  # Enable colored output
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced

  # Ensure homebrew takes precendence
  export PATH=/usr/local/bin:$PATH

  # Enable bash completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # Switch java versions easily
  function setjdk() {  
    if [ $# -ne 0 ]; then  
     removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'  
     if [ -n "${JAVA_HOME+x}" ]; then  
      removeFromPath $JAVA_HOME  
     fi  
     export JAVA_HOME=`/usr/libexec/java_home -v $@`  
     export PATH=$JAVA_HOME/bin:$PATH  
    fi  
  }  
  function removeFromPath() {  
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")  
  }
  setjdk 1.8

  # Android tools
  export PATH=~/opt/android-sdk-macosx/platform-tools:$PATH

  # Ansible git
  #export PATH=~/opt/ansible/bin:$PATH

  # Typesafe Activator
  export PATH=~/opt/activator-1.2.10-minimal:$PATH

  # Ruby via chruby + ruby-install
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  #source /usr/local/share/chruby/auto.sh
  chruby ruby-1.9

  # Node.js via nvm
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh

  # AWS cli completion
  complete -C aws_completer aws

  # Aliases
  alias ls='ls -F'
  alias ll='ls -Fla'

fi

if [ "$(uname)" == "Linux" ]; then

  eval $(dircolors -b)

  # Aliases
  alias ls='ls -F --color=auto'
  alias ll='ls -la'
  alias grep='grep --color --exclude-dir=.git'
  alias diff='colordiff -u'
  alias e='emacsclient --alternate-editor="" -t'
  alias eg='emacsclient --alternate-editor="" -c -n'

  # Fix ctrl-arrow keys in vi mode
  bind '"\e[1;5D": backward-word'
  bind '"\e[1;5C": forward-word'

  # Ruby via chruby + ruby-install
  source /usr/share/chruby/chruby.sh
  #source /usr/share/chruby/auto.sh
  chruby ruby-2

  # Node.js via nvm
  source /usr/share/nvm/init-nvm.sh
  #nvm use 4.4.7 &> /dev/null

  # Dotnet
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

  # Vimpager
  #export PAGER='vimpager'
  #alias less=$PAGER

  # Less with color
  export LESS='-R'
  export LESSOPEN='|pygmentize -g %s'

  # Wrapper around find
  function search {
    find . -iname "*$1*"
  }

fi

# History config
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Put my scripts on the path
export PATH=~/bin:$PATH

# Golang workspace
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Pip and virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export VIRTUAL_ENV_DISABLE_PROMPT=1
alias activatevirtualenv='source ~/var/virtualenvs/python2/bin/activate'

# Perl (generated by cpan)
PATH="/home/tom/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/tom/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tom/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tom/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tom/perl5"; export PERL_MM_OPT;
