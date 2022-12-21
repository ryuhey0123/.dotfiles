#        ______     _____   __    __   ______       ____  
#       (____  )   / ____\ (  \  /  ) (   __ \     / ___) 
#           / /   ( (___    \ (__) /   ) (__) )   / /     
#       ___/ /_    \___ \    ) __ (   (    __/   ( (      
#      /__  ___)       ) )  ( (  ) )   ) \ \  _  ( (      
#  __    / /____   ___/ /    ) )( (   ( ( \ \_))  \ \___  
# (__)  (_______) /____/    /_/  \_\   )_) \__/    \____) 
#                                                         

autoload -U promptinit; promptinit
export DOTFILES=$HOME/.dotfiles
export VIM_OSTYPE=$OSTYPE

# Startup ---------------------------------------------------------------------
# source $DOTFILES/bin/tmux_startup.zsh     # tmux auto startup script
# environment variable
case "${OSTYPE}" in
    darwin*) source $DOTFILES/env/env.osx ;;
    linux-gnu) source $DOTFILES/env/env.arch ;;
    linux-gnueabihf) source $DOTFILES/env/env.raspi ;;
esac

# Options ---------------------------------------------------------------------
setopt print_eight_bit          # 日本語ファイル名を表示可能にする
setopt no_beep                  # beep を無効にする
setopt no_flow_control          # フローコントロールを無効にする
setopt ignore_eof               # '#' 以降をコメントとして扱う
setopt interactive_comments     # ディレクトリ名だけでcdする
setopt auto_cd                  # cd したら自動的にpushdする
function chpwd() { ls -G }      # cd後ls
setopt auto_pushd               # 自動でpushd実行
setopt pushd_ignore_dups        # 重複したディレクトリを追加しない
setopt extended_glob            # 高機能なワイルドカード展開を使用する

# Complement ------------------------------------------------------------------
autoload -Uz compinit
compinit

setopt correct                  # Spell check
setopt hist_expand              # 補完時にヒストリを自動的に展開する
setopt list_types               # 補完候補一覧でファイルの種別を識別マーク表示
setopt auto_param_keys          # カッコの対応などを自動的に補完
setopt nolistbeep               # 補完候補表示時にビープ音を鳴らさない
setopt auto_list                # 補完候補が複数ある時に、一覧表示
setopt auto_menu                # 補完キーで順に補完候補を自動で補完

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補をハイライトする
zstyle ':completion:*:default' menu select=2
# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true

# pipenv
# eval "$(pipenv --completion)"
eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# History ---------------------------------------------------------------------
HISTFILE=$HOME/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt share_history            # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups     # 重複したコマンドラインはヒストリに追加しない
setopt hist_ignore_space        # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks       # ヒストリに保存するときに余分なスペースを削除する
setopt hist_no_store            # ヒストリにhistoryコマンドを記録しない
setopt extended_history         # 履歴ファイルに時刻を記録
setopt inc_append_history       # 履歴をインクリメンタルに追加

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
autoload history-search-end

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Keybind ------------------------------------------------------------------- 
bindkey -e

# Alias -----------------------------------------------------------------------
# Global
alias -g G='| grep --color=auto'
alias -g L='| less -R'
alias -g X='| xargs'
# ls
alias la='ls -A'
alias ll='ls -l'
alias lla='ll -A'
# safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# mkdir
alias mkdir='mkdir -p'
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
# sudo
alias sudo='sudo '          # sudo の後のコマンドでエイリアスを有効にする
# git
alias ga='git add'
alias gc='git commit' alias gps='git push'
alias gpl='git pull'
# tmux
alias tmux='tmux -u'


# Colors -----------------------------------------------------------------------
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS='di=01;36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#   ---------------------LSCOLORS---------------------
#   No	    Type	            Foreground	Background
#   --------------------------------------------------
#   1,2	    Directory	        bold gray   (default)
#   3,4	    Symlink	            magenta	    (default)
#   5,6	    Socket	            green	    (default)
#   7,8	    Pipe	            brown	    (default)
#   9,10	Executable	        red	        (default)
#   11,12	Block	            blue	    cyan
#   13,14	Character	        blue	    brown
#   15,16	Exec. w/ SUID   	black	    red
#   17,18	Exec. w/ SGID	    black	    cyan
#   19,20	Dir, o+w, sticky	black	    green
#   21,22	Dir, o+w, unsticky	black	    brown
#   ----------------------COLORS----------------------
#   a	black
#   b	red
#   c	green
#   d	brown
#   e	blue
#   f	magenta
#   g	cyan
#   h	light grey
#   A	bold black, usually shows up as dark grey
#   B	bold red
#   C	bold green
#   D	bold brown, usually shows up as yellow
#   E	bold blue
#   F	bold magenta
#   G	bold cyan
#   H	bold light grey; looks like bright white
#   x	default foreground or background

# color at completion
autoload colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# OS 
case "${OSTYPE}" in
    darwin*) source $DOTFILES/etc/zsh/zshrc.osx ;;
    linux-gnu) source $DOTFILES/etc/zsh/zshrc.arch ;;
    linux-gnueabihf) source $DOTFILES/etc/zsh/zshrc.raspi ;;
esac


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Created by `pipx` on 2022-12-21 08:31:32
export PATH="$PATH:/Users/fujita/.local/bin"
