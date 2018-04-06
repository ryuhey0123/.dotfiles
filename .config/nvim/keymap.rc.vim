" Keymap
inoremap jj <ESC>
nnoremap ; :
noremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>

" Auto bracket
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<Left>
inoremap (<Enter> ()<Left><CR><Esc><S-o>
inoremap < <><Left>
inoremap [ []<Left>

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]n :tablast <bar> tabnew<CR>
" tn 新しいタブを一番右に作る
map <silent> [Tag]q :tabclose<CR>
" tq タブを閉じる
map <silent> [Tag]l :tabnext<CR>
" tl 次のタブ
map <silent> [Tag]h :tabprevious<CR>
" th 前のタブ

