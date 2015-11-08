if has('gui_running')
  runtime gvim.vim
else
  runtime terminal.vim
end

"Geen lelijke rode achtergrond maar een curly ding voor trailing whitespace
highlight BadWhitespace ctermbg=red guisp=red gui=undercurl guifg=NONE guibg=NONE

" Lines longer that 80-characters: colorize
hi ColorColumn guibg=#293739 ctermbg=235
