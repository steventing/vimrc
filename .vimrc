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
"set secure                             " don't load other's .vimrc  autocmd
set showcmd                            " See partial commands as you type
set showmatch                          " Cursor shows matching ) and }
set showmode                           " Show current mode
set number                             " Show line number
set backspace=2                       " Can use backspace
set history=500                        " Set how many lines of history VIM have to remember
set t_Co=256                           " Set number of colors
"set ruler                              " Show the cursor position all the time
"set wildchar=<TAB>                     " start wild expansion in the command line using <TAB>
set wildmenu                           " wild char completion menu"
"set smartcase                         " ignore case if search pattern is all lowercase,case-sensitive otherwise
"set smarttab                           " insert tabs on the start of a line according to context
set showfulltag                        " Show full completion tags
set laststatus=2                       " The last window will always have a status line
set incsearch



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Steven                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=8
set shiftwidth=8
set noexpandtab
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
set termencoding=utf-8
set grepprg=rg\ -tc\ -tmake\ -tsh\ -tpy\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au BufRead,BufNewFile *.py,*pyw,*.cpp set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.cpp set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.cpp set ts=4
au BufRead,BufNewFile *.py,*.pyw,*.cpp set sts=4

autocmd InsertLeave * hi CursorLine cterm=BOLD ctermfg=NONE   ctermbg=17
autocmd InsertEnter * hi CursorLine cterm=BOLD ctermfg=NONE   ctermbg=238
"nnoremap <C-N> a<CR><Esc>k$
"nnoremap <F8> :tabn<CR>
"nnoremap <F7> :tabp<CR>
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

autocmd BufRead *.py nmap <F9> :w !python %<CR>
autocmd BufRead *.sh nmap <F9> :w !sh %<CR>
autocmd FileType php noremap <F9> :w!<CR>:!/usr/bin/php %<CR>
autocmd FileType c map :!gcc --o "%:p:r.out" "%:p" %% "%:r.out"<CR>
autocmd BufRead,BufNewFile *.py vmap f :w !python <CR>
autocmd QuickFixCmdPost *grep* cwindow

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
nmap <Leader>b :bdelete<CR>
nmap <Leader>l :b#<CR>
"nmap <Leader>p :set paste<CR>
nmap <Leader>j :tabp<CR>
nmap <Leader>k :tabn<CR>
nmap <Leader>T :tabnew<CR>
"nmap <Leader>mn :set makeprg=make<CR>
nmap <Leader>fr :call FormartSrc()<CR>
nmap <Leader>p <C-W>gf<CR>
nmap <Leader>m :tabm<CR>

" Only for C
"set cscopetag
"set cscopeverbose
"set cscopeprg='gtags-cscope'
nmap <F8> :!ctags -R --sort=yes --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
nmap <F7> :!find . -iname '*.[ch]' \| cscope -Rbq<CR>
"nmap <F10> :!ctags --languages=c -R --sort=yes --c-kinds=+lx --fields=+aS --extra=+q .<CR>
"nmap <F12> :!find . -iname '*.[ch]' \| cscope -Rbq<CR>
" For C++ and C
"nmap <F9> :!ctags --languages=c,c++ -R --sort=yes --c++-kinds=+plx --c-kinds=+plx --fields=+iaS --extra=+q .<CR>
"nmap <F12> :!find . -iname '*.[ch]' -or -iname '*.[ch]pp' \| cscope -Rbq<CR>

"func GitGrep(...)
  "let save = &grepprg
  "set grepprg=git\ grep\ -n\ $*
  "let s = 'grep'
  "for i in a:000
	"let s = s . ' ' . i
  "endfor
  "exe s
  "let &grepprg = save
"endfun
"command -nargs=? G call GitGrep(<f-args>)
"nmap <Leader>gg :G

"func GitGrepWord()
  "normal! "zyiw
  "call GitGrep('-w -e ', getreg('z'))
"endf
"nmap <Leader>G :call GitGrepWord()<CR> :b#<CR>
"nmap <Leader>gg :G

"for vimgrep
"map <leader>gg :grep
map <leader>gg :Gtags
map <leader>G :execute "grep " . expand("<cword>") . " "<CR>
map <leader>s :execute "tab: cs f s " . expand("<cword>") <CR>
map <leader>t :execute "tab: cs f t " . expand("<cword>") <CR>
map <leader>h4 :execute "Highlight 4 " . expand("<cword>") <CR>
map <leader>h5 :execute "Highlight 5 " . expand("<cword>") <CR>
map <leader>h6 :execute "Highlight 6 " . expand("<cword>") <CR>
map <leader>h7 :execute "Highlight 7 " . expand("<cword>") <CR>
map <leader>hc4 :Hclear 4<CR>
map <leader>hc5 :Hclear 5<CR>
map <leader>hc6 :Hclear 6<CR>
map <leader>hc7 :Hclear 7<CR>
map <leader>hl  :match WhitespaceEOL /\s\+$/ <CR>
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
set hidden
map <C-j> 10j
map <C-k> 10k
map <C-h> 10h
map <C-l> 10l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on				    " syntax highlight
set hlsearch				" search highlighting
set cc=80
highlight ColorColumn ctermbg=236
highlight WhitespaceEOL ctermbg=red guibg=red
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:>-,trail:-
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in configuration                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	""""""""""""""""""""""""""""""
	" vundle
	" https://github.com/gmarik/vundle
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
	"Bundle 'Lokaltog/vim-powerline'
	"let g:Powerline_symbols = 'fancy'
	"let g:Powerline_symbols = 'unicode'
	Plugin 'tpope/vim-surround'
	let g:surround_113="#{\r}"     " v
	let g:surround_35="#{\r}"      " #
	let g:surround_45="<% \r %>"   " -
	let g:surround_61="<%= \r %>"  " =

	Plugin 'bling/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	let g:airline_powerline_fonts=1
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#buffer_nr_show=0
	let g:airline#extensions#tabline#buffer_nr_format='%s: '
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	"let g:airline_theme='powerlineish'
	let g:airline_theme='papercolor'
	"let g:airline_theme='bubblegum'
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	" unicode symbols
	"let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	"let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.linenr = '␊'
	"let g:airline_symbols.linenr = '␤'
	"let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	"let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'P'
	"let g:airline_symbols.paste = 'Þ'
	"let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'
	"let g:airline_symbols.whitespace = 'W'
	let g:airline_left_alt_sep = '«'
	let g:airline_right_alt_sep = '»'
	let g:airline_symbols.readonly = 'r'

	" airline symbols
	"let g:airline_left_sep = ''
	"let g:airline_left_alt_sep = ''
	"let g:airline_right_sep = ''
	"let g:airline_right_alt_sep = ''
	"let g:airline_symbols.branch = ''
	"let g:airline_symbols.readonly = ''
	"let g:airline_symbols.linenr = ''

	Plugin 'kien/ctrlp.vim'
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	  \ 'binary file': '\v\.(exe|so|dll)$',
	  \ }
	let g:ctrlp_working_path_mode=0
	let g:ctrlp_match_window_bottom=1
	let g:ctrlp_max_height=15
	let g:ctrlp_match_window_reversed=0
	let g:ctrlp_mruf_max=500
	let g:ctrlp_follow_symlinks=1


	""""""""""""""""""""""""""""""
	" vim gtags
	Plugin 'aceofall/gtags.vim'
	set cscopetag
	set cscopeprg='gtags-cscope'
	let GtagsCscope_Auto_Load = 1
	let GtagsCscope_Auto_Map = 1
	let GtagsCscope_Quiet = 1
	""""""""""""""""""""""""""""""
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

	"Bundle 'ych/CCTree'
	"nmap <F12> :CCTreeLoadDB<CR>
	"let g:CCTreeEnhancedSymbolProcessing=1
	"let g:CCTreeKeyHilightTree = '<C-\>l'
	"let g:CCTreeOrientation = "rightbelow"

	""""""""""""""""""""""""""""
	" NERD commenter
	"""""""""""""""""""""""""""
	Bundle 'The-NERD-Commenter'
	Bundle 'gtk-vim-syntax'
	Bundle 'rkulla/pydiction'
	let g:pydiction_location = '/home/steven/.vim/bundle/pydiction/complete-dict'
	"let g:pydiction_menu_height = 3
	Bundle 'Lokaltog/vim-easymotion'
	let g:EasyMotion_smartcase = 1
	let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
	map <Leader><leader>h <Plug>(easymotion-linebackward)
	map <Leader><Leader>j <Plug>(easymotion-j)
	map <Leader><Leader>k <Plug>(easymotion-k)
	map <Leader><leader>l <Plug>(easymotion-lineforward)
	" 重复上一次操作, 类似repeat插件, 很强大
	map <Leader><leader>. <Plug>(easymotion-repeat)

	Bundle 'terryma/vim-multiple-cursors'
	let g:multi_cursor_use_default_mapping=0
	"" Default mapping
	let g:multi_cursor_next_key='<C-n>'
	"let g:multi_cursor_prev_key='<C-l>'
	let g:multi_cursor_skip_key='<C-x>'
	let g:multi_cursor_quit_key='<Esc>'

