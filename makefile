DOT_FILES = .zshrc .config .vim .zsh .gitconfig .tmux.conf .ideavimrc

.PHONY: all clean
all: zsh vim config git tmux ideavim xkb link-shellscript

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

config: $(foreach f, $(filter .config%, $(DOT_FILES)), link-dot-file-$(f))

git: $(foreach f, $(filter .gitconfig, $(DOT_FILES)), link-dot-file-$(f))

tmux: $(foreach f, $(filter .tmux.conf, $(DOT_FILES)), link-dot-file-$(f))

ideavim: $(foreach f, $(filter .ideavimrc, $(DOT_FILES)), link-dot-file-$(f))

xkb: $(foreach f, $(filter .xkb, $(DOT_FILES)), link-dot-file-$(f))

link-shellscript:
	@echo "Create symlink bin to /usr/local/bin"
	@./make_symlink.sh

clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<

