LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=/usr/local/opt/ruby/bin:$PATH
PATH=/usr/local/opt/node@18/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH

EDITOR="nvim"

PS1='\[\e[1m\]$(pwd)$\[\e[0m\] '

export PATH LC_ALL EDITOR PS1
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
export BASH_SILENCE_DEPRECATION_WARNING=1
export NVM_DIR="$HOME/.nvm"

# load scripts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "$HOME/.cargo/env"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(pyenv init -)"

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
alias now="yt-dlp -f 'ba' -x --audio-format mp3"
alias vim=nvim
alias mvim=/Applications/MacVim.app/Contents/bin/mvim
