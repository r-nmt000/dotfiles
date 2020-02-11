"#####Keybinds#####
"bind esc to easy keybind
inoremap <C-j> <ESC>
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
"search with regular expression
nmap / /\v
"go to the first non-blank character in line 
nnoremap 0 ^
"go to the end of line
nnoremap ] $

"#################
"##   window    ##
"#################

"split window
nnoremap ss <C-w>s
nnoremap sv <C-w>v
"delete window
nnoremap sx <C-w>c
"move between windows 
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
"move windows 
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sW <C-w>W
"change window size
nnoremap s= <C-w>=
call submode#enter_with('windowsize', 'n', '', 's>', '<C-w>>')
call submode#enter_with('windowsize', 'n', '', 's<', '<C-w><')
call submode#enter_with('windowsize', 'n', '', 's+', '<C-w>+')
call submode#enter_with('windowsize', 'n', '', 's-', '<C-w>-')
call submode#map('windowsize', 'n', '', '>', '<C-w>>')
call submode#map('windowsize', 'n', '', '<', '<C-w><')
call submode#map('windowsize', 'n', '', '+', '<C-w>+')
call submode#map('windowsize', 'n', '', '-', '<C-w>-')
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


" 新しいタブを一番右に作る
nnoremap <silent> tn :tablast <bar> tabnew<CR>
" タブを閉じる
nnoremap <silent> tx :tabclose<CR>

call submode#enter_with('tabmove', 'n', '', 'tp', 'gt')
call submode#enter_with('tabmove', 'n', '', 'th', 'gT')
call submode#map('tabmove', 'n', '', 'l', 'gt')
call submode#map('tabmove', 'n', '', 'h', 'gT')
