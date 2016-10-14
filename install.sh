#!/bin/sh

DOTDIR=~/.dotfiles

if [ ! -d "$DOTDIR" ]; then
	git clone "https://github.com/pocka/dotfiles.git" "$DOTDIR"
fi

cd "$DOTDIR"

make
