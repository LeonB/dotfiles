" look for a project specific tags file
let g:easytags_dynamic_files = 1

" disable python / dynamic highlighting because it is slow on sshfs
let g:easytags_python_enabled = 0
let g:easytags_auto_highlight = 0

" disable easytags for go (using GoDef for the moment)
autocmd FileType go let g:easytags_events = []

" run ctags async
let g:easytags_async = 1

" Language specific options
let g:easytags_languages = {
\   'go': {
\     'cmd': 'gotags',
\     'args': ['-sort=true'],
\     'fileoutput_opt': '-f=',
\     'stdout_opt': '-f=-',
\     'recurse_flag': '-R'
\   }
\}
