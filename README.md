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

### 3. Install Vim Plugins

```
vim .vim/vimrc/neobundle.vim

:NeoBundleInstall
```

**Done!!**

### 4. Setup iTerm2

1. Open iTerm2 Preferences
2. Open Profiles tab
3. Press + button and create new config
4. Select `Window`
  - Tweek `Transparency`
5. Select `Colors`
  - Go [this page](https://gist.github.com/luan/6362811) and download color scheme
  - Import it


