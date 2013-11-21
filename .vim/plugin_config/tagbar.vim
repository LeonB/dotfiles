" Try to rely on autotags; don't generate own ctags?
" sort by file order; ascii arrows; don't show php vars
" let g:tagbar_sort = 0
" let g:tagbar_iconchars = ['+', '-']
let g:tagbar_type_php  = { 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
\ ] }
nnoremap <silent> <Leader>b :TagbarToggle<CR>
