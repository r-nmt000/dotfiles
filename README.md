dotfiles
========

Personal dotfiles for macOS development environment, managed with [chezmoi](https://www.chezmoi.io/).

## What's inside

| Tool | Source path |
|------|-------------|
| zsh | `dot_zshrc`, `dot_zsh/` |
| git | `dot_gitconfig` |
| tmux | `dot_tmux.conf` |
| ideavim | `dot_ideavimrc` |
| neovim (LazyVim) | `dot_config/nvim/` |
| zed | `dot_config/zed/` |
| karabiner | `dot_config/karabiner/` (ignored — managed locally) |

In chezmoi convention, `dot_<name>` in the source becomes `~/.<name>` after `chezmoi apply`. See [chezmoi reference](https://www.chezmoi.io/reference/source-state-attributes/) for the full naming rules.

## Setup on a new machine

```sh
# Required runtime dependencies (sourced by dot_zshrc / starship)
brew install chezmoi antidote starship

# Apply the dotfiles
chezmoi init --apply git@github-personal:r-nmt000/dotfiles.git
```

`chezmoi init --apply` clones the repo to `~/.local/share/chezmoi` (or your configured `sourceDir`) and copies every managed file into `$HOME`. Without `antidote` and `starship` installed first, the new shell will print "command not found" on startup.

### Optional runtime dependencies

These are referenced from `dot_zshrc` but each block is guarded with a presence check, so you can install them lazily as needed:

- `pyenv` — Python version manager
- `nvm` — Node version manager (auto-added to `dot_zshrc` by the nvm installer)
- `autojump` — `j <substring>` shortcut

If you want chezmoi to use this repo at a custom path (as on this machine, `~/repos/dotfiles`), drop a config file:

```toml
# ~/.config/chezmoi/chezmoi.toml
sourceDir = "~/repos/dotfiles"
```

## Daily operations

```sh
chezmoi diff              # preview pending changes
chezmoi apply             # apply source state to $HOME
chezmoi edit ~/.zshrc     # edit a managed file (opens source, then re-applies)
chezmoi status            # show drift between source and target
chezmoi cd                # cd into the source directory
chezmoi update            # git pull + apply in one shot
```

## Notes

- chezmoi places **real files**, not symlinks. Edit through `chezmoi edit` (not the target file directly), or edit the source under `dot_*` and run `chezmoi apply`.
- `.chezmoiignore` controls what is *not* deployed. Patterns are matched against target paths (`~/`-relative).
- `lazy-lock.json` (Neovim), `prompts/` (Zed runtime DB), and the entire karabiner directory are ignored — these are either machine-local or auto-regenerated.
