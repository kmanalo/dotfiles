" section: vim-latexsuite settings
"
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" Default viewer
let g:Tex_DefaultTargetFormat='pdf'

" compile dvi first, then ps, then pdf, in that order
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
" end section: vim-latexsuite settings

" enables ,u to find UPPERCASE ,U to surround with losa tag (for tex)
nmap <leader>u /\v<[A-Z][A-Z]+><CR>
nmap <leader>U csw-
autocmd FileType tex let b:surround_108 = "\\losa{\r}"
let g:surround_45 = "\\losa{\r}"

" ensure aux is recognized as a filetype
au BufRead,BufNewFile *.aux set filetype=aux
