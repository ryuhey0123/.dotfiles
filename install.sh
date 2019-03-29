#!/bin/sh
cat << 'EOS'

           /$$             /$$      /$$$$$$  /$$ /$$                    
          | $$            | $$     /$$__  $$|__/| $$                    
      /$$$$$$$  /$$$$$$  /$$$$$$  | $$  \__/ /$$| $$  /$$$$$$   /$$$$$$$
     /$$__  $$ /$$__  $$|_  $$_/  | $$$$    | $$| $$ /$$__  $$ /$$_____/
    | $$  | $$| $$  \ $$  | $$    | $$_/    | $$| $$| $$$$$$$$|  $$$$$$ 
    | $$  | $$| $$  | $$  | $$ /$$| $$      | $$| $$| $$_____/ \____  $$
 /$$|  $$$$$$$|  $$$$$$/  |  $$$$/| $$      | $$| $$|  $$$$$$$ /$$$$$$$/
|__/ \_______/ \______/    \___/  |__/      |__/|__/ \_______/|_______/ 
                                                                        
Welcome.
This is Ryuhey's dotfiles.

EOS

# zsh/zpulg
read -n1 -p "Add .zshrc? (y/N): " yn
if [[ $yn = [yY] ]]; then
    ln -sf ~/.dotfiles/.zshrc ~/.zshrc
    echo
    if [ -e ~/.zplug ]; then
        echo "Already installed zplug."
    else
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi
fi
echo

# Alacritty
read -n1 -p "Add .config.alacritty? (y/N): " yn
if [[ $yn = [yY] ]]; then
    rm -rf ~/.config/alacritty
    ln -sf ~/.dotfiles/.config/alacritty/ ~/.config/alacritty
fi
echo

# tmux
read -n1 -p "Add .tmux.conf? (y/N): " yn
if [[ $yn = [yY] ]]; then
    ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
fi
echo

# vim/neovim
read -n1 -p "Add .vimrc and .config/nvim? (y/N): " yn
if [[ $yn = [yY] ]]; then
    ln -sf ~/.dotfiles/.vimrc ~/.vimrc
    ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
    rm -rf ~/.dotfiles/.config/nvim/nvim
fi
echo

# gvim
read -n1 -p "Add .gvimrc? (y/N): " yn
if [[ $yn = [yY] ]]; then
    ln -sf ~/.dotfiles/.gvimrc ~/.gvimrc
fi
echo

# LaTeX
read -n1 -p "Add .latexmkrc? (y/N): " yn
if [[ $yn = [yY] ]]; then
    ln -sf ~/.dotfiles/.latexmkrc ~/.latexmkrc
fi
echo

# ideavim
read -n1 -p "Add .ideavimrc? (y/N): " yn
if [[ $yn = [yY] ]]; then
    ln -sf ~/.dotfiles/.ideavimrc ~/.ideavimrc
fi
echo

# OS settings
if [[ "$(uname)" == 'Darwin' ]]; then
    echo "Your platform is Darwin. Finish."
    exit 1

elif ["$(uname)" == 'Linux']; then
    echo "Your platform is Linux"
    echo "Setup i3-wm and ranger config file."
    # i3
    read -n1 -p "Add .config/i3? (y/N): " yn
    if [[ $yn = [yY] ]]; then
        ln -sf ~/.dotfiles/.config/i3 ~/.config/i3
        rm -rf ~/.dotfiles/.config/i3/i3
    fi
    echo

    # .Xresources
    read -n1 -p "Add .Xresources? (y/N): " yn
    if [[ $yn = [yY] ]]; then
        ln -sf ~/.dotfiles/.Xresources ~/.Xresources
    fi
    echo

    # .xprofile
    read -n1 -p "Add .xprofile? (y/N): " yn
    if [[ $yn = [yY] ]]; then
        ln -sf ~/.dotfiles/.xprofile ~/.xprofile
    fi
    echo
    
    # ranger
    read -n1 -p "Add .config/ranger? (y/N): " yn
    if [[ $yn = [yY] ]]; then
        ln -sf ~/.dotfiles/.config/ranger ~/.config/ranger
        rm -rf ~/.dotfiles/.config/ranger/ranger
    fi
    echo
    
    exit 1

else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1

fi

