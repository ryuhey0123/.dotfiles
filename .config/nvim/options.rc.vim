" Color Theme
"set background=dark
colorscheme onedark 

" Editer
set wildmenu                        "ナビゲーションバー
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so
set tw=0                            "自動改行オフ
set cursorline                     "カーソル行をハイライト
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
set showtabline=2                   "常にタブラインを表示

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
set matchtime=1                     "対応括弧表示を3秒に
set backspace=indent,eol,start      "バックスペースで各種消せるよう
set virtualedit+=block              "文字がない行末にも移動することができる
set modeline                        "モードラインをオンにする
set modelines=5                     "5行までモードラインを検索する<Paste>
set clipboard+=unnamed              "クリップボードの共有

" 拡張子の設定
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.vs set filetype=vectorscript
au BufRead,BufNewFile *.vss set filetype=vectorscript

" Command Mode Settings
set sh=zsh

