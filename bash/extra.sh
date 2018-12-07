### Bash configuration for specific applications

# Ad-hoc editing
export EDITOR=vim

# Colored diff
alias diff='colordiff -u'

# Emacs
alias e='TERM=xterm-256color emacsclient -t'
alias eg='emacsclient -c -n'

# Node.js via nvm
source /usr/share/nvm/init-nvm.sh
#nvm use 4.4.7 &> /dev/null

# Ruby via chruby + ruby-install
source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh
