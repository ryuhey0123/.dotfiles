filetype plugin indent on

syntax on

set hlsearch
set ignorecase
set smartcase

set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed

imap [ []<left>
imap < <><left>
imap ( ()<left>
imap { {}<left>

ninoremap jj <ESC>
nnoremap ; :
noremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>
