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


printf "\033[1;33m \
dotfiles update ------------------------------------------------------ \033[0;39m \n"

cd $HOME/.dotfiles
git pull origin master
printf "\033[1;37m Done \033[0;39m \n\n"


printf "\033[1;33m \
Alias settiong ------------------------------------------------------- \033[0;39m \n"

# sh $HOME/.dotfiles/etc/install_link.sh
printf "\033[1;37m Done \033[0;39m \n\n"


printf "\033[1;33m \
OS settiong ---------------------------------------------------------- \033[0;39m \n"

case "${OSTYPE}" in
    darwin)
        printf "Your platform is Darwin.\n"
        sh $DOTFILES/bin/install_osx.sh ;;
    linux-gnu)
        printf "Your platform is Linux(Arch)\n"
        sh $DOTFILES/bin/install_arch.sh ;;
    linux-gnueabihf)
        printf "Your platform is Linux(RaspberryPi)\n"
        sh $DOTFILES/bin/install_raspi.sh ;;
    *)
        printf "Your platform ($(uname -a)) is not supported.\n"
esac

printf "\033[1;37m Done \033[0;39m \n\n"


printf "\033[1;36m ALL DONE! \033[0:39m\n\n"

exit 1

