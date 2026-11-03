#!/bin/zsh

# sh/bash で実行された場合は zsh で実行し直す
[ -z "$ZSH_VERSION" ] && exec zsh "$0" "$@"

DOTFILES=${DOTFILES:-$HOME/.dotfiles}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# シンボリックリンクを作成する
# 既存のリンクは貼り直し、実ファイル・実ディレクトリがある場合はスキップする
link() {
  local src=$1 dst=$2

  if [[ ! -e $src ]]; then
    echo "skip: $src が見つかりません"
    return
  fi

  # 親ディレクトリが dotfiles へのリンクなら外す（ディレクトリ単位 → ファイル単位への切り替え）
  local parent=${dst:h}
  if [[ -L $parent && $(readlink "$parent") == $DOTFILES/* ]]; then
    rm "$parent"
    echo "unlink: $parent"
  fi

  if [[ -L $dst ]]; then
    rm "$dst"
  elif [[ -e $dst ]]; then
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

# ディレクトリごとリンク
configs=(
  "nvim"
  "tmux"
  "ghostty"
  "lazygit"
  "karabiner"
  "herdr"
)

for config in "${configs[@]}"; do
  link "$DOTFILES"/"$config" "$XDG_CONFIG_HOME"/"$config"
done

# # ファイルだけリンク（アプリが実行時のファイルを作るもの）
# files=(
#   "herdr/config.toml"
# )
#
# for file in "${files[@]}"; do
#   link "$DOTFILES"/"$file" "$XDG_CONFIG_HOME"/"$file"
# done
