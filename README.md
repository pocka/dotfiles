# dotfiles

## Vim

### Plugins

#### Install

```shell
cd .vim/bundle
git submodule add <repositry url>
```

## Terminal font

This zsh and vim config depends on powerline font.
Please install it before using this config.

### Install

```shell
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline/tree/master/vim-powerline-fontpatched
cp RictyDiminished-for-Powerline/powerline-fontpatched /usr/share/fonts/RictyDiminished-for-Powerline
fc-scan /usr/share/fonts/RictyDiminished-for-Powerline
```

## Terminal color

This zsh prompt uses ansi 256 colors.
(Not works on non-256 color terminal. e.g. console)

## Screenshot

### vim
![ss-vim](https://github.com/pocka/dotfiles/blob/master/screenshots/vim.png?raw=true)

### zsh
![ss-zsh](https://github.com/pocka/dotfiles/blob/master/screenshots/zsh.png?raw=true)
