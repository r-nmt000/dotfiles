"###neobundle setting###
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
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
NeoBundle 'gist:r-nmt000/8648309', {
       \ 'name': 'markdown-cheatsheet',
       \ 'script_type': 'doc'}
:
filetype plugin indent on     " required!
filetype indent on
syntax on


nnoremap <silent> <C-f> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
