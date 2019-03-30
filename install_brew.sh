#!/bin/sh

# Install Homebrew
if which brew > /dev/null 2>&1; then
    /usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"
fi

# Save Homebrew’s installed location.
BREW_PREFIX=`brew --prefix`

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Creanup Homebrew
brew cleanup

# Install zsh and chsh
brew install zsh
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# mas-cli - A simple command line interface for the Mac App Store.
brew install mas
brew install reattach-to-user-namespace # depending

# Neovim - Refactor Vim.
brew install neovim

# tmux - a terminal multiplexer
brew install tmux

