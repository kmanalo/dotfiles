" enables ,v to edit vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" source as soon as we write the vimrc file
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
