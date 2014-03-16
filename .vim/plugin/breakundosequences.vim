" Insert an undo sequence on space, enter and tab in insert mode
" http://vim.wikia.com/wiki/Modified_undo_behavior
" :inoremap <Space> <C-g>u<Space> " breaks :iab
:inoremap <CR> <C-g>u<CR>
:inoremap <Tab> <C-g>u<Tab>
