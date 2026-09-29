#        ______     _____   __    __   ______       ____  
#       (____  )   / ____\ (  \  /  ) (   __ \     / ___) 
#           / /   ( (___    \ (__) /   ) (__) )   / /     
#       ___/ /_    \___ \    ) __ (   (    __/   ( (      
#      /__  ___)       ) )  ( (  ) )   ) \ \  _  ( (      
#  __    / /____   ___/ /    ) )( (   ( ( \ \_))  \ \___  
# (__)  (_______) /____/    /_/  \_\   )_) \__/    \____) 
#                                                         

# Environment -----------------------------------------------------------------

export LANG=ja_JP.UTF-8

export EDITOR="nvim"
export VIM_OSTYPE=$OSTYPE

export DOTFILES=$HOME/.dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For GNU
export LS_COLORS='di=01;36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# For macOS
export LSCOLORS=Gxfxcxdxbxegedabagacad

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

# Options ---------------------------------------------------------------------

setopt no_beep                  # beep を無効にする
setopt ignore_eof               # ファイル末尾で勝手に閉じない
setopt extended_glob            # globを使用
setopt numeric_glob_sort        # リストの数値は数値でソート
setopt auto_remove_slash        # 不要な「/」を削除

# Complement ------------------------------------------------------------------

autoload -Uz compinit
compinit

setopt correct_all              # Spell check
setopt list_types               # 補完候補一覧でファイルの種別を識別マーク表示
setopt auto_list                # 補完候補が複数ある時に、一覧表示
setopt auto_menu                # 補完キーで順に補完を表示
setopt auto_cd                  # cdコマンドの補完
setopt auto_param_keys          # カッコの対応などを自動的に補完

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# menu select（メニュー選択モード）を有効にする
zstyle ':completion:*:default' menu select
# 補完メニューに詳細な説明を表示する
zstyle ':completion:*' verbose yes
# 色付きの補完
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# History ---------------------------------------------------------------------

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history            # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_dups         # 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_all_dups     # 重複するコマンドは古い法を削除する
setopt hist_ignore_space        # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks       # ヒストリに保存するときに余分なスペースを削除する
setopt hist_no_store            # ヒストリにhistoryコマンドを記録しない
setopt extended_history         # 履歴ファイルに時刻を記録
setopt hist_verify              # ヒストリを呼び出してから一旦編集可能にする

# Keybind/Alias -------------------------------------------------------------- 

bindkey -e  # emacs キーバインドを有効にする

# ls
alias ls="ls -G"  # 色つきをデフォルト
alias la='ls -A'
alias ll='ls -l'
alias lla='ll -A'

# safety
alias rm='rm -i'  # 実行前に確認を求める
alias cp='cp -i'  # 実行前に確認を求める
alias mv='mv -i'  # 実行前に確認を求める

# sudo
alias sudo='sudo '  # sudo の後のコマンドでエイリアスを有効にする

# Hooks -----------------------------------------------------------------------

# cd後ls
chpwd() {
	if [[ $(pwd) != $HOME ]]; then;
		ls
	fi
}

# OS type zshrc ---------------------------------------------------------------

case "${OSTYPE}" in
    darwin*) source $DOTFILES/zsh/osx.sh ;;
    # linux-gnu) source $DOTFILES/zsh/zshrc.arch ;;
    # linux-gnueabihf) source $DOTFILES/zsh/zshrc.raspi ;;
esac

