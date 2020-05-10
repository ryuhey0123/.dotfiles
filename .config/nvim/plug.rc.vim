
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


if $VIM_OSTYPE =~ "darwin"
    " local
    Plug '/usr/local/opt/fzf'
    Plug 'tpope/vim-fugitive'               " Add git commands
    Plug 'osyo-manga/vim-over'              " Substitute preview
    Plug 'airblade/vim-gitgutter'           " Show diffs
    Plug 'gorodinskiy/vim-coloresque'       " Color preview
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'sh install.sh',
    \ }
    Plug 'coddingtonbear/neomake-platformio'
elseif $VIM_OSTYPE == "linux-gnueabihf"
    " local
    Plug '~/.fzf'
    Plug 'w0rp/ale'
endif

" Appearance
" Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
" Integrations
Plug 'tpope/vim-surround'               " Add parentheses commands
Plug 'tpope/vim-commentary'             " Add comment string commands
Plug 'cohama/lexima.vim'                " Auto close parentheses
" Interface
Plug 'junegunn/fzf.vim'                 " Fuzzy finder
Plug 'yggdroot/indentline'              " Indent line
" Language
Plug 'sheerun/vim-polyglot'             " A solid language pack for Vim.
Plug 'vim-scripts/vectorscript.vim', {'for': 'vectorscript'}
" Complete
Plug 'Shougo/deoplete.nvim'
" Lazy
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
" Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" Plug 'szw/vim-tags', {'on': 'TagsGenerate'}
" Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} 
" Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}
" System
Plug 'Shougo/vimproc.vim', {'do': 'make'}
" HTML/CSS
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}

call plug#end()


"" Color scheme
set background=dark
let g:one_allow_italics = 1
" Popup menu
autocmd ColorScheme * highlight Pmenu ctermbg=darkgray ctermfg=lightblue
autocmd ColorScheme * highlight PmenuSel ctermbg=gray
colorscheme one


"" deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
    \ 'auto_complete_delay': 0,
    \ 'camel_case': v:true,
    \ 'refresh_always': v:false,
    \ 'smart_case': v:true,
    \ 'max_list': 20
    \ })


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

"function! LightlineLinterWarnings() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
"endfunction
"
"function! LightlineLinterErrors() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
"endfunction
"
"function! LightlineLinterOK() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '✓ ' : ''
"endfunction
"
"autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
    if exists('#lightline')
        call lightline#update()
    end
endfunction


" nerdtree/tagbar
" nnoremap <silent> <F2> :NERDTreeToggle <bar> :TagbarToggle<CR>


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
" let g:tagbar_left = 1
" let g:tagbar_vertical = 25


"" vim-quickrun
"let g:quickrun_config = {
"    \ '_' : {
"        \ 'runner' : 'vimproc',
"        \ 'runner/vimproc/updatetime' : 60,
"        \ 'outputter' : 'error',
"        \ 'outputter/error/success' : 'buffer',
"        \ 'outputter/error/error'   : 'quickfix',
"        \ 'outputter/buffer/split' : ':botright 8sp',
"    \ }
"\}
"nnoremap <silent> <F5> :QuickRun<CR>


"" vim-polyglot
let g:polyglot_disabled = ['markdown']


"" vim-over
nnoremap <C-s><C-s> :OverCommandLine<CR>%s/
nnoremap <C-s><C-u> :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>


"" ALE
"let g:ale_fixers = {'python': ['autopep8', 'black', 'isort'],}
"let g:ale_python_flake8_executable = g:python3_host_prog
"let g:ale_python_flake8_options = '-m flake8'
"let g:ale_python_autopep8_executable = g:python3_host_prog
"let g:ale_python_autopep8_options = '-m autopep8'
"let g:ale_python_isort_executable = g:python3_host_prog
"let g:ale_python_isort_options = '-m isort'
"let g:ale_python_black_executable = g:python3_host_prog
"let g:ale_python_black_options = '-m black'
"let g:ale_echo_msg_error_str = '🚫'
"let g:ale_echo_msg_warning_str = '⚠️'
"let g:ale_echo_msg_format = '%severity%  %code%: %s [%linter%]'
"let g:ale_linters = {
"    \ 'python': ['flake8'],
"    \ 'c': ['clangd'],
"    \ 'cpp': ['clangd']
"\ }
"
"nmap <silent> <F8> <Plug>(ale_fix)
"

"" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \'c': ['clangd', '-compile-commands-dir=' . getcwd()],
    \'cpp': ['clangd', '-compile-commands-dir=' . getcwd()],
\}
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

augroup LCHighlight
    autocmd!
    autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp call LanguageClient#textDocument_documentHighlight()
augroup END

" set updatetime=50  " カーソル停止から更新までの時間をミリ秒で記入。デフォルトは4秒=4000

