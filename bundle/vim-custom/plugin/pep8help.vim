" nvie's excellent plugin for Python
autocmd BufWritePost *.py call Flake8()

" convert ',\S' to ', \S' where \S is any character that is not whitespace
map <leader>, :s/,\(\S\)/, \1/
map <leader>e :s/\(\S\)=\(\S\)/\1 = \2/
map <leader>p :s/\(\S\)+\(\S\)/\1 + \2/
map <leader>o :s/\(\S\)+=\(\S\)/\1 += \2/
map <leader>m :s/\(\S\)-\(\S\)/\1 - \2/
map <leader>8 :s/\(\S\)\*\(\S\)/\1 * \2/
