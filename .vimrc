set number "show line numbers
set title "show the file name you are editing
set showmatch "highlight a corespond pair of bracket

colorscheme hybrid 
syntax on "color code
set tabstop=2 "2 spaces for indent
set shiftwidth=2 "insert 2 spaces when you start a new line
set smartindent "indent automatically
set cursorline "highlight current line
"highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=black "hightlight current line by color
set laststatus=2
set statusline=%F%r%h%=
 "hightlight current line by color
"#####search settings##### "hightlight current line by color
set ignorecase "ignore upper or lower case
set smartcase "if search query includes upper case, search only words which include upper case
set wrapscan "when search ends, go back to search top

"#####Keybinds#####
"change insert mode to normal mode with Ctrl+j
inoremap <C-j> <ESC>
"move cursor on logical line basis
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"centering next search result by n, N
nnoremap n nzz
nnoremap N Nzz

"easy to enter command mode
nnoremap ; :
nnoremap : ;


"####vundle settings####
set nocompatible "turn off compatibility with vi
filetype off "turn off file type estimation
"initialize vundle and manage vundle with itself
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"original repos on github

"vim-scripts repos

"non github repos

filetype plugin indent on "turn on file type estimation
