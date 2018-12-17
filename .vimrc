augroup MyAutoCmd
  autocmd!
augroup END

filetype plugin indent on
syntax on

set t_Co=256

let g:keymap_rc = $HOME . '/.config/nvim/keymap.rc.vim'
let g:option_rc = $HOME . '/.config/nvim/options.rc.vim'

execute 'source' g:keymap_rc
execute 'source' g:option_rc

"pyenv settings---------------------------
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'
set pyxversion=3


" vim-plug --------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

    Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

    " Apperance --------------------------------------------------------------
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'

    " Editor -----------------------------------------------------------------
    Plug 'Shougo/vimproc.vim', {'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make'}
    Plug 'Shougo/denite.nvim'
    Plug 'cohama/lexima.vim'
    
    " Runnig -----------------------------------------------------------------
    Plug 'thinca/vim-quickrun'

call plug#end()


" Color Theme
colorscheme onedark


" Denite
nnoremap [denite] <Nop>
nmap <C-f> [denite]
nmap <silent> [denite]<C-p> :<C-u>Denite file_rec<CR>
nmap <silent> [denite]<C-b> :<C-u>Denite buffer<CR>
nmap <silent> [denite]<C-o> :<C-u>Denite outline<CR>
nmap <silent> [denite]<C-d> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/.dotfiles']}])<CR>

call denite#custom#map('insert', '<C-K>', '<denite:do_action:split>')
call denite#custom#map('insert', '<C-H>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', '<C-T>', '<denite:do_action:tabopen>')
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>')

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
        \ '.git/', 'build/', '__pycache__/',
        \ 'images/', '*.o', '*.make', '*.min.*',
        \ 'img/', 'fonts/', '*~', '*.exe', '*.bak',
        \ '.DS_Store', '*.pyc', '*.class', 'tags'
        \ ])


" QuickRun
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 60,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
    \ }
\}

