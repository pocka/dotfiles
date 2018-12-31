# dotfiles

My dotfiles.

+ vim
+ zsh
+ ls (modify output color to monokai-like style)
+ Terminal fonts ([Cica](https://github.com/miiton/Cica))

## Requirements

+ `git` works
+ `make` works (tested on GNU Make)
+ `dircolors` works
+ `unzip`


## Install

Clone the repositry, then `make`.
It will create symbolic link that indicates cloned repositry.

```shell
git clone https://github.com/pocka/dotfiles
cd dotfiles
make && make install
```

Then set colors for your terminal emulator. Monokai recommended.
You can generate setup script with [terminal.sexy](https://terminal.sexy/).
If you're using Gnome Terminal, there is a script that sets monokai colors: `gnome-terminal-color.sh`.

```sh
PROFILE_NAME=your-profile-name PROFILE_SLUG=your-profile-id ./gnome-terminal-color.sh
```


## Notes

### Install vim plugins

Since this uses [pathogen](https://github.com/tpope/vim-pathogen), add plugin repositry as git submodule.

```shell
cd .vim/bundle
git submodule add <repositry url>
```

## Screenshot

### vim
![ss-vim](https://github.com/pocka/dotfiles/blob/master/screenshots/vim.png?raw=true)

### zsh
![ss-zsh](https://github.com/pocka/dotfiles/blob/master/screenshots/zsh.png?raw=true)
