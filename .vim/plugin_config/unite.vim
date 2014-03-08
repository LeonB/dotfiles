" Set unite prefix key
nnoremap [unite] <Nop>
nmap <space> [unite]

" let g:unite_enable_start_insert = 1
let g:unite_prompt = '>>> '
let g:unite_winheight = 15
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom_filters('buffer', ['matcher_fuzzy', 'matcher_project_files'])

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    " nmap <buffer> <esc> <plug>(unite_exit)
    " imap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-s> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction

" Ctrl-p
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
" :MRU
command! MRU Unite file_mru
" Ag & Ack
nnoremap <C-g> :Unite -no-split grep:.<cr>
command! -nargs=* Ag Unite grep:.:-s:<args>
command! -nargs=* Ack Unite grep:.:-s:<args>
" Buf Explorer
nmap <leader>be :Unite buffer<CR>
