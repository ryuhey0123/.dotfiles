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

echo "dotfiles update --------------------------------------------------------"
cd $HOME/.dotfiles
git pull origin master
echo

echo "Application install ----------------------------------------------------"
sh $HOME/.dotfiles/install_brew.sh
echo "Finish"

echo "alias settiong ---------------------------------------------------------"
sh $HOME/.dotfiles/install_alias.sh
echo "Finish"

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

