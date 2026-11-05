#!/bin/zsh

# PATH -----------------------------------------------------------------------

export LANG=ja_JP.UTF-8
export TERM=xterm-256color

# Theme -----------------------------------------------------------------------

# prompt
setopt PROMPT_SUBST
export PS1="
%F{red}%n@%m%f %F{magenta}%~%f
%F{cyan}%#%f "

# Alias -----------------------------------------------------------------------

alias ls="ls --color=auto"
alias bat='batcat'

# Tools -----------------------------------------------------------------------

TOOLS=(
  "fzf"
  "tmux"
  "zoxide"
)

for tool in "${TOOLS[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    source "$DOTFILES/zsh/config/$tool.sh"
  else
    echo "$tool が見つかりませんでした"
  fi
done
