function! s:minwidth()
    if has('gui_running')
        let extra_spacing = 4
    else
        let extra_spacing = 6
    endif

    execute "set columns=" . (&textwidth + extra_spacing)
endfunction

command! Minwidth call s:minwidth()
