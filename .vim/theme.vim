"Highlight current line
:set cursorline

if has('gui_running')
  runtime gvim.vim
else
  runtime terminal.vim
end

"Geen lelijke rode achtergrond maar een curly ding voor trailing whitespace
highlight BadWhitespace ctermbg=red guisp=red gui=undercurl guifg=NONE guibg=NONE

" Lines longer that 80-characters: colorize
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/
