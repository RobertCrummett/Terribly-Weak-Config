" Turn expand tab on, decrease tab size
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" Change make program to latexmk
setlocal makeprg=latexmk\ $*\ %\
