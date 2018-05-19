dotfiles
========

You can install and build your favarite tools easily.

This dotfiles consists of below configurations.

* zsh
* vim
* tmux
* ideavim
* xkb
  * Linux keybind config

## Requirements
* `zsh`:  v5.0+
  * `autojump`
* `git`:  v2.2+
* `vim`:  v7.4+
* `zplug`: v2.1.0+
* `awk`: **NOT** mawk

## Installation
### 1. Clone this repository

```
git clone https://github.com/r-nmt000/dotfiles.git
```

### 2. Execute make command

```
cd dotfiles
make
```

### 3. Execute make command in vimproc dir

```
cd .vim/bundle/vimproc
make
```

* vimproc needs to be maked

### 4. Install Vim Plugins

```
vim .vim/vimrc/neobundle.vim

:NeoBundleInstall
```

**Done!!**
