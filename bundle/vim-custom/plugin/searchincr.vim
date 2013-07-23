
" place functions here
function! SearchIncr(a1,a2,a3,a4,...) 
  " patn, repl, start, increment
  let target = a:a1
  let repl = a:a2
  let startval = a:a3
  let increment = a:a4

  " 1st optional argument handles leading zeros
  " process optional leading zero
  if a:0 >= 1
    let leadingz = a:1
  else
    " default to 0
    let leadingz = 0
  endif

  " 2nd optional argument handles if target string goes before or after
  " default is before
  if a:0 == 2
    " ideally set to 'after'
    let repl_pos = a:2 
  else
    let repl_pos = 'before'
  endif

  " inits
  let l:incr = startval - increment
  let lnum = a:firstline

  " cycle though selection
  while lnum <= a:lastline

    " the FORMATTING string
    if repl_pos == 'before'
      let l:incrstring = '\=printf(''%s%0'. leadingz . 'd'',repl,l:incr)'
    elseif repl_pos == 'after'
      let l:incrstring = '\=printf(''%0'. leadingz . 'd%s'',l:incr,repl)'
    else
      "default to no leading zero and before placement
      let l:incrstring = '\=printf(''%s%0d'',repl,l:incr)'
    endif

    " only increment counter when target matches
    if match(getline(lnum),target) > 0
      let l:incr = l:incr + increment
    endif

    " the search and replace
    call setline(lnum,substitute(getline(lnum),target,
    \ l:incrstring,'g'))
 
    let lnum = lnum + 1
  endwhile
endfunction

