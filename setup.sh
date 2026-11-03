#!/bin/sh

DOTFILES=${DOTFILES:-$HOME/.dotfiles}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# シンボリックリンクを作成する
# 既存のリンクは貼り直し、実ファイル・実ディレクトリがある場合はスキップする
link() {
  src=$1
  dst=$2
  parent=$(dirname "$dst")

  if [ ! -e "$src" ]; then
    echo "skip: $src が見つかりません"
    return
  fi

  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "skip: $dst は実ファイルまたは実ディレクトリです"
    return
  fi

  mkdir -p "$parent"
  ln -s "$src" "$dst"
  echo "link: $dst -> $src"
}

# .zshrc ----------------------------------------------------------------------

link "$DOTFILES"/zsh/.zshrc "$HOME"/.zshrc

# .config ---------------------------------------------------------------------

# zsh 以外のディレクトリをディレクトリごとリンク
for dir in "$DOTFILES"/*/; do
  config=$(basename "$dir")
  [ "$config" = zsh ] && continue
  link "$DOTFILES"/"$config" "$XDG_CONFIG_HOME"/"$config"
done

