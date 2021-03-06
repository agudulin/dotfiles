LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=/usr/local/opt/ruby/bin:$PATH
PATH=/usr/local/opt/node/libexec/npm/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH

EDITOR="vim"

PS1='\[\e[1m\]$(pwd)$\[\e[0m\] '

export PATH LC_ALL EDITOR PS1
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
export BASH_SILENCE_DEPRECATION_WARNING=1

# load scripts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# personal aliases
alias :q=exit
alias ls=exa
alias la="exa -la"
alias c="clear"

alias gst="git status"
alias gco="git checkout"
alias glog="git log"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"
