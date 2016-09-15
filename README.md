dotfiles
========

my dotfiles.

## Requirements
* `zsh`:  v5.0+
* `git`:  v2.2+
* `vim`:  v7.4+
* `zplug`: v2.1.0
* `awk`: An AWK variant that is **not** mawk

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


##ATTENTION

* Make sure import eclipse_keybinds.epf manually.
