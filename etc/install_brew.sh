#!/bin/sh

# Install Homebrew
echo "\033[1;36m Homebrew install... \033[0;39m"
if !(type "brew" > /dev/null 2>&1); then
    /usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"
fi

# Save Homebrew’s installed location.
BREW_PREFIX=`brew --prefix`

# Make sure we’re using the latest Homebrew.
echo "\033[1;36m Running 'brew update'... \033[0;39m"
brew update

# Upgrade any already-installed formulae.
echo "\033[1;36m Running 'brew upgrade'... \033[0;39m"
brew upgrade

# Creanup Homebrew
echo "\033[1;36m Running 'brew cleanup'... \033[0;39m"
brew cleanup

# cask install
echo "\033[1;36m cask command install... \033[0;39m"
if !(type "brew cask" > /dev/null 2>&1); then
    brew install caskroom/cask/brew-cask
fi

# application install
echo "\033[1;36m Running 'brew install' command... \033[0;39m"

# Install zsh and chsh
brew install zsh

# mas-cli - A simple command line interface for the Mac App Store.
# brew install mas
# brew install reattach-to-user-namespace # depending

# Neovim - Refactor Vim.
brew install neovim

# tmux - a terminal multiplexer
brew install tmux

# fzf - A command-line fuzzy finder
brew install fzf

# ag - A code-searching tool similar to ack, but faster.
brew install ag

# tree
brew install tree

# ghostscript - An interpreter for the PostScript language and for PDF.
brew install ghostscript

# z - jump around
# brew install z # -> zplug

# cask application install
echo "\033[1;36m Running 'brew cask install' command... \033[0;39m"

# alacritty
# brew cask install alacritty

# iTerm
brew cask install iTerm2

