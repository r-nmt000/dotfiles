dotfiles
========

Personal dotfiles for macOS development environment.

## What's inside

| Tool | Path |
|------|------|
| zsh | `.zshrc`, `.zsh/` |
| git | `.gitconfig` |
| tmux | `.tmux.conf` |
| ideavim | `.ideavimrc` |
| neovim (LazyVim) | `.config/nvim/` |
| zed | `.config/zed/` |
| karabiner | `.config/karabiner/` |

`.config/` 配下はサブディレクトリ単位で `~/.config/<tool>/` に symlink される。新しいツールを追加するときは `.config/<tool>/` を置けば `make config` で自動的にリンクされる。

## Requirements

- `zsh` 5.0+
- `git` 2.2+
- `neovim` 0.10+ (LazyVim 想定)
- `zplug` 2.1.0+
- `awk` (NOT mawk)

## Installation

```sh
# 個人用 SSH ホスト別名 github-personal をセットアップ済みの前提
git clone git@github-personal:r-nmt000/dotfiles.git
cd dotfiles
make
```

`make` は `make all` と同じで、`zsh / config / git / tmux / ideavim / xkb / link-shellscript` をすべて実行する。

特定のツールだけ更新したいときは個別ターゲットを：

```sh
make config       # .config/* のみリンク
make zsh          # zsh 設定のみ
make git          # gitconfig のみ
```

## Notes

- `~/.config/<tool>/` に既に実ディレクトリが存在する場合、`make config` は安全のためスキップする（既存設定の上書き防止）。新規端末以外で適用したいときは、`~/.config/<tool>/` を退避してから `make config` を再実行する。
- `lazy-lock.json`（Neovim）や Zed の `prompts/` などの自動生成ファイルは `.gitignore` で除外している。
