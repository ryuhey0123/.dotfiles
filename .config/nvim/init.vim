if &compatible
    set nocompatible
endif

augroup MyAutoCmd
    autocmd!
augroup END

"pyenv settings---------------------------
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

"rbenv setings----------------------------
let g:ruby_host_prog = $RBENV_ROOT . '/versions/2.5.3/bin/neovim-ruby-host' 

"nodenv settings--------------------------
let g:node_host_prog = $NODENV_ROOT . '/versions/11.3.0/bin/neovim-node-host'

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
    let g:rc_dir    = expand('~/.config/nvim')
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

runtime! options.rc.vim
runtime! keymap.rc.vim

