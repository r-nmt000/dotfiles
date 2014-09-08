"###neobundle setting###
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'thinca/vim-template'
NeoBundle 'dhalter/jedi-vim'
NeoBundle 'vim-scripts/xptemplate'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gist:r-nmt000/8648309', {
       \ 'name': 'markdown-cheatsheet',
       \ 'script_type': 'doc'}
:
filetype plugin indent on     " required!
filetype indent on
syntax on


nnoremap <silent> <C-f> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
