" Map Bdelete to Bclose
command! -bang -complete=buffer -nargs=? Bclose Bdelete<bang> <args>

nnoremap <silent> <leader>bc :Bclose<CR>
nnoremap <silent> <leader>bd :Bclose<CR>
