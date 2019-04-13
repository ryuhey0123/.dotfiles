
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
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
" Integrations
Plug 'tpope/vim-surround'               " Add parentheses commands
Plug 'tpope/vim-commentary'             " Add comment string commands
Plug 'tpope/vim-fugitive'               " Add git commands
Plug 'cohama/lexima.vim'                " Auto close parentheses
Plug 'osyo-manga/vim-over'              " Substitute preview
" Interface
Plug 'airblade/vim-gitgutter'           " Show diffs
Plug 'junegunn/fzf.vim'                 " Fuzzy finder
Plug 'yggdroot/indentline'              " Indent line
" Language
Plug 'sheerun/vim-polyglot'             " A solid language pack for Vim.
Plug 'vim-scripts/vectorscript.vim'     " vectorscript syntax file
" Complete
Plug 'Shougo/deoplete.nvim'
" Lazy
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'szw/vim-tags', {'on': 'TagsGenerate'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} 
Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}
" System
Plug 'Shougo/vimproc.vim', {'do': 'make'}

call plug#end()


"" Color scheme
set background=dark
let g:one_allow_italics = 1
colorscheme one

"" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10

"" Lightline (ref statico/dotfiles/.vim/vimrc)
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
        \ 'left': [['mode', 'paste'], ['filename', 'modified']],
        \ 'right': [
            \ ['lineinfo'], ['percent'], 
            \ ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
    \ },
    \ 'component_expand': {
        \ 'linter_warnings': 'LightlineLinterWarnings',
        \ 'linter_errors': 'LightlineLinterErrors',
        \ 'linter_ok': 'LightlineLinterOK'
    \ },
    \ 'component_type': {
        \ 'readonly': 'error',
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error'
    \ },
\ }

function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
    if exists('#lightline')
        call lightline#update()
    end
endfunction

" nerdtree/tagbar
nnoremap <silent> <F2> :NERDTreeToggle <bar> :TagbarToggle<CR>

"" gitgutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

"" fzf
" Selection keybind
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-k': 'split',
    \ 'ctrl-h': 'vsplit' }
" Files with preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" status line
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
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

"" vim-over
nnoremap <C-s><C-s> :OverCommandLine<CR>%s/
nnoremap <C-s><C-u> :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

