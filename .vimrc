set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
set number

hi MatchParen ctermbg=1

nnoremap <S-j> <S-l>
nnoremap <S-k> <S-h>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <S-space> <Esc>
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

let NERDTreeShowHidden=1
autocmd VimEnter /* execute 'NERDTreeCWD'
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType.isTabFree()) | q | endif
function! s:CloseIfOnlyControlWinLeft()
	  if winnr("$") != 1
		      return
			    endif
				  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
					          \ || &buftype == 'quickfix'
					      q
						    endif
						endfunction
						augroup CloseIfOnlyControlWinLeft
							  au!
							    au BufEnter * call s:CloseIfOnlyControlWinLeft()
							augroup END


if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.dotfiles/.vim/neobundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" originalrepos on github

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'wting/rust.vim'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'othree/yajs.vim'
NeoBundle 'millermedeiros/vim-esformatter'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'tpope/vim-fugitive'

" Let jsx syntax for .js files
let g:jsx_ext_required = 0

call neobundle#end()

filetype plugin indent on

" Colorscheme setting
syntax enable
colorscheme molokai
highlight Normal ctermbg = none
highlight Visual ctermbg = 8
highlight MatchParen cterm=none ctermbg=red ctermfg=white

" Airline(statusline) setting

filetype on
au BufNewFile,BufRead *.rs set filetype=rust
au BufNewFile,BufRead *.wisp set filetype=clojure
