set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=80

" when comparing files with vimdiff ignore whitespace
set diffopt+=iwhite

" for my vim settings this is the preferred mapleader
let mapleader = ","

" highlights should always be off at first
set nohlsearch

" pressing F3 - toggle switch for search highlighter
nnoremap <F3> :set hlsearch!<CR>

" pressing F4 - gives you the word count!
nnoremap <F4> Vg<c-g><c-[> <CR

" pressing F5 - this was useful for compiling bibtex
au FileType aux map <buffer> <F5> :!bibtex %:r <CR>

" this unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" :au BufNewFile *.cpp 0r ~/dotfiles/bundle/vim-custom/plugin/skeleton.cpp
