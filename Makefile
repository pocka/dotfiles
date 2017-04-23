.SUFFIXES:

CURRENT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

IGNORES := .git .DS_Store .gitignore .gitmodules

DOTFILES := $(filter-out $(IGNORES), $(wildcard .??*))


all: install

install: deploy init
	@exec $$SHELL

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	git submodule update --init

clean:
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
