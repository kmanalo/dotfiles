" 'git clone git@github.com:kmanalo/dotfiles.git
" SETTINGS @ $HOME/dotfiles/bundle/vim-custom/plugin
let $MYVIMRC=$HOME."/dotfiles/.vimrc"

" Vundle Requires:
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" plug-ins
Bundle 'nvie/vim-flake8'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
Bundle 'ivanov/vim-ipython'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-dispatch'

" my preferred settings
Bundle 'kmanalo/vim-custom'

" syntax files
Bundle 'mitsuhiko/jinja2'
Bundle 'critcel/vim-syntax'

call vundle#end()
filetype plugin indent on

source $HOME/.vim/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('$HOME/dotfiles/bundle/{}')
call pathogen#helptags()

" turn syntax and filetype support back on
syntax on

" scripts have been scrapped but they can be recovered 
" e.g. 'git checkout fac7649 -- scripts'
