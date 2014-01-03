function! HCheck()
    let basename = expand("%:t:r") . '.h' 
    if filereadable(basename)
        " e.g. #include "somefile.h"
        let hinclude = "#include \"" . expand("%:t:r") .  ".h\"" 
        10put=hinclude

        " delete last 4 lines from skeleton.cpp
        $d
        $d
        $d
        $d

        " TODO: insert contents between 
        " using namespace std;
        "   AND
        " #end if
        " in cpp file

    endif
endfunction

" skeleton templates for cpp
function! NewCppFile()
    silent! 0r ~/dotfiles/bundle/vim-custom/templates/skeleton.cpp

    " insert filename at FILENAME
    2s/FILENAME/\=expand("%:t")
    " insert date at DATE
    6s/DATE/\=strftime("%a %d %b %Y")/

    " check for matching h file
    echo "Calling HCheck"
    call HCheck()
endfunction

autocmd BufNewFile *.cpp call NewCppFile() 

" skeleton templates for cpp h file
function! NewCppHFile()
    silent! 0r ~/dotfiles/bundle/vim-custom/templates/skeleton.h
    " insert filename at FILENAME
    1,2s/FILENAME/\=expand("%:t:r")
endfunction

autocmd BufNewFile *.h call NewCppHFile() 

