set runtimepath+=~/.vim/
runtime! vimrc/*.vim
set number "show line numbers
set title "show the file name you are editing
set showmatch "highlight a corespond pair of bracket

syntax on "color code
set tabstop=2 "2 spaces for indent
set shiftwidth=2 "insert 2 spaces when you start a new line
set smartindent "indent automatically
set cursorline "highlight current line
"highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
"highlight CursorLine term=NONE cterm=NONE ctermfg=NONE ctermbg=darkgrey "hightlight current line by color
set laststatus=2
set statusline=%F%r%h%=

set wildmenu wildmode=list:full "completion in command line mode

 "#####search settings##### "hightlight current line by color
set ignorecase "ignore upper or lower case
set smartcase "if search query includes upper case, search only words which include upper case
set wrapscan "when search ends, go back to search top
set incsearch "set incremental search
set hlsearch "highlight search query


