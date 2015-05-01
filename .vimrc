"おまじない
set nocompatible
set tags=~/.tags

"color
syntax on
au BufReadPost,BufNewFile *.t ,*.cgi :setl filetype=perl


nmap ,l :call PHPLint()<CR>
function PHPLint()
		let result = system( &ft . ' -l ' . bufname(""))
		echo result
endfunction

"タブ長
set ts=2
"標準文字コード
set encoding=utf-8
"標準改行コード
set fileformat=unix
"左から順に試してファイル開く
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,latin
"頭のいいインデント
set autoindent
set cindent
"モード表示
set showmode
"行番号表示
set number
"現在位置表示
set ruler

set nobk

set backspace=2

set formatoptions+=mM

set whichwrap=b,s,[,],<,>

set backspace=indent,eol,start

set ambiwidth=double

set wildmenu

filetype plugin indent on

set ignorecase
set smartcase

set wrapscan

set showmatch

set clipboard=unnamed

set	pastetoggle=<F12>

set incsearch

set hlsearch

set title

set cmdheight=2
set laststatus=2

set showcmd

set display=lastline

if has('multi_byte_ime')
		highlight Cursor guifg=NONE guibg=Green
		highlight CursorIM guifg=NONE guibg=Purple
endif


""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
		augroup InsertHook
				autocmd!
				autocmd InsertEnter * call s:StatusLine('Enter')
				autocmd InsertLeave * call s:StatusLine('Leave')
		augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
		if a:mode == 'Enter'
				silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
				silent exec g:hi_insert
		else
				highlight clear StatusLine
				silent exec s:slhlcmd
		endif
endfunction
function! s:GetHighlight(hi)
		redir => hl
		exec 'highlight '.a:hi
		redir END
		let hl = substitute(hl, '[\r\n]', '', 'g')
		let hl = substitute(hl, 'xxx', '', '')
		return hl
endfunction

if has('unix') && !has('gui_running')
		" ESC後にすぐ反映されない対策
		inoremap <silent> <ESC> <ESC>
endif


autocmd FileType php :set dictionary+=$HOME/.vim/dict/php.dict
autocmd FileType cgi :set dictionary+=$HOME/.vim/dict/perl_functions.dict
set complete+=k

augroup SkeletonAu
		autocmd!
		autocmd BufNewFile *.html 0r $HOME/.vim/templates/skel.html
		autocmd BufNewFile *.php  0r $HOME/.vim/templates/skel.html
augroup END



