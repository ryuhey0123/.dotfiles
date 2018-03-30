" Reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

"dein Scripts-----------------------------
"Rquired:
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#add('Shougo/dein.vim')
    " Read TOML 
    let g:rc_dir    = expand('~/.config/nvim/dein')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    " Cache TOML 
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    " End setting:
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

if &compatible
    set nocompatible
endif

" Color Theme
set background=dark
colorscheme molokai 

" Editer
set wildmenu                        "ナビゲーションバー
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so
set tw=0                            "自動改行オフ
"set cursorline                     "カーソル行をハイライト
set hidden                          "変更中のでも保存せずで他のファイルを表示
set number                          "行番号を表示する
set nostartofline                   "移動コマンドを使った時行頭に移動しない
set matchpairs& matchpairs+=<:>     "<>対応括弧ペアに
set shiftround                      "インデントをshiftwidthの倍数に
set wrap                            "ウィンドウより長い行は折り畳む
set colorcolumn=79                  "79文字目にラインを入れる
set textwidth=0                     "テキストの最大幅を無効に
set history=10000                   "コマンド、検索の履歴を１万個まで
set mouse=a                         "マウスモード有効

set imdisable                       "元は noimdisable
set ruler                           "右下に行・列番号を表示
set cmdheight=2                     "コマンドラインに使われる行数
set showcmd                         "入力中のコマンドをステータスに表示する
set title                           "タイトルをウィンドウ枠に表示する
"set scrolloff=2                    "スクロールするとき下が見えるように
set laststatus=2                    "２行目にステータスラインを常時表示

" Tab
set tabstop=4                       "タブは4スペース
set shiftwidth=4                    "自動インデントのスペース指定
set smarttab                        "新しい行を作った時高度なインデントを行う
set expandtab                       "タブのかわりに空白を使う
set softtabstop=4
set autoindent                      "新しい行のインデントを現在行と同じにする

" Edit
set smartindent
set showmatch                       "閉じカッコが入力時対応するカッコを強調
set matchtime=3                     "対応括弧表示を3秒に
set backspace=indent,eol,start      "バックスペースで各種消せるよう
set virtualedit+=block              "文字がない行末にも移動することができる
set modeline                        "モードラインをオンにする
set modelines=5                     "5行までモードラインを検索する<Paste>

" Keymap
inoremap jj <ESC>

" 拡張子の設定
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.toml set filetype=toml

