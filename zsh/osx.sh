#!/bin/zsh

# PATH ----------------------------------------------------------------------- 

export PATH="$PATH:$HOME/.local/bin"
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Theme -----------------------------------------------------------------------

autoload -U promptinit; promptinit
prompt pure

# Tools -------------------------------------------------------------------

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Common tools

TOOLS=(
  "fzf"
  "tmux"
  # "nvm"
)

for tool in "${TOOLS[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    source "$DOTFILES/zsh/$tool.sh"
  else
    echo "$tool が見つかりませんでした"
  fi
done
