"always use 256 colors on the term
set t_Co=256

colorscheme wombat256mod
" let g:molokai_original = 1
" colorscheme molokai

" One little adjustment for Monokai
if g:colors_name == "Monokai"
    hi SpecialKey ctermbg=None
endif


" Fix terminal timeout when pressing escape
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
