"###Interface###
set runtimepath+=~/.vim/
runtime! vimrc/*.vim
set number "show line numbers
set title "show the file name you are editing
set showmatch "highlight a corespond pair of bracket
set statusline=%F%r%h%=
set cursorline "highlight current line
syntax on "color code


set tabstop=2 "2 spaces for indent
set shiftwidth=2
set shiftwidth=2 "insert 2 spaces when you start a new line
set smartindent "indent automatically
"highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
"highlight CursorLine term=NONE cterm=NONE ctermfg=NONE ctermbg=darkgrey "hightlight current line by color
set laststatus=2
set whichwrap=b,s,h,l,<,>,[,] "cursor doesn't stop at beginning and end of line
set wildmenu wildmode=list:full "completion in command line mode
source $VIMRUNTIME/macros/matchit.vim "extend a function for jumping paired parenthesis
let b:match_words = '<:>,<div.*>:</div>'
set formatoptions-=ro "invalidate auto commentout function when start a new line

"###custom cummand###
autocmd QuickFixCmdPost *grep* cwindow


"suffix asignment
" autocmd BufRead,BufNewFile *.mkd  setfiletype mkd
" autocmd BufRead,BufNewFile *.md  setfiletype mkd

" md as markdown, instead of modula2

"###backup###
set nobackup
set noswapfile

"####search settings#### 
set ignorecase "ignore upper or lower case
set smartcase "if search query includes upper case, search only words which include upper case
set wrapscan "when search ends, go back to search top
set incsearch "set incremental search
set hlsearch "highlight search query


