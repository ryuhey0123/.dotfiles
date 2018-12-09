" General--------------------------------------------------------------------- 
inoremap <silent> jj <ESC>:<C-u>w<CR>
nnoremap ; :
noremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

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


" Tab-------------------------------------------------------------------------
" Prefix
nnoremap [Tag] <Nop>
nmap t [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" tn 新しいタブを一番右に作る
map <silent> [Tag]n :tablast <bar> tabnew<CR>
" tq タブを閉じる
map <silent> [Tag]q :tabclose<CR>
" tl 次のタブ
map <silent> [Tag]l :tabnext<CR>
" th 前のタブ
map <silent> [Tag]h :tabprevious<CR>


" Split-----------------------------------------------------------------------
nnoremap <silent> <C-s><C-j> :split<CR>
nnoremap <silent> <C-s><C-l> :vsplit<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

