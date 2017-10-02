# dotfiles

### init

```sh
git clone git@github.com:agudulin/dotfiles.git
mv dotfiles/* ~
```

### osx tweaks
```sh
# fast key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false && \
defaults write NSGlobalDomain KeyRepeat -int 1 && \
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```

### nvim setup
```sh
brew install neovim/neovim/neovim

mkdir ~/.vim
mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
```

### software
```sh
brew install zsh
# go to https://github.com/robbyrussell/oh-my-zsh#basic-installation to install oh-my-zsh

brew install tmux
brew install ack
brew install fzf
brew install yarn
brew install python
pip install neovim
```

### other

- [sizeup](http://www.irradiatedsoftware.com/sizeup/)
