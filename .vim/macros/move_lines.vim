"additional swap-lines bindings
nnoremap <C-S-k> :m .-2<CR>==
nnoremap <C-S-j> :m .+1<CR>==
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv
