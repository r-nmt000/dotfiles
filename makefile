DOT_FILES = .zshrc .vimrc .vrapperrc .vim .zsh

.PHONY: all clean
all: zsh vim vrapper submodule vimproc

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

vrapper: $(foreach f, $(filter .vrapper%, $(DOT_FILES)), link-dot-file-$(f))

submodule: get-modules

vimproc: make-vimproc

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

make-vimproc:
	@echo "make vimproc"
