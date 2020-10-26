
"   /$$$$$$  /$$$$$$$  /$$$$$$$$ /$$$$$$  /$$$$$$  /$$   /$$  /$$$$$$ 
"  /$$__  $$| $$__  $$|__  $$__/|_  $$_/ /$$__  $$| $$$ | $$ /$$__  $$
" | $$  \ $$| $$  \ $$   | $$     | $$  | $$  \ $$| $$$$| $$| $$  \__/
" | $$  | $$| $$$$$$$/   | $$     | $$  | $$  | $$| $$ $$ $$|  $$$$$$ 
" | $$  | $$| $$____/    | $$     | $$  | $$  | $$| $$  $$$$ \____  $$
" | $$  | $$| $$         | $$     | $$  | $$  | $$| $$\  $$$ /$$  \ $$
" |  $$$$$$/| $$         | $$    /$$$$$$|  $$$$$$/| $$ \  $$|  $$$$$$/
"  \______/ |__/         |__/   |______/ \______/ |__/  \__/ \______/ 
"                                                                    

" Encoding --------------------------------------------------------------------
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

" Appearance -----------------------------------------------------------------
" set termguicolors
set wildmenu                        "ナビゲーションバー
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so
" set cursorline                      "カーソル行をハイライト
set hidden                          "変更中のでも保存せずで他のファイルを表示
set number                          "行番号を表示する
set colorcolumn=80                  "80文字目にラインを入れる
set textwidth=0                     "テキストの最大幅を無効に
set history=10000                   "コマンド、検索の履歴を1万個まで
set ruler                           "右下に行・列番号を表示
set cmdheight=2                     "コマンドラインに使われる行数
set showcmd                         "入力中のコマンドをステータスに表示する
set title                           "タイトルをウィンドウ枠に表示する
set scrolloff=5                     "スクロールするとき下が見えるように
set laststatus=2                    "2行目にステータスラインを常時表示
set showtabline=2                   "常にタブラインを表示
" set wrap                            "ウィンドウより長い行は折り畳む
set list                            "不可視文字の可視化
set visualbell t_vb=                "ビジュアルベルの無効化
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set signcolumn=yes                  "行コラムの隣に空白
set updatetime=50
set ambiwidth=double                "全角記号の表示がずれる問題への対応

" Searching --------------------------------------------------------------------
set ignorecase                      "大文字小文字を区別しない
set smartcase                       "検索文字に大文字がある場合は大文字小文字を区別
set incsearch                       "インクリメンタルサーチ
set hlsearch                        "検索マッチテキストをハイライト

" Tab -------------------------------------------------------------------------
set tabstop=4                       "タブは4スペース
set shiftwidth=4                    "自動インデントのスペース指定
set smarttab                        "新しい行を作った時高度なインデントを行う
set expandtab                       "タブのかわりに空白を使う
set softtabstop=4
set autoindent                      "新しい行のインデントを現在行と同じにする

" Edit ------------------------------------------------------------------------
set smartindent                     "C言語風インデント
set infercase                       "補完時に大文字小文字を区別しない
set tw=0                            "自動改行オフ
set showmatch                       "閉じカッコが入力時対応するカッコを強調
set matchpairs& matchpairs+=<:>     "<>対応括弧ペアに
set matchtime=3                     "対応括弧表示を3秒に
set backspace=indent,eol,start      "バックスペースで各種消せるよう
set modeline                        "モードラインをオンにする
set modelines=5                     "5行までモードラインを検索する<Paste>
set clipboard+=unnamed              "クリップボードの共有
set shiftround                      "インデントをshift widthの倍数に
set mouse=a                         "マウスモード有効
set nostartofline                   "移動コマンドを使った時行頭に移動しない
" set gdefault                        "置換の時gオプションをデフォルトで有効にする
set autoread                        "編集中のファイルが変更されたら、自動的に読み直す 

set nowritebackup
set nobackup
set noswapfile

" File type --------------------------------------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.vs set filetype=vectorscript
au BufRead,BufNewFile *.vss set filetype=vectorscript
au BufRead,BufNewFile *.mgt set filetype=mgtcommand

" Command Mode Settings -------------------------------------------------------
set sh=zsh

" Spell check -----------------------------------------------------------------
set spelllang=en,cjk
" ]s            次のスペルミスの箇所へ移動
" [s            前のスペルミスの箇所へ移動
" z             正しいスペルの候補を表示し、選択した単語でスペルミスを修正
" zg            カーソル下の単語を正しいスペルとして辞書登録
" zw            カーソル下の単語を誤ったスペルとして辞書登録

" Syntax ----------------------------------------------------------------------
let g:python_highlight_all = 1
let g:is_bash = 1

" Comment Settings
autocmd FileType midascommand setlocal commentstring=;\ %s

" Script ----------------------------------------------------------------------
" memorize cursol position
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" Eternal undo
if has('persistent_undo')
    set undodir=~/.cache/nvim/undo
    set undofile
endif

" tmux cursor
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
"     let &t_SR = "\<Esc>Ptmux;\<Esc>\e[3 q\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
" else
"     let &t_SI = "\e[5 q"
"     let &t_EI = "\e[2 q"
" endif

