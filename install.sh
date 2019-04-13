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

echo "\033[1;33m \
dotfiles update ------------------------------------------------------ \033[0;39m"

cd $HOME/.dotfiles
git pull origin master
echo "\033[1;37m Done \033[0;39m \n"

echo "\033[1;33m \
brew application install / update ------------------------------------ \033[0;39m"

sh $HOME/.dotfile/etc/install_brew.sh
echo "\033[1;37m Done \033[0;39m \n"

echo "\033[1;33m \
alias settiong ------------------------------------------------------- \033[0;39m"

sh $HOME/.dotfiles/etc/install_link.sh
echo "\033[1;37m Done \033[0;39m \n"

echo "\033[1;33m \
OS settiong ---------------------------------------------------------- \033[0;39m"

if [[ "$(uname)" == 'Darwin' ]]; then
    echo "Your platform is Darwin. Finish."

elif ["$(uname)" == 'Linux']; then
    echo "Your platform is Linux"
    # i3
    echo "Setup i3-wm config file."
    rm -rf ~/.config/i3
    ln -sf ~/.dotfiles/.config/i3 ~/.config/i3
    # .Xresources
    echo "Setup Xresources/xprofile config file."
    ln -sf ~/.dotfiles/.Xresources ~/.Xresources
    ln -sf ~/.dotfiles/.xprofile ~/.xprofile
    # ranger
    echo "Setup ranger config file."
    rm -rf ~/.config/ranger
    ln -sf ~/.dotfiles/.config/ranger ~/.config/ranger

else
    echo "Your platform ($(uname -a)) is not supported."

fi

echo "\033[1;36m ALL DONE! \033[0:39m"

source ~/.zshrc

exit 1

