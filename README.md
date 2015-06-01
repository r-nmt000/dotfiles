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
//change login shell to zsh
usermod -s /bin/zsh root
usermod -s /bin/zsh username
```
you may needs to build the newer vim and git

####1.1 Install newer git
```
sudo yum remove git
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
wget https://www.kernel.org/pub/software/scm/git/git-2.2.0.tar.gz
tar -zxf git-2.2.0.tar.gz
cd git-2.2.0
make prefix=/usr/local all
make prefix=/usr/local install
```

####1.2 Install newer vim

```
sudo yum remove vim
cd /usr/local/src
sudo git clone https://github.com/vim/vim.git
cd vim
sudo yum install ncurses-devel gtk2-devel atk-devel libX11-devel libXt-devel lua-devel
sudo ./configure --enable-multibyte --with-features=huge --enable-cscope --enable-gui=gtk2 \
--disable-selinux --prefix=/usr/local \
--enable-xim --enable-fontset \
--enable-gpm \
--enable-rubyinterp \
--with-python-config-dir=/usr/lib/python2.6/config \
--enable-luainterp=yes --with-lua-prefix=/usr
sudo make && sudo make install
```


### 2. Clone this repository

```
git clone https://github.com/r-nmt000/dotfiles.git
```

### 3. Execute make command

```
cd dotfiles
make
```

### 4. Execute make command in vimproc dir

```
cd .vim/bundle/vimproc
make
```

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

2. try 'NeoBundleUpdate'

```
vim .vim/vimrc/neobundle.vim

:NeoBundleUpdate
```
3. check jedi-vim works or not

```
:h jedi
```

if jedi-vim is working, help for jedi-vim will show up

