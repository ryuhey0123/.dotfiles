
"  /$$$$$$$  /$$       /$$   /$$  /$$$$$$  /$$$$$$ /$$   /$$  /$$$$$$ 
" | $$__  $$| $$      | $$  | $$ /$$__  $$|_  $$_/| $$$ | $$ /$$__  $$
" | $$  \ $$| $$      | $$  | $$| $$  \__/  | $$  | $$$$| $$| $$  \__/
" | $$$$$$$/| $$      | $$  | $$| $$ /$$$$  | $$  | $$ $$ $$|  $$$$$$ 
" | $$____/ | $$      | $$  | $$| $$|_  $$  | $$  | $$  $$$$ \____  $$
" | $$      | $$      | $$  | $$| $$  \ $$  | $$  | $$\  $$$ /$$  \ $$
" | $$      | $$$$$$$$|  $$$$$$/|  $$$$$$/ /$$$$$$| $$ \  $$|  $$$$$$/
" |__/      |________/ \______/  \______/ |______/|__/  \__/ \______/ 
"                                                                    

call plug#begin('~/.local/share/nvim/plugged')

" local
Plug '/usr/local/opt/fzf'
" Appearance
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Integrations
Plug 'tpope/vim-surround'               " Add parentheses commands
Plug 'tpope/vim-commentary'             " Add comment string commands
Plug 'tpope/vim-fugitive'               " Add git commands
Plug 'junegunn/vim-easy-align'          " Align tool
Plug 'cohama/lexima.vim'                " Auto close parentheses
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'thinca/vim-quickrun'              " Quick runner
" Interface
Plug 'airblade/vim-gitgutter'           " Show diffs
Plug 'majutsushi/tagbar'                " Displays tags
Plug 'scrooloose/nerdtree'              " File manager
Plug 'junegunn/fzf.vim'                 " Fuzzy finder
Plug 'yggdroot/indentline'              " Indent line
" Language
Plug 'sheerun/vim-polyglot'             " A solid language pack for Vim.

call plug#end()


"" Color scheme
" Comment color
autocmd ColorScheme * highlight clear vimComment
autocmd ColorScheme * highlight vimComment cterm=italic ctermfg=darkgray
autocmd ColorScheme * highlight clear vimLineComment
autocmd ColorScheme * highlight vimLineComment cterm=italic ctermfg=darkgreen
" Spell check highlight
autocmd ColorScheme * highlight clear SpellBad
autocmd ColorScheme * highlight clear SpellCap
autocmd ColorScheme * highlight SpellBad cterm=undercurl
autocmd ColorScheme * highlight SpellCap cterm=undercurl
" Pair caret color
autocmd ColorScheme * highlight MatchParen ctermbg=gray
" Caret bar color
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
" Selected color
autocmd ColorScheme * highlight Visual ctermbg=darkblue
" scheme
colorscheme molokai 


"" Airline
let g:airline_theme = 'deus'
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0


" nerdtree
nnoremap <silent> <F2> :NERDTreeToggle <bar> :TagbarToggle<CR>


"" gitgutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'


"" Indent line
let g:indentline_color_term = 111
let g:indentline_color_gui = '#708090'
let g:indentline_char = "|"


"" fzf
" Selection keybind
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-k': 'split',
    \ 'ctrl-h': 'vsplit' }
" Files with preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Hide status line
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Cosutom statusline
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
" keymap
nnoremap [fzf] <Nop>
nmap <C-f> [fzf]
nmap [fzf]<C-p> :Files<CR>
nmap [fzf]<C-g> :GFiles?<CR>
nmap [fzf]<C-f> :Buffers<CR>
nmap [fzf]<C-t> :BTags<CR>
nmap [fzf]<C-d> :Files ~/.dotfiles<CR>
nmap [fzf]<C-h> :History<CR>


" Easy-align
vmap <CR> <Plug>(EasyAlign)


"" tagbar
let g:tagbar_left = 1
let g:tagbar_vertical = 25


"" vim-quickrun
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
nnoremap <silent> <F5> :QuickRun<CR>


"" vim-polyglot
let g:polyglot_disabled = ['markdown']

