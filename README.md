dotfiles
========

my dotfiles.

##Getting started
### 1. Install git, vim, zsh
If you are using CentOS

```
sudo yum update
yum install zsh
yum install vim 
yum install git
```

### 2. Clone this repository

```
git clone https://github.com/r-nmt000/dotfiles.git
```

### 3. Execute make command

```
make
```

### 4. Execute make command in vimproc dir

* vimproc needs to be maked

### 5. Install Vim Plugins

```
vim .vim/vimrc/neobundle.vim

:NeoBundleInstall
```

**Done!!**


##ATTENTION

* Make sure import eclipse_keybinds.epf manually.
* If you can't install jedi-vim with `NeoBundleInstall`, try following steps

1. install jedi-vim manually

```
cd .vim/bundle
git clone https://github.com/davidhalter/jedi-vim.git
cd jedi-vim
git submodule update --init
```

1. try 'NeoBundleUpdate'

```
vim .vim/vimrc/neobundle.vim

:NeoBundleUpdate
```
1. check jedi-vim works or not

```
:h jedi
```

if jedi-vim is working, help for jedi-vim will show up

