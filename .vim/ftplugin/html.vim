"set makeprg=%!tidy\ -q\ -i\ --show-warnings\ no
command! Tidy %!tidy -q -i --show-warnings no --show-body-only auto --wrap 0<CR>
set textwidth=0
