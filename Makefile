.SUFFIXES:

CURRENT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

IGNORES := .git .DS_Store .gitignore .gitmodules

DOTFILES := $(filter-out $(IGNORES), $(wildcard .??*))


all: install

install: pull deploy init
	@exec $$SHELL

pull:
	git pull origin master

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:

clean:
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
