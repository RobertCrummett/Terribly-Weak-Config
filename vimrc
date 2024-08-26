"-----------------------------------------------------------------------------
" --- Nate's Vim settings ---
"
"-----------------------------------------------------------------------------
" --- Philosophy ---
"
" simple
" necessary dependencies only
" cross platform
"
"-----------------------------------------------------------------------------

" Vim
set nocompatible

" Fileytpe detection
filetype on
filetype plugin on
filetype indent on

" Colors 
set t_Co=256
set background=dark
syntax enable
colorscheme quiet
highlight Comment ctermfg=12
highlight Todo ctermfg=49 cterm=bold
highlight StatusLine ctermfg=15 ctermbg=0 cterm=bold
highlight ColorColumn ctermfg=9 ctermbg=0
highlight SpecialKey ctermfg=238

" Color column
nnoremap <silent> <F2> :let &cc = &cc == '' ? join(range(81,256),",") : '' <CR>

" Spelling
set nospell
set spelllang=en_us
nnoremap <silent> <F3> :set invspell<CR>

" Backspace
set backspace=indent,eol,start

" File loading
set autoread
set history=1000
set tabpagemax=10

" Status line
" on Windows disable, because timer makes cursor flicker
if !has('win32')
	set ruler
	set rulerformat=%55(%=%{strftime('%a\ %b\ %-d\ %-I\:%M\:%S\ %p')}%)
	
	set laststatus=2
	let timer = timer_start(1000, 'UpdateStatusBar', {'repeat':-1})
	function! UpdateStatusBar(timer)
		execute 'let &ro = &ro'
	endfunction
endif

" Time out for escape key
set ttimeout
set ttimeoutlen=100

" Arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" Mark spaces and trailing space
set listchars=tab:\ \ ,nbsp:+,space:·,trail:.
set list
nnoremap <silent> <F4> :set invlist<CR>

" Numbers
noremap <silent> <F5> :set invnumber<CR>

" Tab spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Search
set scrolloff=1
set incsearch
set wildmenu
set ignorecase
set hlsearch

" Mouse
set mouse=

" Fuzzy finding
set path+=**
let &wildignore = join(map(split(substitute(substitute(
	\ netrw_gitignore#Hide(), '\.\*', '*', 'g'), '\\.', '.', 'g'), ','),
	\ "v:val.','.v:val.'/'"), ',')
set wildignore+=**/venv/**
set wildignore+=**/__pycache__/**
set wildignore+=**/node_modules/**

" File explorer
let g:netrw_liststyle=1
let g:netrw_sizestyle='h'
let g:netrw_list_hide= netrw_gitignore#Hide() .. '.*\.swp$'

" Rip grepping
if executable("rg")
	set grepprg=rg\ --vimgrep\ --smart-case
endif
