# dotfiles

### osx tweaks
```sh
# fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 0
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
```

### other

- [sizeup](http://www.irradiatedsoftware.com/sizeup/)
