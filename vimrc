"-----------------------------------------------------------------------------
" --- Nate's Vim settings ---
"
"-----------------------------------------------------------------------------
" --- Philosophy ---
"
" SIMPLE
" UNDERSTAND EVERYTHING
" FUNCTION KEYS TOGGLE INTERESTING SETTINGS
"
"-----------------------------------------------------------------------------

" Vim
set nocompatible

" Fileytpe detection
filetype plugin on
filetype indent on

" Colors 
set t_Co=256
syntax on
set background=dark
colorscheme wildcharm

" colorscheme quiet
" highlight! Comment ctermfg=12
" highlight! Todo ctermfg=49 cterm=bold
" highlight! StatusLine ctermfg=15 ctermbg=0 cterm=bold
" highlight! ColorColumn ctermfg=9 ctermbg=0
" highlight! SpecialKey ctermfg=238
" highlight! link Error Normal

" Color column
noremap <silent> <F2> :let &cc = &cc == '' ? join(range(81,256),",") : '' <CR>

" Spelling
set nospell
set spelllang=en_us
noremap <silent> <F3> :set invspell<CR>

" Backspace
set backspace=indent,eol,start

" Status line
set laststatus=2
if !has('win32')
	let gitBranch=trim(system("git branch 2> /dev/null | sed -e 's/..//'"))
	set statusline=%F\ (%{gitBranch})%=%{strftime('%a\ %b\ %-d\ %-I\:%M\:%S\ %p')}\ 

	let timer = timer_start(1000, 'UpdateStatusBar', {'repeat':-1})
	function! UpdateStatusBar(timer)
		execute 'let &ro = &ro'
	endfunction
else
	set statusline=%F
endif

" Arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" Mark spaces and trailing space
set listchars=tab:\ \ ,nbsp:+,space:·,trail:.
noremap <silent> <F4> :set invlist<CR>

" Numbers
noremap <silent> <F5> :set invnumber<CR>

" Transparent background
let t:is_transparent = 0
function! ToggleTransparent()
	if t:is_transparent == 0
		highlight Normal ctermbg=NONE
		highlight StatusLine ctermfg=15 ctermbg=NONE cterm=bold
		let t:is_transparent = 1
	else
		highlight Normal ctermbg=0
		highlight StatusLine ctermfg=15 ctermbg=0 cterm=bold
		let t:is_transparent = 0
	endif
endfunction
nnoremap <silent> <F6> :call ToggleTransparent()<CR>

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
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 1
let g:netrw_sizestyle='h'
let g:netrw_list_hide= netrw_gitignore#Hide() .. '.*\.swp$'

" Grepping
if executable("rg")
	set grepprg=rg\ --vimgrep\ --smart-case
endi

" Word completion
set omnifunc=syntaxcomplete#Complete

" Universal ctags
set tags=$HOME/.vim/tags,tags;$HOME
