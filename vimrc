" Custom quiet colorscheme wrapper
syntax on
colorscheme quiet
highlight Comment ctermfg=blue

" Relative line number with abolsolute line number at current position
set number relativenumber

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
