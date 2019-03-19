" Set unite prefix key
" nnoremap [unite] <Nop>
" nmap <space> [unite]

" let g:unite_enable_start_insert = 1
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec/async', 'ignore_pattern', 'node_modules/\|bower_components/\|vendor/')

" Set default context variables
call unite#custom#profile('default', 'context', {
            \ 'prompt': '>>> ',
            \ 'prompt_direction': 'top',
            \ 'smartcase': 1,
            \ 'winheight': 15
            \ })

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''

    " Requires at least ag 0.22
    " Find is faster but is dumber ignoring certain files
    " let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" -g ""'
    let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup -g ""'
    " let g:unite_source_rec_async_command = 'git ls-files'
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt=''
    " let g:unite_source_rec_async_command = 'ack -f --nofilter'
endif

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Not showing the trailing space as red if has vim-trailing-color installed
    autocmd InsertLeave <buffer> match ExtraWhitespace //
    autocmd InsertEnter <buffer> match ExtraWhitespace //
    autocmd BufWinEnter <buffer> match ExtraWhitespace //

    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    " imap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-s> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction

" Ctrl-p
nnoremap <C-p> :Unite -start-insert file_rec/async:!<CR>
" :MRU
command! MRU Unite file_mru
let g:neomru#do_validate = 0

" Ag & Ack
nnoremap <C-g> :Unite -no-split grep:.<cr>
command! -nargs=* Ag Unite grep:.:-s:<args>
command! -nargs=* Ack Unite grep:.:-s:<args>
" Buf Explorer
nmap <leader>be :Unite buffer<CR>
