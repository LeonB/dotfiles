" languageclient
" let g:LanguageClient_serverCommands = {
"             \ 'c': [ 'clangd' ],
"             \ 'cpp': [ 'clangd' ],
"             \ 'javascript': [ 'javascript-typescript-stdio' ],
"             \ 'python': [ 'pyls' ],
"             \ 'ruby': [ 'solargraph',  'stdio' ],
"             \ }

let g:LanguageClient_serverCommands = {
            \ 'ruby': [ 'solargraph',  'stdio' ],
            \ }

" let g:LanguageClient_devel = 1 " Use rust debug build
let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
