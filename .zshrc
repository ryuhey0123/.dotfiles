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
source $HOME/.dotfiles/bin/tmux_startup.zsh
source $DOTFILES/.env
source $DOTFILES/bin/addpages.sh

# Options ---------------------------------------------------------------------
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
# History
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
# compinit
autoload -Uz compinit
setopt correct
compinit

# Keybind ------------------------------------------------------------------- 
bindkey '^R' history-incremental-pattern-search-backward
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

# Ls Colors ----------------------------------------------------------------------
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

# zplug -----------------------------------------------------------------------
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
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

