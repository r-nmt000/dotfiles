dotfiles
========

Personal macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's managed

| Tool | Source path | Notes |
|------|-------------|-------|
| zsh | `dot_zshrc`, `dot_zsh/` | plugin manager: antidote; prompt: starship |
| git | `dot_gitconfig` | |
| tmux | `dot_tmux.conf` | |
| ideavim | `dot_ideavimrc` | |
| neovim | `dot_config/nvim/` | LazyVim layout (init.lua + lua/) |
| zed | `dot_config/zed/` | settings.json, keymap.json |
| starship | `dot_config/starship.toml` | shell prompt config |
| karabiner | `dot_config/karabiner/assets/complex_modifications/` | only hand-authored presets; karabiner.json is machine-local |

In chezmoi convention, `dot_<name>` in the source maps to `~/.<name>` after `chezmoi apply`. See the [chezmoi reference](https://www.chezmoi.io/reference/source-state-attributes/) for the full naming rules.

---

## Setup on a new machine

### 1. Prerequisites

Install Homebrew first if it isn't already on the machine:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install the **required runtime dependencies** — without these, the new shell will print "command not found" on startup:

```sh
brew install chezmoi antidote starship
```

### 2. SSH access to this repo

This repo lives on the personal GitHub account `r-nmt000`. The local SSH config uses the host alias `github-personal` so it can coexist with another GitHub account on the same machine:

```sshconfig
# ~/.ssh/config
Host github-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_personal
  IdentitiesOnly yes
```

The matching public key must be registered to the `r-nmt000` GitHub account. If this is a brand-new machine, generate a fresh key and add it:

```sh
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_personal -C "<your email>"
gh auth login                                              # sign in as r-nmt000
gh ssh-key add ~/.ssh/id_ed25519_personal.pub --title "$(hostname)"
```

### 3. Optional: pin the chezmoi source dir

By default chezmoi clones into `~/.local/share/chezmoi`. If you want the working copy somewhere else (this machine uses `~/repos/dotfiles`), pre-create the chezmoi config:

```sh
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml <<'EOF'
sourceDir = "~/repos/dotfiles"
EOF
```

### 4. Initialize and apply

```sh
chezmoi init --apply git@github-personal:r-nmt000/dotfiles.git
```

`init --apply` clones the repo and copies every managed file into `$HOME`. After it finishes, open a fresh shell to load the new zshrc.

### 5. Per-tool follow-ups

- **Karabiner-Elements** — install via `brew install --cask karabiner-elements`, then in the GUI go to **Complex Modifications → Add rule** and enable the presets that were dropped into `~/.config/karabiner/assets/complex_modifications/`. `karabiner.json` itself is machine-local and not synced.
- **Neovim** — install via `brew install neovim`. On first launch LazyVim will sync plugins; `lazy-lock.json` is gitignored so each machine resolves its own versions.
- **Zed** — install Zed; it will pick up `~/.config/zed/settings.json` and `keymap.json` automatically.

### 6. Optional dependencies

These are referenced from `dot_zshrc` but each block is guarded with a presence check, so install lazily when needed:

- `nvm` — Node version manager (the official installer auto-appends its init lines to `dot_zshrc`)
- `autojump` — `j <substring>` shortcut (`brew install autojump`)

---

## Daily operations

```sh
chezmoi diff              # preview pending changes
chezmoi apply             # apply source state to $HOME
chezmoi status            # show drift between source and target
chezmoi edit ~/.zshrc     # edit a managed file (edits the source, then re-applies)
chezmoi re-add ~/.foo     # capture a target-side change back into the source
chezmoi cd                # cd into the source directory
chezmoi update            # git pull + apply in one shot
```

After editing files directly in the source dir (`chezmoi cd`), run `chezmoi apply` to deploy.

## How chezmoi behaves here

- **chezmoi writes real files, not symlinks.** Edit via `chezmoi edit` or in the source dir; do not edit the target file directly unless you plan to follow up with `chezmoi re-add`.
- **`.chezmoiignore` patterns are matched against target paths** (relative to `$HOME`), not source paths.
- **What's intentionally not synced:**
  - `lazy-lock.json` (Neovim plugin lockfile — regenerated locally)
  - `dot_config/zed/prompts/` (LMDB binary store the Zed app rewrites at runtime)
  - `dot_config/karabiner/karabiner.json`, `automatic_backups/`, `system_default_profile.json` (Karabiner rewrites these on every GUI tweak and they include per-machine HID device IDs)
  - `README.md`, `vichrome_keymappings.txt` (repo-only files)
