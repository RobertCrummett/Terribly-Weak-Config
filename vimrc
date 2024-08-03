" Custom quiet color scheme wrapper
set t_Co=256
syntax enable
colorscheme quiet
highlight Comment ctermfg=blue

" Line number
set number

" Arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" Highlight the 80th column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Mark spaces, tabs, trailing space
set listchars=tab:--,space:·,nbsp:_,trail:.
set list

" Tab spacing
set tabstop=4

" Spelling setting
set nospell
set spelllang=en_us

" Search settings
set ignorecase
set smartcase

" Fuzzy finding
set path+=**
let &wildignore = join(map(split(substitute(substitute(
  \ netrw_gitignore#Hide(), '\.\*', '*', 'g'), '\\.', '.', 'g'), ','),
  \ "v:val.','.v:val.'/'"), ',')

" Netrw settings
let g:netrw_banner=0
let g:netrw_linestyle=2
let g:netrw_sizestyle='h'
let g:netrw_list_hide= netrw_gitignore#Hide() .. '.*\.swp$'
