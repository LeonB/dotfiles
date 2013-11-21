let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_by_filename = 1
"let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_root_markers = ['ctags'] "additional root markers
" let g:ctrlp_use_caching = 1 "enable caching
" let g:ctrlp_clear_cache_on_exit = 1 "enable cross-session caching
" Use git to list files
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
nnoremap <leader>. :CtrlPTag<cr>
