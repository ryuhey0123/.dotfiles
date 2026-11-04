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

# LS COLORS
export LS_COLORS='di=01;36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

#  No      Type
#  ---------------------------
#  1,2     Directory
#  3,4     Symlink
#  5,6     Socket
#  7,8     Pipe
#  9,10    Executable
#  11,12   Block
#  13,14   Character
#  15,16   Exec. w/ SUID
#  17,18   Exec. w/ SGID
#  19,20   Dir, o+w, sticky
#  21,22   Dir, o+w, unsticky
#  ----------COLORS-----------
#  a  black
#  b  red
#  c  green
#  d  brown
#  e  blue
#  f  magenta
#  g  cyan
#  h  light grey
#  A  bold black, usually shows up as dark grey
#  B  bold red
#  C  bold green
#  D  bold brown, usually shows up as yellow
#  E  bold blue
#  F  bold magenta
#  G  bold cyan
#  H  bold light grey; looks like bright white
#  x  default foreground or background

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
