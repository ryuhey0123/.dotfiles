#        ______     _____   __    __   ______       ____  
#       (____  )   / ____\ (  \  /  ) (   __ \     / ___) 
#           / /   ( (___    \ (__) /   ) (__) )   / /     
#       ___/ /_    \___ \    ) __ (   (    __/   ( (      
#      /__  ___)       ) )  ( (  ) )   ) \ \  _  ( (      
#  __    / /____   ___/ /    ) )( (   ( ( \ \_))  \ \___  
# (__)  (_______) /____/    /_/  \_\   )_) \__/    \____) 
#                                                         

# Environment -----------------------------------------------------------------

export VIM_OSTYPE=$OSTYPE

export DOTFILES=$HOME/.dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# OS type zshrc ---------------------------------------------------------------

case "${OSTYPE}" in
    darwin*) source $DOTFILES/zsh/macos.sh ;;
    linux-gnu) source $DOTFILES/zsh/raspi.sh ;;
esac

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
HISTSIZE=10000
SAVEHIST=10000
setopt share_history            # 同時に起動したzshの間でヒストリを共有する
setopt extended_history         # 履歴ファイルに時刻を記録
setopt hist_ignore_dups         # 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_all_dups     # 重複するコマンドは古い法を削除する
setopt hist_ignore_space        # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks       # ヒストリに保存するときに余分なスペースを削除する
setopt hist_no_store            # ヒストリにhistoryコマンドを記録しない
setopt hist_verify              # history から実行時に確認

# Keybind/Alias -------------------------------------------------------------- 

bindkey -e  # emacs キーバインドを有効にする

# ls
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
