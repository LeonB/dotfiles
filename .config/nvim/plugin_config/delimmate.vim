" default = let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_balance_matchpairs = 1

"deliMate mappings
"inoremap <Space> <C-R>=delimitMate#ExpandSpace()<CR>
"inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<C-R>=delimitMate#ExpandReturn()\<CR>"
"let delimitMate_autoclose = 0
" let delimitMate_expand_cr = 1
