"###neobundle setting###
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/NeoBundle.vim'
call neobundle#end()
endif
"""""""""""""
"   basic   "
"""""""""""""
" manage NeoBundle by itself
NeoBundleFetch 'Shougo/neobundle.vim'
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
NeoBundle 'Shougo/neomru.vim'
if has('lua') &&( (v:version >= 703 && has('patch885')) || v:version >= 704)
  NeoBundleLazy "Shougo/neocomplete.vim", {
    \ "autoload": {
    \   "insert": 1,
    \ }}
else
  NeoBundleLazy "Shougo/neocomplcache.vim", {
    \ "autoload": {
    \   "insert": 1,
    \ }}
  let g:neocomplcache_enable_at_startup = 1
  let s:hooks = neobundle#get_hooks("neocomplcache.vim")
  function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_smart_case = 1
    " NeoComplCacheEnable 
  endfunction
endif
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'thinca/vim-template'
NeoBundle 'vim-scripts/xptemplate'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'sudo.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-smartinput'

" others
NeoBundle 'gist:r-nmt000/8648309', {
  \ 'name': 'markdown-cheatsheet',
  \ 'script_type': 'doc'}
:
filetype plugin indent on     " required!
filetype indent on
syntax on


nnoremap <silent> <C-f> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
