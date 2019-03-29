#        ______     _____   __    __   ______       ____  
#       (____  )   / ____\ (  \  /  ) (   __ \     / ___) 
#           / /   ( (___    \ (__) /   ) (__) )   / /     
#       ___/ /_    \___ \    ) __ (   (    __/   ( (      
#      /__  ___)       ) )  ( (  ) )   ) \ \  _  ( (      
#  __    / /____   ___/ /    ) )( (   ( ( \ \_))  \ \___  
# (__)  (_______) /____/    /_/  \_\   )_) \__/    \____) 
#                                                         

# tmux auto start
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi

# 環境変数 --------------------------------------------------------------------

autoload -U promptinit; promptinit

# general
export LANG=ja_JP.UTF-8
export PATH=$PATH:$HOME/.bin

# zpulg
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pyenv
if which pyenv > /dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    if [[ -d $PYENV_ROOT ]];then
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# rbenv 
if which rbenv > /dev/null 2>&1; then
    export RBENV_ROOT="$HOME/.rbenv"
    eval "$(rbenv init -)"
fi

# nodenv
if which nodenv > /dev/null 2>&1; then
    export NODENV_ROOT="$HOME/.nodenv"
    eval "$(nodenv init -)"
fi

# golang
if which go > /dev/null 2>&1; then
    export GOPATH=$HOME/Developer/Go
    export PATH=$PATH:$GOPATH/bin
fi

# z
. `brew --prefix`/etc/profile.d/z.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# ctags
alias ctags="`brew --prefix`/bin/ctags"


# オプション ------------------------------------------------------------------

setopt print_eight_bit          # 日本語ファイル名を表示可能にする
setopt no_beep                  # beep を無効にする
setopt no_flow_control          # フローコントロールを無効にする
setopt ignore_eof               # '#' 以降をコメントとして扱う
setopt interactive_comments     # ディレクトリ名だけでcdする
setopt auto_cd                  # cd したら自動的にpushdする
function chpwd() { ls }
setopt auto_pushd
setopt pushd_ignore_dups        # 重複したディレクトリを追加しない
setopt share_history            # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups     # スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
setopt hist_reduce_blanks       # ヒストリに保存するときに余分なスペースを削除する
setopt extended_glob            # 高機能なワイルドカード展開を使用する
setopt auto_list
setopt auto_menu

# ヒストリの設定
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

# 補完機能を有効にする
autoload -Uz compinit
setopt correct
compinit

# キーバインド --------------------------------------------------------------- 

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
# emacs 風キーバインドにする
bindkey -e


# エイリアス ----------------------------------------------------------------

alias la='ls -A'
alias ll='ls -l'
alias lla='ll -A'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'


# Colors ----------------------------------------------------------------------
# ls の色設定
export LSCOLORS=gxfxcxdxbxegedabagacad
#   ---------------------LS_COLORS--------------------
#   No	    Type	            Foreground	Background
#   --------------------------------------------------
#   1,2	    Directory	        blue	    (default)
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
#
#   ----------------------COLORS----------------------
#   --------------------------------------------------
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

# OS 別の設定 -----------------------------------------------------------------
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac


### Commands ##################################################################

# 構造計算書用ページ振り
# 第一引数から第二引数までのページを振る
# 例) addpages 0 7 -> 0*.pdf から 7*.pdf までのページが振られる
function addpages() {
    for i in `seq $1 $2`
    do
        addpage -f "${i} - %d" -z 8 -o $i.pdf $i*.pdf
    done
}


# PLUGINS ---------------------------------------------------------------------
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   printf "Install? [y/N]: "
   if read -q; then
       echo; zplug install
   fi
fi

# Then, source plugins and add commands to $PATH
zplug load

