if !exists(":EasyTree")
    finish
endif

" Remember exanded nodes
let g:easytree_auto_save_settings = 1
" Automatically expand previously opened nodes
let g:easytree_auto_load_settings = 1

" Don't replace netrw
let g:easytree_hijack_netrw = 0

" Store easytree settings in a centralized place
let g:easytree_settings_file = '~/.config/nvim/.easytree'

" autocmd! FileType easytree call g:my_easytree_settings() 
" function! g:my_easytree_settings()
"     let g:easytree_auto_load_settings = 0
"     let b:expanded = {'/home/leon/.dotfiles/.config/nvim/colors': 1}
" endfunction
