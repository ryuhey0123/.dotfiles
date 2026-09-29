#!/bin/zsh

DOTFILES=$HOME/.dotfiles

# 環境変数を更新する
# case "${OSTYPE}" in
# darwin*) source "$DOTFILES"/env/env.osx ;;
# linux-gnu) source "$DOTFILES"/env/env.arch ;;
# linux-gnueabihf) source "$DOTFILES"/env/env.raspi ;;
# esac

# .zshrc ----------------------------------------------------------------------
ln -sniv "$DOTFILES"/zshrc "$HOME"/.zshrc

# .config ---------------------------------------------------------------------
configs=(
  "nvim"
  "tmux"
  "ghostty"
  "lazygit"
  "karabiner/assets"
)

for config in "${configs[@]}"; do
  ln -sniv "$DOTFILES"/config/"$config" "$XDG_CONFIG_HOME"/"$config"
done
