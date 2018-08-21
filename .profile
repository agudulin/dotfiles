LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=/usr/local/opt/ruby/bin:$PATH
PATH=/usr/local/opt/node/libexec/npm/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH

EDITOR="vim"

PS1='\[\e[1m\]$(pwd)$\[\e[0m\] '

export PATH LC_ALL EDITOR PS1

eval "$(rbenv init -)"

# load scripts
[ -f ~/.avn/bin/avn.sh ] && source ~/.avn/bin/avn.sh
[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# personal aliases
alias :q=exit
alias :qa=exit
alias ls=exa
alias la="exa -la"
alias c="clear"

alias gst="git status"
alias gco="git checkout"
alias glog="git log"

alias ..="cd .."
alias ...="cd ../.."
