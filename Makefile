.SUFFIXES:

CURRENT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

IGNORES := .git .DS_Store .gitignore .gitmodules

DOTFILES := $(filter-out $(IGNORES), $(wildcard .??*))


.PHONY: all
all: install

.PHONY: install
install: deploy init

.PHONY: deploy
deploy: .zsh/ls_colors.zsh
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

.PHONY: init
init:
	git submodule update --init

.PHONY: clean
clean:
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

.zsh/ls_colors.zsh: src/dircolors
	dircolors $< > $@
