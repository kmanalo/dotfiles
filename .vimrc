" this is assummed to be the home of the mighty vimrc for any system
" so clone it with 'git clone git@github.com:kmanalo/dotfiles.git
let $MYVIMRC=$HOME."/dotfiles/.vimrc"

" pathogen support
source $HOME/dotfiles/bundle/vim-pathogen/autoload/pathogen.vim
" sometimes you need to see all the paths, uncomment next line to show
" verbose set runtimepath?
call pathogen#infect('$HOME/dotfiles/bundle')
call pathogen#runtime_append_all_bundles('$HOME/dotfiles/bundle')
call pathogen#helptags()
syntax on
filetype plugin indent on

" all settings are in $HOME/dotfiles/bundle/vim-custom/plugin
