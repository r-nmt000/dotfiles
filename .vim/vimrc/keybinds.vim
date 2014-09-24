"#####Keybinds#####
"move cursor on logical line basis
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"smooth scroll
noremap <C-u> <C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y>
noremap <C-d> <C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e>
"centering next search result by n, N
nnoremap n nzz
nnoremap N Nzz
"cut, yank, delete a word
nnoremap vx vawxh 
nnoremap yw yiw 
nnoremap dw diw
nnoremap cw ciw

"go to the first non-blank character in line 
nnoremap 0 ^
"exchange ; and :
nnoremap ; :
nnoremap : ;
"easy Esc
imap <C-j> <Esc>
"move to other windows
nnoremap , <C-w>h
nnoremap . <C-w>l

"#################
"##     tab     ##
"#################

"Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2  "常にタブラインを表示

" The prefix key.
nnoremap    [Tab] <Nop>
nmap        t [Tab]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
" t1で1番左のタブ、t2で1番左から2番目のタブにジャンプ

" tn 新しいタブを一番右に作る
nnoremap <silent> [Tab]n :tablast <bar> tabnew<CR>
" tx タブを閉じる
nnoremap <silent> [Tab]x :tabclose<CR>
" tl 次のタブ
nnoremap <silent> [Tab]l :tabnext<CR>
" th 前のタブ
nnoremap <silent> [Tab]h :tabprevious<CR>
