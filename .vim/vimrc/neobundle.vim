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
NeoBundle 'Shougo/vimshell'
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
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'sudo.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'stephpy/vim-yaml'
NeoBundleLazy 'majutsushi/tagbar', {
      \ "autload": {
      \   "commands": ["TagbarToggle"],
      \ },
      \ "build": {
      \   "mac": "brew install ctags",
      \ }}
nmap <Space>t :TagbarToggle<CR>
"""""""""""
" Python  "
"""""""""""
" For reading Django with Vim properly
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
" For managing virtualenv with Vim properly
NeoBundleLazy "jmcantrell/vim-virtualenv", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}


" others
NeoBundle 'gist:r-nmt000/8648309', {
       \ 'name': 'markdown-cheatsheet',
       \ 'script_type': 'doc'}
:
filetype plugin indent on     " required!
filetype indent on
syntax on


nnoremap <silent> <C-f> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
