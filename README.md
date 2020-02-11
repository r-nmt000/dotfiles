dotfiles
========

You can install and build your favarite tools easily.

This dotfiles consists of below configurations.

* zsh
* neovim
* tmux
* ideavim
* xkb
  * Linux keybind config

## Requirements
* `zsh`:  v5.0+
  * `autojump`
* `git`:  v2.2+
* `neovim`:  v0.3+
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
vim somefile

:call dein#update()
```

### 4. Setup Terminal

1. Open Preferences
2. Open Profiles tab
3. Press geer icon and load config
  - Go [this page](https://gist.github.com/luan/6362811) and download color scheme
  - Import it
4. Select `Color and effect` under background
  - Tweek `Transparency`
  - Tweek `Blur`

**Done!!**
