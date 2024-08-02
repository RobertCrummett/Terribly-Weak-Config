" Custom quiet color scheme wrapper
set t_Co=256
syntax enable
colorscheme quiet
highlight Comment ctermfg=blue

" Relative line number with absolute
" line number at current position
set number

" Exit terminal mode
tnoremap <esc> <c-\><c-n>

" Highlight the 80th column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Highlight space
set listchars=tab:>~,nbsp:_,trail:.
set list

" Tab spacing
set tabstop=4

" Spelling enabled
set spell spelllang=en_us

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
