" Allow escape to close the (autocomplete) popup menu
imap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" In popup menu: use enter to select highlight
" In normal insert mode: break undo sequence
" http://vim.wikia.com/wiki/Modified_undo_behavior
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u<CR>"

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

" delete without yanking
" nnoremap <leader>d "_d
" vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
" vnoremap <leader>p "_dP
vnoremap p "_dp
vnoremap P "_dP

" Don't jump over wrapped lines
" nnoremap <expr> k (v:count ? 'k' : 'gk')
" nnoremap <expr> j (v:count ? 'j' : 'gj')

" Make yaking lines consistent with D and C
nnoremap Y y$

" Copy filenames to clipboard
nmap <leader>cs :let @+=expand("%")<CR>
nmap <leader>cl :let @+=expand("%:p")<CR>

" Make ctrl-s to save
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a
imap <c-s> <esc>:w<cr>

runtime macros/smarthome_end.vim
runtime macros/linenumber_toggle.vim
runtime macros/move_lines.vim
runtime macros/move_lines.vim
