
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
    Plug '/usr/local/opt/fzf'
elseif $VIM_OSTYPE == "linux-gnueabihf"
    Plug '~/.fzf'
endif

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'cocopon/iceberg.vim'
Plug 'ayu-theme/ayu-vim'                " Nice color. But only true color.
Plug 'joshdick/onedark.vim'
" Integrations
Plug 'machakann/vim-sandwich'           " The set of operator and textobject
Plug 'tpope/vim-commentary'             " Add comment string commands
Plug 'cohama/lexima.vim'                " Auto close parentheses
Plug 'airblade/vim-gitgutter'           " Show diffs
Plug 'gorodinskiy/vim-coloresque'       " Color preview
Plug 'osyo-manga/vim-over'              " Substitute preview
Plug 'mattn/emmet-vim'
" Interface
Plug 'junegunn/fzf.vim'                 " Fuzzy finder
" Syntax
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'wilriker/gcode.vim', {'for': 'gcode'}
Plug 'vim-scripts/vectorscript.vim', {'for': 'vectorscript'}
Plug 'ryuhey0123/midas-mgt-syntax', {'for': 'mgtcommand'}
" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Lazy
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}

call plug#end()


" Color scheme ------------------------------------------------------------{{{

" runtime! onedark.rc.vim

let lightlineTheme = ''
if has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let lightlineTheme = 'ayu'
    set termguicolors
    runtime! ayu.rc.vim
else
    let lightlineTheme = 'iceberg'
    runtime! iceberg.rc.vim
endif

" Popup menu
" autocmd ColorScheme * highlight Pmenu ctermbg=darkgray ctermfg=lightblue
" autocmd ColorScheme * highlight PmenuSel ctermbg=gray

"}}}

" deoplete ----------------------------------------------------------------{{{
" let g:deoplete#enable_at_startup = 1

" call deoplete#custom#option({
"     \ 'auto_complete_delay': 0,
"     \ 'camel_case': v:true,
"     \ 'refresh_always': v:false,
"     \ 'smart_case': v:true,
"     \ 'max_list': 20
" \ })

"}}}

" Lightline  --------------------------------------------------------------{{{
" (ref statico/dotfiles/.vim/vimrc)
let g:lightline = {
    \ 'colorscheme': lightlineTheme,
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

"}}}

" gitgutter ---------------------------------------------------------------{{{
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

"}}}

" fzf ---------------------------------------------------------------------{{{
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
nmap <C-p> [fzf]
nmap [fzf]<C-p> :Files<CR>
nmap [fzf]<C-g> :GFiles?<CR>
nmap [fzf]<C-f> :Buffers<CR>
nmap [fzf]<C-t> :BTags<CR>
nmap [fzf]<C-d> :Files ~/.dotfiles<CR>
nmap [fzf]<C-h> :History<CR>

"}}}

" Easy-align --------------------------------------------------------------{{{
vmap <CR> <Plug>(EasyAlign)

" }}}

" vim-over ----------------------------------------------------------------{{{
nnoremap <C-s><C-s> :OverCommandLine<CR>%s/
nnoremap <C-s><C-u> :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

"}}}

" Coc.nvim -----------------------------------------------------------------{{{
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"}}}

" Semshi -------------------------------------------------------------------{{{
let g:semshi#error_sign = v:false

"}}}

" vim: set fdl=0 fdm=marker:
