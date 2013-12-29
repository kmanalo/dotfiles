" delete leading whitespace
map <leader>k :s/^\s\+
" delete line to whitespace
map <leader>l d0d$k 
" delete trailing whitespace
map <leader>; :s/\s\+$//

" the below commands come in handy also 
" delete trailing whitespace for a whole buffer, command is ",<del>"
nnoremap <silent> <leader><del> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" remove trailing whitespace before join, command is ",J"
nnoremap <silent> <leader>J :let _s=@/<Bar>:s/\s\+$//e<Bar>:j<CR>:let @/=_s<Bar>:nohl<CR>
