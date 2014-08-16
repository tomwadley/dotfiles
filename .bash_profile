# Prompt from Arch wiki
export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# Enable colored output
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Ensure homebrew takes precendence
export PATH=/usr/local/bin:$PATH

# Use ruby from rbenv
eval "$(rbenv init -)"

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

# Aliases
alias ls='ls -F'
alias ll='ls -Fla'

# Android tools
export PATH=~/opt/android-sdk-macosx/platform-tools:$PATH

# Ansible git
#export PATH=~/opt/ansible/bin:$PATH

