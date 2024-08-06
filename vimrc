"----------------------------------------------------------------------------
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

" Color
set t_Co=256
syntax enable
colorscheme quiet
highlight Comment ctermfg=12
highlight Todo ctermfg=49 cterm=bold
highlight StatusLine ctermfg=white ctermbg=16 cterm=bold
highlight ColorColumn ctermfg=red ctermbg=16
let &colorcolumn=join(range(81,999),",")

" Backspace
set backspace=indent,eol,start

" File loading
set autoread
set history=1000
set tabpagemax=10

" Line number
set number

" Status line
set ruler
set rulerformat=%55(%=%{strftime('%a\ %b\ %d\ %X\ %p')}%)

set laststatus=2
let timer = timer_start(1000, 'UpdateStatusBar',{'repeat':-1})
function! UpdateStatusBar(timer)
	execute 'let &ro = &ro'
endfunction

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

" Tab spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

" Intent
set smartindent

" Spelling
set nospell
set spelllang=en_us

" Search
set scrolloff=1
set incsearch
set wildmenu
set ignorecase
set smartcase

" Mouse
set mouse=

" Fuzzy finding
set path+=**
let &wildignore = join(map(split(substitute(substitute(
	\ netrw_gitignore#Hide(), '\.\*', '*', 'g'), '\\.', '.', 'g'), ','),
	\ "v:val.','.v:val.'/'"), ',')

" File explorer
let g:netrw_liststyle=1
let g:netrw_sizestyle='h'
let g:netrw_list_hide= netrw_gitignore#Hide() .. '.*\.swp$'
