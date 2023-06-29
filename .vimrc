"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'vim-airline/vim-airline', { 'tag': 'v0.10' }
Plug 'vim-airline/vim-airline-themes'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'junegunn/gv.vim'
"Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'thaerkh/vim-workspace'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': 'v0.8.0'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdcommenter'
Plug 'chriskempson/base16-vim'
Plug 'will133/vim-dirdiff'
Plug 'google/vim-searchindex'
Plug 'ryanoasis/vim-devicons'
"Plug 'ronakg/quickr-preview.vim'
Plug 'mhinz/vim-signify'
Plug 'unblevable/quick-scope'
"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'm-pilia/vim-ccls'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'azabiong/vim-highlighter'
Plug 'voldikss/vim-floaterm'

"auto complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" git
"Plug 'lewis6991/gitsigns.nvim'


" Vim Script
call plug#end()

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
set splitright
set statusline+=%{get(b:,'gitsigns_status','')}

" How many tenths of a second to blink when matching brackets
set mat=2

" For regular expressions turn magic on
set magic

" Don't redraw while executing macros (good performance config)
set lazyredraw

" To allow X server clipboard
set clipboard+=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Steven                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set tabstop=8
"set shiftwidth=8
"set noexpandtab
set tabstop=4
set shiftwidth=4
set expandtab
set sts=4
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
"set grepprg=rg\ -tc\ -tmake\ -tsh\ -tpy\ -th\ --vimgrep\ $*
set grepprg=rg\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au BufRead,BufNewFile *.py,*pyw,*.cpp set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.cpp set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.cpp set ts=4
au BufRead,BufNewFile *.py,*.pyw,*.cpp set sts=4

autocmd InsertLeave * hi CursorLine cterm=BOLD ctermfg=NONE guibg=SteelBlue4
autocmd InsertEnter * hi CursorLine cterm=BOLD ctermfg=NONE guibg=PaleVioletRed4
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
autocmd FileType qf wincmd J
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

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
set background=dark
set termguicolors
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let base16colorspace=256
"colorscheme yzlin256
colorscheme base16-oceanicnext

"hi DiffChange   gui=bold    guifg=#272727          guibg=#e5d5ac
"hi DiffChange   gui=bold    guifg=#272727          guibg=#e5d5ac
"hi DiffDelete   gui=bold    guifg=none             guibg=#ffb0b0
"hi DiffText     gui=bold    guifg=#ff8080          guibg=#8cbee2
hi DiffAdd      gui=bold    guifg=none             guibg=#006030
hi DiffChange   gui=bold    guifg=none             guibg=#bb3d00
hi DiffDelete   gui=bold    guifg=none             guibg=#930000
"hi DiffText     gui=bold    guifg=#d200d2          guibg=#8cbee2
hi DiffText     gui=reverse guifg=#ff8700          guibg=#262626




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set map leader
let g:mapleader = ","

nmap <Leader>w :w!<CR>
"nmap <Leader><Leader>q :q<CR>
nmap <Leader>q :q<CR>
nmap <Leader>b :bdelete<CR>
"nmap <Leader>l :b#<CR>
nmap <Leader>L :Hi<<CR>
nmap <Leader>l :Hi><CR>
nmap <Leader>N :Hi{<CR>
nmap <Leader>n :Hi}<CR>
"nmap <Leader>p :set paste<CR>
nmap <Leader>j :tabp<CR>
nmap <Leader>k :tabn<CR>
nmap <Leader>T :tabnew<CR>
nmap <Leader>S :tab split<CR>
"nmap <Leader>mn :set makeprg=make<CR>
"nmap <Leader>fr :call FormartSrc()<CR>
nmap <Leader>p <C-W>gf<CR>
nmap <Leader>m :tabm<CR>

" Only for C
"set cscopetag
"set cscopeverbose
"set cscopeprg='gtags-cscope'
nmap <F8> :!ctags -R --sort=yes --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
nmap <F7> :!find -L . -iname '*.[ch]' > cscope.files <CR> :!cscope -Rb<CR>:cs kill -1 <CR>:cs add cscope.out<CR><CR>
"nmap <F7> :!find -L . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' > cscope.files ;
            "\:!cscope -b -i cscope.files -f cscope.out<CR>
            "\:cs kill -1<CR>:cs add cscope.out<CR>
"nmap <F7> :!cscope -Rbq<CR>:cs reset<CR><CR>
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
map <leader>gs :execute "Gtags " . expand("<cword>") <CR>
"map <leader>gr :execute "Gtags -r " . expand("<cword>") <CR>
"map <leader>gg :g/ /caddexpr expand("%") . ":" . line(".") . ":" . getline(".")
"map <leader>gs :set grepprg=rg\ \-C2\ \-\-vimgrep\ \$\*
nnoremap <space>G :execute "grep " . expand("<cword>") . " "<CR><CR>
"map <leader>s :execute "tab: cs f s " . expand("<cword>") <CR>
"map <leader>t :execute "tab: cs f t " . expand("<cword>") <CR>
"map <leader>h4 :execute "Highlight 4 " . expand("<cword>") <CR>
"map <leader>h5 :execute "Highlight 5 " . expand("<cword>") <CR>
"map <leader>h6 :execute "Highlight 6 " . expand("<cword>") <CR>
"map <leader>h7 :execute "Highlight 7 " . expand("<cword>") <CR>
"map <leader>h8 :execute "Highlight 8 " . expand("<cword>") <CR>
"map <leader>hc4 :Hclear 4<CR>
"map <leader>hc5 :Hclear 5<CR>
"map <leader>hc6 :Hclear 6<CR>
"map <leader>hc7 :Hclear 7<CR>
"map <leader>hc8 :Hclear 8<CR>
map <leader>hl  :match WhitespaceEOL /\s\+$/ <CR>
nnoremap <leader>c yiw:cs find s <C-R>=expand("<cword>")<CR><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>

" auto complete
" Expand
"imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
"imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

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
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on				    " syntax highlight
set hlsearch				" search highlighting
set cc=80
highlight ColorColumn ctermbg=236
highlight WhitespaceEOL ctermbg=red guibg=red
highlight CursorLine guibg=SteelBlue4
highlight Search guibg=DarkOrange3 guifg=White gui=bold
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set listchars=tab:>-,trail:-
set list lcs=tab:»\ ,trail:¬,extends:#
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
	"set rtp+=~/.vim/bundle/vundle/
	"call vundle#rc()
	"Bundle 'gmarik/vundle'

	""""""""""""""""""""""""""""""
	" tagbar
	" https://github.com/majutsushi/tagbar
	""""""""""""""""""""""""""""""
	nmap <F6> :TagbarToggle<CR>
	" set focus to TagBar when opening it
	let g:tagbar_left = 0
	let g:tagbar_sort = 0
	let g:tagbar_width = 40

	""""""""""""""""""""""""""""""
	" nerdtree
	" https://github.com/scrooloose/nerdtree
	""""""""""""""""""""""""""""""
	"Bundle 'scrooloose/nerdtree'
	"nmap <F5> :NERDTreeToggle<CR>

    " nvim-tree
lua <<EOF
    require'nvim-tree'.setup {}
EOF
    let g:nvim_tree_side = 'left' "left by default
    nnoremap <F5> :NvimTreeToggle<CR>
    "let g:NERDTreeWinSize = 25

	""""""""""""""""""""""""""""""
	" vim-fugitive
	" https://github.com/tpope/vim-fugitive
	""""""""""""""""""""""""""""""
	"Bundle 'tpope/vim-fugitive'
	nmap <Leader>gbl :Git blame<CR>
	nmap <Leader>gst :Git<CR>
	nmap <Leader>glo :Gclog<CR>
	nmap <Leader>gvd :Gvdiffsplit


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
    "
	"Plugin 'tpope/vim-surround'
	let g:surround_113="#{\r}"     " v
	let g:surround_35="#{\r}"      " #
	let g:surround_45="<% \r %>"   " -
	let g:surround_61="<%= \r %>"  " =

	"Plugin 'bling/vim-airline'
	"Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='papercolor'
	"let g:airline_theme='violet'
	let g:airline_powerline_fonts=1
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#buffer_nr_show=0
	let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
	let g:airline#extensions#tabline#show_tab_nr = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:airline#extensions#tabline#fnametruncate = 16
	let g:airline#extensions#tabline#fnamecollapse = 2
	let g:airline#extensions#tabline#buffer_idx_mode = 1"
    let g:airline#extensions#virtualenv#enabled = 0
	"let g:airline#extensions#tabline#buffer_nr_show=0
	"let g:airline#extensions#tabline#buffer_nr_format='%s: '
	"let g:airline#extensions#tabline#left_sep = ' '
	"let g:airline#extensions#tabline#left_alt_sep = '|'
	"let g:airline_theme='powerlineish'
	"let g:airline_theme='bubblegum'
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	" unicode symbols
	"let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	"let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	"let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
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
	"let g:airline_symbols.readonly = 'r'
    let g:airline_symbols.readonly = ''
"airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.dirty='⚡'

	"Plugin 'kien/ctrlp.vim'
	"let g:ctrlp_custom_ignore = {
	"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	"  \ 'binary file': '\v\.(exe|so|dll)$',
	"  \ }
	"let g:ctrlp_working_path_mode=0
	"let g:ctrlp_match_window_bottom=1
	"let g:ctrlp_max_height=15
	"let g:ctrlp_match_window_reversed=0
	"let g:ctrlp_mruf_max=500
	"let g:ctrlp_follow_symlinks=1


	""""""""""""""""""""""""""""""
	" vim gtags
	"Plugin 'aceofall/gtags.vim'
	"set cscopetag
	"set cscopeprg='gtags-cscope'
	"let GtagsCscope_Auto_Load = 1
	"let GtagsCscope_Auto_Map = 1
	"let GtagsCscope_Quiet = 1
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
    "Plugin 'chazy/cscope_maps'
	""""""""""""""""""""""""""""
	" NERD commenter
	"""""""""""""""""""""""""""
	"Bundle 'The-NERD-Commenter'
	"Bundle 'gtk-vim-syntax'
	"Bundle 'rkulla/pydiction'
	"let g:pydiction_location = '/home/steven/.vim/bundle/pydiction/complete-dict'
	"let g:pydiction_menu_height = 3
	"Bundle 'Lokaltog/vim-easymotion'
	"
    "let g:EasyMotion_smartcase = 1
	"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
	"map <Leader><leader>h <Plug>(easymotion-linebackward)
	"map <Leader><Leader>j <Plug>(easymotion-j)
	"map <Leader><Leader>k <Plug>(easymotion-k)
	"map <Leader><leader>l <Plug>(easymotion-lineforward)
	"" 重复上一次操作, 类似repeat插件, 很强大
	"map <Leader><leader>. <Plug>(easymotion-repeat)

	"Bundle 'terryma/vim-multiple-cursors'
	"let g:multi_cursor_use_default_mapping=0
	""" Default mapping
	"let g:multi_cursor_next_key='<C-n>'
	""let g:multi_cursor_prev_key='<C-l>'
	"let g:multi_cursor_skip_key='<C-x>'
	"let g:multi_cursor_quit_key='<Esc>'

    " vim-workspace
    let g:workspace_session_directory = $HOME . '/.vim/sessions/'
    let g:workspace_session_disable_on_args = 1
    let g:workspace_autosave = 0
    nnoremap <space>ws :ToggleWorkspace<CR>

    " last active tab
    if !exists('g:lasttab')
      let g:lasttab = 1
    endif
    nmap <space>0 :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()

"vim bookmark
    "highlight BookmarkSign ctermbg=whatever ctermfg=whatever
    "highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
    "highlight BookmarkLine ctermbg=whatever ctermfg=whatever
    "highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever
    highlight BookmarkSign ctermbg=NONE ctermfg=160
    highlight BookmarkLine ctermbg=194 ctermfg=NONE
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1

"vim highlight
    let HiSyncMode=1
    let HiFindTool = 'rg -H --color=never --no-heading --column --smart-case'
    hi HiFollow ctermfg=254 ctermbg=246 guifg=#e7efef guibg=#979797 cterm=bold gui=bold

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" telescope
lua <<EOF
require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-L'
--      '--regexp'
    },
    file_ignore_patterns = {'tags', 'cscope.out'},
    --layout_strategy = "vertical",
    --path_display = { shorten = 3 },
    --sorting_strategy = "ascending",
    --file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    --generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
})
EOF

" ccls
"lua <<EOF
"require'lspconfig'.ccls.setup{
    "on_attach = on_attach,
    "single_file_support = true
"}
"EOF

"let g:ccls_close_on_jump = v:true

"nmap <silent> <buffer> x    <Plug>(yggdrasil-open-node)
"<Plug>(yggdrasil-toggle-node)
"<Plug>(yggdrasil-open-node)
"<Plug>(yggdrasil-close-node)
"<Plug>(yggdrasil-execute-node)
"
" clangd
lua <<EOF
-- require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
-- require'lspconfig'.gdscript.setup{}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'clangd', 'gdscript' }
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = {'clangd'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
EOF

"auto complete
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.complete(),
      ['<C-c>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
EOF

" floaterm
let g:floaterm_keymap_prev   = '<leader>fp'
let g:floaterm_keymap_new    = '<leader>fn'
let g:floaterm_keymap_toggle = '<leader>ff'

nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <F8> <cmd>Telescope treesitter<cr>
nnoremap <C-P> <cmd>Telescope find_files follow=true<cr>
nnoremap <C-N> <cmd>Telescope oldfiles<cr>
nnoremap <leader>F <cmd>Telescope live_grep<cr>
nnoremap <leader>B <cmd>Telescope grep_string<cr>
nnoremap <leader>Q <cmd>Telescope quickfixhistory<cr>
nnoremap <leader>G <cmd>lua require'telescope.builtin'.grep_string{word_match = "-w"}<cr>
nnoremap <leader><space> <cmd>Telescope resume<cr>

nnoremap <leader>gr <cmd>lua require'telescope.builtin'.lsp_references{jump_type = "never"}<cr>
nnoremap <leader>gd <cmd>lua require'telescope.builtin'.lsp_definitions{jump_type = "never"}<cr>

" signify
"let g:signify_sign_show_text = 1
set updatetime=100
set mouse=
