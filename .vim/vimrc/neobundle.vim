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
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
:
filetype plugin indent on     " required!
filetype indent on
syntax on


nnoremap <silent> <C-f> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
