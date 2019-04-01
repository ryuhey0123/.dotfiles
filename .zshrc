#        ______     _____   __    __   ______       ____  
#       (____  )   / ____\ (  \  /  ) (   __ \     / ___) 
#           / /   ( (___    \ (__) /   ) (__) )   / /     
#       ___/ /_    \___ \    ) __ (   (    __/   ( (      
#      /__  ___)       ) )  ( (  ) )   ) \ \  _  ( (      
#  __    / /____   ___/ /    ) )( (   ( ( \ \_))  \ \___  
# (__)  (_______) /____/    /_/  \_\   )_) \__/    \____) 
#                                                         

autoload -U promptinit; promptinit
export DOTFILES=$HOME/.dotfiles/

# Startup ---------------------------------------------------------------------
source $HOME/.dotfiles/bin/tmux_startup.zsh     # tmux auto startup script
source $DOTFILES/.env                           # environment variable
source $DOTFILES/bin/addpages.sh
source $DOTFILES/bin/pdf-concat.sh

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

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

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
alias la='ls -A'
alias ll='ls -l'
alias lla='ll -A'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '          # sudo の後のコマンドでエイリアスを有効にする
# tmux
alias tmux='tmux -u'
# ctags
alias ctags="`brew --prefix`/bin/ctags"
# mas
if [ "$TMUX" != "" ];then
    alias mas="reattach-to-user-namespace mas"
fi

# Colors -----------------------------------------------------------------------
export LSCOLORS=Hxfxcxdxbxegedabagacad
export LS_COLORS='di=01;37:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
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
    darwin*) alias ls="ls -G" ;;
    linux*) alias ls='ls --color' ;;
esac

# zplug -----------------------------------------------------------------------
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

# lazy
zplug "zsh-users/zsh-syntax-highlighting"
# local
zplug "~/.dotfiles/bin/pure", use:pure.zsh, from:local, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   printf "Install? [y/N]: "
   if read -q; then
       echo; zplug install
   fi
fi

# Then, source plugins and add commands to $PATH
zplug load

