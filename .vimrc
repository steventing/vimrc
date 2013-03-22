"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                       " Get out of VI's compatible mode
"set autoindent                        " Copy indent from current line when starting a new line
set autoread                           " Set to auto read when a file is changed from the outside
"set bg=dark                           " Use {color} for the background
set enc=utf-8                          " Default encoding
set tenc=utf-8                         " Default term encoding
set fenc=utf-8                         " Default file encoding
"set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set fencs=utf-8,cp950,big5,euc-jp      " File encodings guess list
"set exrc                               " Include a .vimrc in the project's directory
"set secure                             " don't load other's .vimrc 之 autocmd
set showcmd                            " See partial commands as you type
set showmatch                          " Cursor shows matching ) and }
set showmode                           " Show current mode
set number                             " Show line number
"set backspace=2                       " Can use backspace
set history=500                        " Set how many lines of history VIM have to remember
set t_Co=256                           " Set number of colors
"set ruler                              " Show the cursor position all the time
"set wildchar=<TAB>                     " start wild expansion in the command line using <TAB>
set wildmenu                           " wild char completion menu"
"set smartcase                         " ignore case if search pattern is all lowercase,case-sensitive otherwise
"set smarttab                           " insert tabs on the start of a line according to context
set showfulltag                        " Show full completion tags
set laststatus=2                       " The last window will always have a status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Steven                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4
set noexpandtab
set shiftwidth=4
set hlsearch
set cursorline
set wrap
set fileformat=unix

set foldcolumn=1
set foldclose=
set foldmethod=manual
set foldnestmax=3
set foldlevel=0
set fillchars=vert:\|,fold:\
set foldminlines=1
set tags+=$HOME/tags

autocmd InsertLeave * hi CursorLine cterm=BOLD ctermfg=NONE   ctermbg=17
autocmd InsertEnter * hi CursorLine cterm=BOLD ctermfg=NONE   ctermbg=238
nnoremap <C-J> a<CR><Esc>k$
nnoremap <F8> :tabn<CR>
nnoremap <F7> :tabp<CR>
nmap <F2> :w<cr>
cmap <F2> <Esc> :w<CR>
imap <F2> <Esc> :w<CR>
vmap <F2> <Esc> :w<CR>
omap <F2> <Esc> :w<CR>

nmap <F3> :wq!<CR>
cmap <F3> <Esc> :wq!<CR>
imap <F3> <Esc> :wq!<CR>
vmap <F3> <Esc> :wq!<CR>
omap <F3> <Esc> :wq!<CR>

nmap <F4> :q!<CR>
cmap <F4> <Esc> :q!<CR>
imap <F4> <Esc> :q!<CR>
vmap <F4> <Esc> :q!<CR>
omap <F4> <Esc> :q!<CR>

nmap <F9> :!make<CR>
cmap <F9> <Esc> :!make<CR>
imap <F9> <Esc> :!make<CR>
vmap <F9> <Esc> :!make<CR>
omap <F9> <Esc> :!make<CR>

fu! ToggleFold()
	if foldlevel('.') == 0
		normal! l
	else
		if foldclosed('.') < 0
			.foldclose
		else
			.foldopen
		endif
	endif
	echo
endf

noremap <space> :call ToggleFold()<CR>

"function RemoveTrailingWhitespace()
	"if &ft != "diff"
		"let b:curcol = col(".")
		"let b:curline = line(".")
		"silent! %s/\s\+$//
		"silent! %s/\(\s*\n\)\+\%$//
		"call cursor(b:curline, b:curcol)
	"endif
"endfunction

"autocmd BufWritePre * call RemoveTrailingWhitespace()


"if has('cscope')
	"set cscopetag

	"if has('quickfix')
		"set cscopequickfix=s-,c-,d-,i-,t-,e-
	"endif

	"if filereadable("cscope.out")
		"cscope add cscope.out
	"endif

	"set cscopeverbose
"endif

func FormartSrc()
	exec "w"
	if &filetype == 'c' || &filetype == 'cpp'
		exec "!astyle %"
		exec "e! %"
	"elseif &filetype == 'cpp'
		"exec "!astyle --style=ansi --suffix=none %"
		"exec "e! %"
	"elseif &filetype == 'perl'
		"exec "!astyle --style=ansi --suffix=none %"
		"exec "e! %"
	"elseif &filetype == 'py'
		"exec "!astyle --style=ansi --suffix=none %"
		"exec "e! %"
	"elseif &filetype == 'java'
		"exec "!astyle --style=java --suffix=none %"
		"exec "e! %"
	"elseif &filetype == 'jsp'
		"exec "!astyle --style=ansi --suffix=none %"
		"exec "e! %"
	"elseif &filetype == 'xml'
		"exec "!astyle --style=ansi --suffix=none %"
		"exec "e! %"
	"elseif &filetype == 'html'
		"exec "!astyle --style=ansi --suffix=none %"
		"exec "e! %"
	"elseif &filetype == 'htm'
		"exec "!astyle --style=ansi --suffix=none %"
		"exec "e! %"
	endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme yzlin256
"colorscheme xorium
"colorscheme molokai
"colorscheme inkpot
"colorscheme zenburn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set map leader
let g:mapleader = ","

nmap <Leader>w :w!<CR>
nmap <Leader>q :q<CR>
nmap <Leader>p :set paste<CR>
nmap <Leader>c :!./configure<CR>
nmap <Leader>mw :set makeprg=wkmake<CR>
nmap <Leader>mn :set makeprg=make<CR>
nmap <Leader>fr :call FormartSrc()<CR>

" Only for C
set cscopetag
set cscopeverbose
nmap <F10> :!ctags -R --sort=yes --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
nmap <F11> :!find . -iname '*.[ch]' \| cscope -Rbq<CR>
"nmap <F10> :!ctags --languages=c -R --sort=yes --c-kinds=+lx --fields=+aS --extra=+q .<CR>
"nmap <F12> :!find . -iname '*.[ch]' \| cscope -Rbq<CR>
" For C++ and C
"nmap <F9> :!ctags --languages=c,c++ -R --sort=yes --c++-kinds=+plx --c-kinds=+plx --fields=+iaS --extra=+q .<CR>
"nmap <F12> :!find . -iname '*.[ch]' -or -iname '*.[ch]pp' \| cscope -Rbq<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xml_syntax_folding=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off				" Disable filetype detection, which vundle need
filetype indent on			" Enable filetype-specific indenting
filetype plugin on			" Enable filetype-specific plugins
"autocmd FileType c,cpp,cc,h	set cindent
"autocmd FileType c		set omnifunc=ccomplete#Complete

set nocindent
set noautoindent
set nocopyindent
set nosmartindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on				    " syntax highlight
set hlsearch				" search highlighting


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in configuration                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	""""""""""""""""""""""""""""""
	" vundle
	" Https://github.com/gmarik/vundle
	""""""""""""""""""""""""""""""
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	Bundle 'gmarik/vundle'

	""""""""""""""""""""""""""""""
	" tagbar
	" https://github.com/majutsushi/tagbar
	""""""""""""""""""""""""""""""
	Bundle 'majutsushi/tagbar'
	nmap <F6> :TagbarToggle<CR>
	" set focus to TagBar when opening it
	let g:tagbar_left = 1
	let g:tagbar_sort = 0
	let g:tagbar_width = 30

	""""""""""""""""""""""""""""""
	" nerdtree
	" https://github.com/scrooloose/nerdtree
	""""""""""""""""""""""""""""""
	Bundle 'scrooloose/nerdtree'
	nmap <F5> :NERDTreeToggle<CR>
	"let g:NERDTreeWinSize = 25

	""""""""""""""""""""""""""""""
	" vim-fugitive
	" https://github.com/tpope/vim-fugitive
	""""""""""""""""""""""""""""""
	Bundle 'tpope/vim-fugitive'
	nmap <Leader>gbl :Gblame<CR>
	nmap <Leader>gst :Gstatus<CR>
	nmap <Leader>glo :Glog<CR>

	""""""""""""""""""""""""""""""
	" gitv
	" https://github.com/gregsexton/gitv
	""""""""""""""""""""""""""""""
	"Bundle 'gregsexton/gitv'
	"nmap <F11> :Gitv!<CR>

	""""""""""""""""""""""""""""""
	" gundo
	" https://github.com/sjl/gundo.vim
	""""""""""""""""""""""""""""""
	"Bundle 'sjl/gundo.vim'
	"nmap <F9> :GundoToggle<CR>
	"let g:gundo_right = 1
	"let g:gundo_help = 0		" Set this to 0 to disable the help text in the Gundo graph window
	"let g:gundo_close_on_revert = 1	" Set this to 1 to automatically close the Gundo windows when reverting
	"let g:gundo_width = 25

	""""""""""""""""""""""""""""""
	" vim-powerline
	" https://github.com/Lokaltog/vim-powerline
	""""""""""""""""""""""""""""""
	Bundle 'Lokaltog/vim-powerline'
	let g:Powerline_symbols = 'fancy'
	let g:Powerline_symbols = 'unicode'

	""""""""""""""""""""""""""""""
	" vim-unimpaired
	" https://github.com/tpope/vim-unimpaired
	""""""""""""""""""""""""""""""
	"Bundle 'tpope/vim-unimpaired'

	""""""""""""""""""""""""""""""
	" CCTree
	" https://github.com/vim-scripts/CCTree
	""""""""""""""""""""""""""""""
	"Bundle 'CCTree'
	"nmap <F11> :CCTreeLoadDB<CR>
	"let g:CCTreeEnhancedSymbolProcessing=1
	"let g:CCTreeKeyHilightTree = '<C-\>l'

	Bundle 'ych/CCTree'
	nmap <F12> :CCTreeLoadDB<CR>
	"let g:CCTreeEnhancedSymbolProcessing=1
	"let g:CCTreeKeyHilightTree = '<C-\>l'
	let g:CCTreeOrientation = "rightbelow"

	""""""""""""""""""""""""""""
	" NERD commenter
	"""""""""""""""""""""""""""
	Bundle 'The-NERD-Commenter'
	Bundle 'gtk-vim-syntax'
