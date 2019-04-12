
"   /$$   /$$ /$$$$$$$$  /$$$$$$  /$$    /$$ /$$$$$$ /$$      /$$
" | $$$ | $$| $$_____/ /$$__  $$| $$   | $$|_  $$_/| $$$    /$$$
" | $$$$| $$| $$      | $$  \ $$| $$   | $$  | $$  | $$$$  /$$$$
" | $$ $$ $$| $$$$$   | $$  | $$|  $$ / $$/  | $$  | $$ $$/$$ $$
" | $$  $$$$| $$__/   | $$  | $$ \  $$ $$/   | $$  | $$  $$$| $$
" | $$\  $$$| $$      | $$  | $$  \  $$$/    | $$  | $$\  $ | $$
" | $$ \  $$| $$$$$$$$|  $$$$$$/   \  $/    /$$$$$$| $$ \/  | $$
" |__/  \__/|________/ \______/     \_/    |______/|__/     |__/


if &compatible
    set nocompatible
endif

augroup MyAutoCmd
    autocmd!
augroup END

filetype plugin indent on
syntax enable

"pyenv settings
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'
"rbenv setings
let g:ruby_host_prog = $RBENV_ROOT . '/versions/2.5.3/bin/neovim-ruby-host' 
"nodenv settings
let g:node_host_prog = $NODENV_ROOT . '/versions/11.3.0/bin/neovim-node-host'

"call other settings ----------------------------------------------------------
runtime! plug.rc.vim
runtime! options.rc.vim
runtime! keymap.rc.vim
runtime! get_syc_id.vim
runtime! hint_info_ctrl_x.vim

