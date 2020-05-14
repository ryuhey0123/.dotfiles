
" /$$   /$$ /$$$$$$$$ /$$     /$$ /$$      /$$  /$$$$$$  /$$$$$$$ 
" | $$  /$$/| $$_____/|  $$   /$$/| $$$    /$$$ /$$__  $$| $$__  $$
" | $$ /$$/ | $$       \  $$ /$$/ | $$$$  /$$$$| $$  \ $$| $$  \ $$
" | $$$$$/  | $$$$$     \  $$$$/  | $$ $$/$$ $$| $$$$$$$$| $$$$$$$/
" | $$  $$  | $$__/      \  $$/   | $$  $$$| $$| $$__  $$| $$____/ 
" | $$\  $$ | $$          | $$    | $$\  $ | $$| $$  | $$| $$      
" | $$ \  $$| $$$$$$$$    | $$    | $$ \/  | $$| $$  | $$| $$      
" |__/  \__/|________/    |__/    |__/     |__/|__/  |__/|__/      


" General ---------------------------------------------------------------------

inoremap jj <ESC>
inoremap っj <esc>
nnoremap ; :
noremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" Tab -------------------------------------------------------------------------
" Prefix
nnoremap [Tag] <Nop>
nmap t [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tag]n :tablast <bar> tabnew<CR>
map <silent> [Tag]q :tabclose<CR>
map <silent> [Tag]l :tabnext<CR>
map <silent> [Tag]h :tabprevious<CR>

" Split -----------------------------------------------------------------------
nnoremap <Space> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

" Spell check -----------------------------------------------------------------
nnoremap <F8> :<C-u>setlocal spell!<CR>

" Emacs like Insert Mode ------------------------------------------------------
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-e> <End>

" Emacs like Command line -----------------------------------------------------
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>

" Folds toggle ----------------------------------------------------------------
nnoremap <space> za
vnoremap <space> zf

