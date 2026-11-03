#!/bin/zsh

# PATH ----------------------------------------------------------------------- 

export PATH="$PATH:$HOME/.local/bin"
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# Theme -----------------------------------------------------------------------

autoload -U promptinit; promptinit
prompt pure


# Homebrew completion ---------------------------------------------------------

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# Tools -------------------------------------------------------------------

# コマンドのシンタックスハイライトを追加
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# コマンドのヒストリをゴースト表示
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Common tools

TOOLS=(
  "fzf"
  # "tmux"
  # "nvm"
  "zoxide"
  "fuck"
)

for tool in "${TOOLS[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    source "$DOTFILES/zsh/$tool.sh"
  else
    echo "$tool が見つかりませんでした"
  fi
done
