#!/bin/sh

DOTDIR=~/.dotfiles

if [ ! -d "$DOTDIR" ]; then
	git clone --recursive "https://github.com/pocka/dotfiles.git" "$DOTDIR"
fi

cd "$DOTDIR"

make
