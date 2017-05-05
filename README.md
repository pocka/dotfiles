# dotfiles

My dotfiles.

+ vim
+ zsh
+ ls (modify output color to monokai-like style)
+ Terminal fonts (RictyDiminished)

## Requirements

+ `git` works
+ `make` works (tested on GNU Make)
+ `dircolors` works
+ `docker` works


## Install

Clone the repositry, then `make`.
It will create symbolic link that indicates cloned repositry.

```shell
git clone https://github.com/pocka/dotfiles
cd dotfiles
make && make install
```


## Notes

### Install vim plugins

Since this uses [pathogen](https://github.com/tpope/vim-pathogen), add plugin repositry as git submodule.

```shell
cd .vim/bundle
git submodule add <repositry url>
```

### Install fonts

Put fonts into `src/fonts` or type below command

```shell
cd src/fonts
git add submodule add <fonts repositry url>
```

Then, `make` on the project root.

Make rule will patch fonts with powerline icons.

## Limitations

### Terminal color

This zsh prompt configuration heavily uses ansi 256 colors.
(Not works on non-256 color terminal. e.g. console)


## Screenshot

### vim
![ss-vim](https://github.com/pocka/dotfiles/blob/master/screenshots/vim.png?raw=true)

### zsh
![ss-zsh](https://github.com/pocka/dotfiles/blob/master/screenshots/zsh.png?raw=true)
