#!/bin/zsh

# PATH ----------------------------------------------------------------------- 

export LANG=ja_JP.UTF-8
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# Homebrew
fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)

# Theme -----------------------------------------------------------------------

autoload -U promptinit; promptinit
prompt pure

# Alias -----------------------------------------------------------------------

alias ls="ls -G"

# Tools -------------------------------------------------------------------

# コマンドのシンタックスハイライトを追加
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# コマンドのヒストリをゴースト表示
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Common tools

TOOLS=(
  "fzf"
  "tmux"
  # "nvm"
  "zoxide"
  "fuck"
)

for tool in "${TOOLS[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    source "$DOTFILES/zsh/config/$tool.sh"
  else
    echo "$tool が見つかりませんでした"
  fi
done
