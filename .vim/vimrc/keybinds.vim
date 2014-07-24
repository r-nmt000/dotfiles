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
"cut and yank a word
nnoremap vx vawxh 
nnoremap vy vawy
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
"tab
nnoremap [tab] <Nop>
nmap <Space>t [tab]
nnoremap <silent> [tab]n :tabf<Space>
nnoremap <silent> [tab]c :tabc<CR>
