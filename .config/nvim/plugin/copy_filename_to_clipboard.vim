" Convert slashes to backslashes for Windows.
if has('win32')
  nmap <leader>cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap <leader>cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap <leader>c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap <leader>cs :let @+=expand("%")<CR>
  nmap <leader>cl :let @+=expand("%:p")<CR>
endif
