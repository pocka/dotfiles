.SUFFIXES:

CURRENT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

IGNORES := .git .DS_Store .gitignore .gitmodules %.swp

DOTFILES := $(filter-out $(IGNORES), $(wildcard .??*))


.PHONY: all
all: install

.PHONY: install
install: deploy update

.PHONY: deploy
deploy: .zsh/ls_colors.zsh
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

.PHONY: update
update:
	git submodule update --init

.PHONY: clean
clean:
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

.zsh/ls_colors.zsh: src/dircolors
	@echo '# This file was generated by dircolors from src/dircolors. Do not edit this file directly!!' > $@
	dircolors $< >> $@
