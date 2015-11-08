" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }

" let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['tagbar'] ],
"       \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
"       \ },
"       \ 'component_function': {
"       \   'tagbar': 'MyTagbar',
"       \ },
" \ }

" function! MyTagbar()
"     return tagbar#currenttag('%s', 'No current tag')
" endfunction
