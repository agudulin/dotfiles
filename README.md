# dotfiles

### init
```sh
git clone git@github.com:agudulin/dotfiles.git
mv dotfiles/* ~
git config --global core.excludesfile ~/.gitignore-global
```

### required
```sh
xcode-select --install
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

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
```

### software
```sh
brew install zsh
# go to https://github.com/robbyrussell/oh-my-zsh#basic-installation to install oh-my-zsh

# shell colorscheme
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

brew install tmux
brew install reattach-to-user-namespace
brew install ack
brew install fzf
brew install yarn
brew install python
pip install neovim
```

### other

- [sizeup](http://www.irradiatedsoftware.com/sizeup/)
