augroup MyAutoCmd
  autocmd!
augroup END

filetype off
filetype plugin indent off

let g:keymap_rc = $HOME . '/.config/nvim/keymap.rc.vim'
let g:option_rc = $HOME . '/.config/nvim/options.rc.vim'

execute 'source' g:keymap_rc
execute 'source' g:option_rc

"dein Scripts-----------------------------
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#add('Shougo/dein.vim')
    "call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    " Read TOML 
    let g:rc_dir      = expand('~/.config/nvim')
    let s:toml        = g:rc_dir . '/dein.toml'
    let s:lazy        = g:rc_dir . '/dein_lazy.toml'
    let s:lazy_toml   = g:rc_dir . '/dein_toml.toml'
    let s:lazy_python = g:rc_dir . '/dein_python.toml'
    let s:lazy_vss    = g:rc_dir . '/dein_vss.toml'
    let s:lazy_go     = g:rc_dir . '/dein_go.toml'
    " Cache TOML 
    call dein#load_toml(s:toml,        {'lazy': 0})
    call dein#load_toml(s:lazy,        {'lazy': 1})
    call dein#load_toml(s:lazy_toml,   {'lazy': 1})
    call dein#load_toml(s:lazy_python, {'lazy': 1})
    call dein#load_toml(s:lazy_vss,    {'lazy': 1})
    call dein#load_toml(s:lazy_go,     {'lazy': 1})
    " End setting:
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

set t_Co=256
syntax enable

filetype plugin indent on

