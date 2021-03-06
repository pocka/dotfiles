set nocompatible
filetype on
filetype plugin indent on
syntax enable

set autoread


" ------------------------------------
" Pathogen settings

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()


" ------------------------------------
" NERDTree settings

let NERDTreeShowHidden=1

autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTreeCWD | endif

function! s:CloseIfOnlyControlWinLeft()
	if winnr("$") != 1
		return
	endif

	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1) || &buftype == 'quickfix'
		q
	endif
endfunction

augroup CloseIfOnlyControlWinLeft
	au!
	au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:NERDTreeIndicatorMapCustom = {
	\ "Modified": "!",
	\ "Staged": "@",
	\ "Untracked": "+",
	\ "Renamed": ">",
	\ "Unmerged": "=",
	\ "Deleted": "-",
	\ "Dirty": "+",
	\ "Unknown": "?"
	\ }

let g:NERDTreeIgnore = ['\~$', '\.swp$', '\.pyc$', '^__pycache__$']

" ------------------------------------
" Airline settings

let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\ue0b0"
let g:airline_right_sep = "\ue0b2"

set laststatus=2


" ------------------------------------
" Syntastic settings

let g:syntastic_typescript_checkers = ['tslint']
au BufNewFile,BufRead *.scala setf scala

" ------------------------------------
" Indent settings

set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
set number


" ------------------------------------
" Keymap settings

nnoremap <S-j> <S-l>
nnoremap <S-k> <S-h>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

imap <Nul> <Nop>
map <Nul> <Nop>
vmap <Nul> <Nop>
cmap <Nul> <Nop>
nmap <Nul> <Nop>

" ------------------------------------
" Let jsx syntax for .js files

let g:jsx_ext_required = 0


" ------------------------------------
" Colorscheme setting

colorscheme molokai

highlight Normal ctermbg = none
highlight Visual ctermbg = 8
highlight MatchParen cterm=none ctermbg=red ctermfg=white
