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

" This is Vim
set nocompatible

" Colors
set t_Co=256
syntax enable
colorscheme quiet
highlight Comment ctermfg=blue
highlight StatusLine ctermfg=white ctermbg=black cterm=bold

" Backspace
set backspace=indent,eol,start

" Load file changes
set autoread
set history=1000
set tabpagemax=10

" Line number
set number

" Status line
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M:%S\ %p')}\ %5l,%-6(%c%V%)\ %P%)

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

" Highlight the 80th column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)

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

" Spelling setting
set nospell
set spelllang=en_us

" Search settings
set scrolloff=1
set incsearch
set wildmenu
set smartcase
set ignorecase

" Fuzzy finding
set path+=**
let &wildignore = join(map(split(substitute(substitute(
	\ netrw_gitignore#Hide(), '\.\*', '*', 'g'), '\\.', '.', 'g'), ','),
	\ "v:val.','.v:val.'/'"), ',')

" File explorer settings
let g:netrw_liststyle=1
let g:netrw_sizestyle='h'
let g:netrw_list_hide= netrw_gitignore#Hide() .. '.*\.swp$'
