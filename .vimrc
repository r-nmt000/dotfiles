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
"highlight CursorLine term=NONE cterm=NONE ctermfg=NONE ctermbg=darkgrey "hightlight current line by color
set laststatus=2
set statusline=%F%r%h%=

set wildmenu wildmode=list:full "completion in command line mode

autocmd ColorScheme * highlight CursorLine ctermbg=238
autocmd ColorScheme * highlight Comment ctermfg=245
autocmd ColorScheme * highlight LineNr ctermfg=245
autocmd ColorScheme * highlight Visual ctermbg=239
autocmd ColorScheme * highlight Normal ctermbg=0
 "#####search settings##### "hightlight current line by color
set ignorecase "ignore upper or lower case
set smartcase "if search query includes upper case, search only words which include upper case
set wrapscan "when search ends, go back to search top
set incsearch "set incremental search
set hlsearch "highlight search query

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

"###neobundle setting###
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
:
filetype plugin indent on     " required!
filetype indent on
syntax on
