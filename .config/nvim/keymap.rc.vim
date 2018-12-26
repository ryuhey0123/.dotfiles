" _  __ ________  _ _      ____  ____ 
"/ |/ //  __/\  \/// \__/|/  _ \/  __\
"|   / |  \   \  / | |\/||| / \||  \/|
"|   \ |  /_  / /  | |  ||| |-|||  __/
"\_|\_\\____\/_/   \_/  \|\_/ \|\_/   
"                                     

" General--------------------------------------------------------------------- 
inoremap <silent> jj <ESC>
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
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

nnoremap <silent> <F8> :source $HOME/.config/nvim/init.vim<CR> :nohlsearch<CR>


" Tab-------------------------------------------------------------------------
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


" Split-----------------------------------------------------------------------
"nnoremap <Space> <C-w>w
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" Plugin Toggle----------------------------------------------------------------
nnoremap <silent> <F2> :NERDTreeToggle <bar> :TagbarToggle<CR>
nnoremap <silent> <F5> :QuickRun<CR>

