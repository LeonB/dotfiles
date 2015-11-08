" https://github.com/bitc/vim-bad-whitespace

function! s:EraseBadWhitespace(line1,line2)
  let l:save_cursor = getpos(".")
  silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
  call setpos('.', l:save_cursor)
endfunction

" Run :EraseBadWhitespace to remove end of line white space.
command! -range=% EraseBadWhitespace call <SID>EraseBadWhitespace(<line1>,<line2>)
