DOT_FILES = .zshrc .vimrc .vrapperrc .vim .zsh .gitconfig .tmux.conf

.PHONY: all clean
all: zsh vim git vrapper tmux submodule

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f)) antigen

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

git: $(foreach f, $(filter .gitconfig, $(DOT_FILES)), link-dot-file-$(f))

vrapper: $(foreach f, $(filter .vrapper%, $(DOT_FILES)), link-dot-file-$(f))

tmux: $(foreach f, $(filter .tmux.conf, $(DOT_FILES)), link-dot-file-$(f))

submodule: get-modules


clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<

get-modules:
	@echo "install submodules"
	@git submodule init
	@git submodule update

antigen:
	@echo "mv my zsh prompt theme"
	@mv ./.zsh/mytheme.zsh-theme ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/themes/
	@echo "remove termsupport.zsh"
	@rm -f ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/lib/termsupport.zsh

