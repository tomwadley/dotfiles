# Prompt from Arch wiki
export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# VI mode for readline
set -o vi

# Enable colored output
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Ensure homebrew takes precendence
export PATH=/usr/local/bin:$PATH

# Enable bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Prpend command with space to not log in history
HISTCONTROL=ignorespace

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

# Aliases
alias ls='ls -F'
alias ll='ls -Fla'

# Put my scripts on the path
export PATH=~/bin:$PATH

# Android tools
export PATH=~/opt/android-sdk-macosx/platform-tools:$PATH

# Ansible git
#export PATH=~/opt/ansible/bin:$PATH

# Typesafe Activator
export PATH=~/opt/activator-1.2.10-minimal:$PATH

# Golang workspace
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Pip and virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export VIRTUAL_ENV_DISABLE_PROMPT=1
source ~/var/virtualenvs/default/bin/activate

# Ruby via chruby + ruby-install
source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/share/chruby/auto.sh
chruby ruby-1.9

# Node.js via nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# AWS cli completion
complete -C aws_completer aws
