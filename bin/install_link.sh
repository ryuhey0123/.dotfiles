#!/ bin/zsh

# zsh/zpulg
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
if [ -e ~/.zplug ]; then
    echo "Already installed zplug."
else
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Alacritty
# rm -rf ~/.config/alacritty
# ln -sf ~/.dotfiles/.config/alacritty/ ~/.config/alacritty

# tmux
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

# vim/neovim
rm -rf ~/.config/nvim
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.config/nvim/ ~/.config/nvim

# gvim
# ln -sf ~/.dotfiles/.gvimrc ~/.gvimrc

# LaTeX
# ln -sf ~/.dotfiles/.latexmkrc ~/.latexmkrc

# ideavim
# ln -sf ~/.dotfiles/.ideavimrc ~/.ideavimrc

# git
ln -sf ~/.dotfiles/.gitignore_global ~/.gitignore_global

