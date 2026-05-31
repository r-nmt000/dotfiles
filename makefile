DOT_FILES = .zshrc .zsh .gitconfig .tmux.conf .ideavimrc
CONFIG_DIRS = $(notdir $(wildcard .config/*))

.PHONY: all clean
all: zsh config git tmux ideavim link-shellscript

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

config: $(foreach d, $(CONFIG_DIRS), link-config-dir-$(d))

vim: config

git: $(foreach f, $(filter .gitconfig, $(DOT_FILES)), link-dot-file-$(f))

tmux: $(foreach f, $(filter .tmux.conf, $(DOT_FILES)), link-dot-file-$(f))

ideavim: $(foreach f, $(filter .ideavimrc, $(DOT_FILES)), link-dot-file-$(f))

link-shellscript:
	@echo "Create symlink bin to /usr/local/bin"
	@./make_symlink.sh

clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f)) $(foreach d, $(CONFIG_DIRS), unlink-config-dir-$(d))

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<

link-config-dir-%:
	@mkdir -p $(HOME)/.config
	@if [ -e $(HOME)/.config/$* ] && [ ! -L $(HOME)/.config/$* ]; then \
		echo "Skip $(HOME)/.config/$* (real directory exists — back up & remove it manually before linking)"; \
	else \
		echo "Create Symlink .config/$* => $(HOME)/.config/$*"; \
		ln -snf $(CURDIR)/.config/$* $(HOME)/.config/$*; \
	fi

unlink-config-dir-%:
	@echo "Remove Symlink $(HOME)/.config/$*"
	@$(RM) $(HOME)/.config/$*

