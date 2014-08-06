" Allow escape to close the (autocomplete) popup menu
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" map <Ctrl-o> to omnicomplete
imap <c-o> <c-x><c-o>
nmap <c-o> a<c-x><c-o>

"map indent/unindent to tab
:map <Tab> >>
:map <S-Tab> <<
:imap <S-Tab> <backspace>
:vmap <Tab> >
:vmap <S-Tab> <

"Ctrl+w closes buffer
":map <C-w> <esc>:bd<CR>
":imap <C-w> <esc>:bd<CR>
":vmap <C-w> <esc>:bd<CR>

"duplicate line
"mark position(z), yank, paste, move to(z)
" :nmap <C-d> mzyyp`z
"go to normal mode, mark position(z), yank, pate, move to(z), down, appendmode 
:imap <C-d> <esc>mzyyp`zja

"Ctrl+/ toggle nerdcomment per line
":map <C-c> ,ci

" nmap <leader>bn :b#<CR>
nmap <leader>bn :PreviousBuffer<CR>

runtime macros/smarthome_end.vim
runtime macros/linenumber_toggle.vim
runtime macros/move_lines.vim
