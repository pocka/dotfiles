# dotfiles

My dotfiles.

+ vim
+ zsh
+ ls (modify output color to monokai-like style)

## Requirements

+ `git` works
+ `make` works (tested on GNU Make)
+ `dircolors` works


### Terminal font

This zsh and vim config depends on powerline font.
Please install it before using this config.

```shell
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline/tree/master/vim-powerline-fontpatched
cp RictyDiminished-for-Powerline/powerline-fontpatched /usr/share/fonts/RictyDiminished-for-Powerline
fc-scan /usr/share/fonts/RictyDiminished-for-Powerline
```

## Install

Clone the repositry, then `make`.
It will create symbolic link that indicates cloned repositry.

```shell
git clone https://github.com/pocka/dotfiles
cd dotfiles
make
```


## Notes

### Install vim plugins

Since this uses [pathogen](https://github.com/tpope/vim-pathogen), add plugin repositry as git submodule.

```shell
cd .vim/bundle
git submodule add <repositry url>
```


## Limitations

### Terminal color

This zsh prompt configuration heavily uses ansi 256 colors.
(Not works on non-256 color terminal. e.g. console)


## Screenshot

### vim
![ss-vim](https://github.com/pocka/dotfiles/blob/master/screenshots/vim.png?raw=true)

### zsh
![ss-zsh](https://github.com/pocka/dotfiles/blob/master/screenshots/zsh.png?raw=true)
