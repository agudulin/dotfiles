LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

export ZSH=$HOME/.oh-my-zsh

# look in ~/.oh-my-zsh/themes/
ZSH_THEME="refined"

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# plugins (can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git osx npm github)

# configure path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$(brew --prefix ruby)/bin:$PATH
export PATH=$(brew --prefix npm)/libexec/npm/bin:$PATH
export PATH=$(yarn global bin):$PATH
export PATH=$HOME/.cargo/bin:$PATH

export EDITOR="nvim"
export GPG_TTY=$(tty)

# personal aliases
alias :q=exit
alias ls=exa
alias la="exa -la"
alias c="clear"

eval "$(rbenv init -)"

# load scripts
[ -f ~/.avn/bin/avn.sh ] && source ~/.avn/bin/avn.sh
[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh

