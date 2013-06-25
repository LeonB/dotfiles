"\+t = FuzzyFinder
":map <Leader>ff :FufFile<CR>
:map <Leader>ff :FufCoverageFile<CR>
:map <Leader>fb :FufBuffer<CR>
:map <Leader>ft :FufTag<CR>

"Ctrlp
":map <Leader>p :CtrlP<CR>
let g:ctrlp_map = '<Leader>p'  " Leave this empty to disable the default mapping

let BROWSER_COMMAND = '/opt/google/chrome/chrome'

"TagList
nnoremap <silent> <F8> :TlistToggle<CR>
"let Tlist_Auto_Open = 1 "Open TagList when vim starts

"Show vimtips on start
"au VimEnter * echomsg system('/usr/games/fortune vimtips')

"Syntastic
let g:syntastic_auto_loc_list=1 "open the error window automically
let g:syntastic_loc_list_height=5 "the size of the error window
let g:syntastic_phpcs_conf="--standard=Zend"
let g:syntastic_phpcs_conf="--standard=CakePHP"
let g:syntastic_enable_signs=0
let g:syntastic_quiet_warnings=0
let g:syntastic_mode_map = { 'mode': 'passive' }

"NERDtree
let g:NERDTreeWinSize = 50

"NERDcommenter
let g:NERDSpaceDelims = 1

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_by_filename = 1
"let g:ctrlp_cmd = 'CtrlPMixed'

"linemovement.vim
let g:linemovement_up="<c-Up>"
let g:linemovement_down="<c-Down>"

"Tabularize.vim
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
