#!/bin/zsh

TOOLS=(
  "fzf"
  "tmux"
  # "nvm"
)

# PATH ----------------------------------------------------------------------- 

export PATH="$PATH:$HOME/.local/bin"
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Theme -----------------------------------------------------------------------

autoload -U promptinit; promptinit
prompt pure

# Toolの読み込み --------------------------------------------------------------

for tool in "${TOOLS[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    source "$DOTFILES/zsh/$tool.sh"
  else
    echo "$tool が見つかりませんでした"
  fi
done
