"### SET UP FOR DEAIN ###
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

"### LOAD dein configs
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Toml file that includes plugins
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " Load and cache toml files
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " End configuration
  call dein#end()
  call dein#save_state()
endif

" If there are some uninstalled plugins, start install
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"###Interface###
set runtimepath+=~/.vim/
runtime! vimrc/*.vim
set number "show line numbers
set title "show the file name you are editing
set showmatch "highlight a corespond pair of bracket
set statusline=%F%r%h%=
" set cursorline "highlight current line
syntax on "color code


scriptencoding utf-8
set encoding=utf-8
set expandtab "convert tab to space
set tabstop=4 "4 spaces for indent
set softtabstop=4 "4 spaces when tab is inputed
set shiftwidth=4 "insert 4 spaces when you start a new line
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

