#!/bin/sh

# zsh
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# tmux
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

# vim/neovim
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
rm -rf ~/.dotfiles/.config/nvim/nvim

# LaTeX
ln -sf ~/.dotfiles/.latexmkrc ~/.latexmkrc


if ["$(uname)" == 'Darwin']; then
    echo "Finish"
    exit 1

elif ["$(uname)" == 'Linux']; then
    echo "Setup i3-wm and ranger config file."
    # i3
    ln -sf ~/.dotfiles/.config/i3 ~/.config/i3
    rm -rf ~/.dotfiles/.config/i3/i3

    ln -sf ~/.dotfiles/.Xresources ~/.Xresources
    ln -sf ~/.dotfiles/.xprofile ~/.xprofile

    # ranger
    ln -sf ~/.dotfiles/.config/ranger ~/.config/ranger
    rm -rf ~/.dotfiles/.config/ranger/ranger
    exit 1

else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1

fi

