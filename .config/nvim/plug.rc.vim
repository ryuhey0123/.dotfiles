
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
Plug 'wilriker/gcode.vim', {'for': 'gcode'}
Plug 'vim-scripts/vectorscript.vim', {'for': 'vectorscript'}
Plug 'ryuhey0123/midas-mgt-syntax', {'for': 'mgtcommand'}
" Complete
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" LSP
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'sh install.sh'}
" Lazy
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}

call plug#end()


" Color scheme ------------------------------------------------------------{{{
let g:onedark_terminal_italics = 1

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" if (has("termguicolors"))
"     set termguicolors
" endif

if (has("autocmd"))
  augroup colorextend
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    autocmd ColorScheme * call onedark#extend_highlight("Folded", { "bg": { "gui": "#1C1C1C", "cterm": 234 } })
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "NONE", "cterm": "NONE" } })
    autocmd ColorScheme * call onedark#extend_highlight("ColorColumn", { "bg": { "gui": "#121212", "cterm": 233 } })
  augroup END
endif

" autocmd ColorScheme * highlight Normal ctermbg=none
" autocmd ColorScheme * highlight LineNr ctermbg=none

set background=dark
colorscheme onedark

" Popup menu
autocmd ColorScheme * highlight Pmenu ctermbg=darkgray ctermfg=lightblue
autocmd ColorScheme * highlight PmenuSel ctermbg=gray

"}}}

" deoplete ----------------------------------------------------------------{{{
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
    \ 'auto_complete_delay': 0,
    \ 'camel_case': v:true,
    \ 'refresh_always': v:false,
    \ 'smart_case': v:true,
    \ 'max_list': 20
\ })

"}}}

" Lightline  --------------------------------------------------------------{{{
" (ref statico/dotfiles/.vim/vimrc)
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

" LanguageClient-neovim ---------------------------------------------------{{{
let g:LanguageClient_serverCommands = {
    \'c': ['clangd', '-compile-commands-dir=' . getcwd()],
    \'cpp': ['clangd', '-compile-commands-dir=' . getcwd()],
    \'python': ['pyls'],
    \'javascript': ['javascript-typescript-stdio'],
    \'typescript': ['javascript-typescript-stdio'],
\}
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 1

nnoremap [LSP] <Nop>
nmap <C-x> [LSP]
nmap [LSP]<C-d> :call LanguageClient#textDocument_definition()<CR>
nmap [LSP]<C-r> :call LanguageClient#textDocument_rename()<CR>
nmap [LSP]<C-f> :call LanguageClient#textDocument_formatting()<CR>
nmap [LSP]<C-t> :call LanguageClient#textDocument_typeDefinition()<CR>
nmap [LSP]<C-x> :call LanguageClient#textDocument_references()<CR>
nmap [LSP]<C-a> :call LanguageClient_workspace_applyEdit()<CR>
nmap [LSP]<C-c> :call LanguageClient#textDocument_completion()<CR>
nmap [LSP]<C-h> :call LanguageClient#textDocument_hover()<CR>
nmap [LSP]<C-s> :call LanguageClient_textDocument_documentSymbol()<CR>
nmap [LSP]<C-m> :call LanguageClient_contextMenu()<CR>

augroup LCHighlight
    autocmd!
    autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp call LanguageClient#textDocument_documentHighlight()
augroup END

"}}}

" vim: set fdl=0 fdm=marker:
