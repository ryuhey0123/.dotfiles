### 環境変数 #################################################################
export LANG=ja_JP.UTF-8
export PATH=$PATH:$HOME/.bin

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
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi

### プロンプト#################################################################

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


### 補完 ######################################################################
# 補完機能を有効にする
autoload -Uz compinit
setopt correct
compinit

zstyle ':completion:*' menu select

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


### vcs_info ##################################################################
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


### オプション ################################################################ 
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# '#' 以降をコメントとして扱う
setopt interactive_comments
# ディレクトリ名だけでcdする
setopt auto_cd
function chpwd() { ls }
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 高機能なワイルドカード展開を使用する
setopt extended_glob


### キーバインド ############################################################## 

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# emacs 風キーバインドにする
bindkey -e


### エイリアス ################################################################

alias la='ls -A'
alias ll='ls -l'
alias lla='ll -A'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias JN='jupyter-notebook'
alias JL='jupyter-lab'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi


### Colors #################################################################### 
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

### OS 別の設定 ###############################################################
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
# どこでもMyMacを使用したSSH接続
function sshbtmm(){
  ssh -2 -6 $1.$(echo show Setup:/Network/BackToMyMac | scutil | sed -n 's/.* : *\(.*\).$/\1/p')
}


### zplug #####################################################################
# source ~/.zplug/init.zsh
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# 
# if ! zplug check --verbose; then
#     printf "Install new plugin? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
#  
# zplug load --verbose

