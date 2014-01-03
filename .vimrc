" this is assumed to be the home of the mighty vimrc for any system
" so clone it with 'git clone git@github.com:kmanalo/dotfiles.git
" SETTINGS @ $HOME/dotfiles/bundle/vim-custom/plugin
let $MYVIMRC=$HOME."/dotfiles/.vimrc"

" Vundle Requires:
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'nvie/vim-flake8'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
Bundle 'ivanov/vim-ipython'
Bundle 'tpope/vim-surround'
Bundle 'kmanalo/vim-custom'

" syntax files
Bundle 'mitsuhiko/jinja2'
Bundle 'critcel/vim-syntax'

