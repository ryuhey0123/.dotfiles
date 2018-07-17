#!/bin/sh

# zsh
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# vim/neovim
ln -sf ~/.dotfiles/.vim ~/.vim
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
rm -rf ~/.dotfiles/.config/nvim/nvim

# LaTeX
ln -sf ~/.dotfiles/.latexmkrc ~/.latexmkrc

# i3
ln -sf ~/.dotfiles/.config/i3 ~/.config/i3
rm -rf ~/.dotfiles/.config/i3/i3

ln -sf ~/.dotfiles/.Xresources ~/.Xresources
ln -sf ~/.dotfiles/.xprofile ~/.xprofile

# ranger
ln -sf ~/.dotfiles/.config/ranger ~/.config/ranger
rm -rf ~/.dotfiles/.config/ranger/ranger

