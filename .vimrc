"###Interface###
set runtimepath+=~/.vim/
runtime! vimrc/*.vim
set number "show line numbers
set title "show the file name you are editing
set showmatch "highlight a corespond pair of bracket
set statusline=%F%r%h%=
set cursorline "highlight current line
syntax on "color code


scriptencoding utf-8
set encoding=utf-8
set expandtab "convert tab to space
set tabstop=2 "2 spaces for indent
set softtabstop=2 "2 spaces when tab is inputed
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

"save the last cursor position before file closed
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
  augroup END
endif

"####search settings#### 
set ignorecase "ignore upper or lower case
set smartcase "if search query includes upper case, search only words which include upper case
set wrapscan "when search ends, go back to search top
set incsearch "set incremental search
set hlsearch "highlight search query

"###visualize tab and space###
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
" set listchars=trail:-,nbsp:%

