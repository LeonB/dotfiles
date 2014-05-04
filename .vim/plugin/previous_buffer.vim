" This plugins adds a smarter previous buffer (`:b#`, `Ctrl-6`).
" It does it by not storing buffers that have `nobuflisted` set or
" are matched by a pattern (TODO).

" Doesn't work when:
" - b1 open
" - b2 open
" - nt
" - nt close
" - :getPreviousBuffer()
"
" Now b2 is stored, but you're jumping back to it
" How to solve: ??

autocmd BufLeave * call s:storeBuffer()
" autocmd BufEnter * call s:storeBuffer()

function s:storeBuffer()
    " Don't store buffer if it isn't listed
    if &buflisted == 0
        return
    end

    if exists('w:previous_buffer')
        " If previous_buffer exists, store that value in
        " previous_previous_buffer so I you jump to a non-applicable buffer and
        " back to the previous buffer, the original previous_buffer can be used
        let w:previous_previous_buffer = w:previous_buffer
    end

    " Store current buffer
    let w:previous_buffer = bufnr('%')
endfunction

function s:getPreviousBuffer()
    " No previous buffer was set: do nothing
    if !exists('w:previous_buffer')
        return
    endif

    if bufnr('%') == w:previous_buffer && exists('w:previous_previous_buffer')
        " We jumped back to the 'previous_buffer' via a non-applicable (hidden)
        " buffer. So use the previous_previous buffer instead
        let w:previous_buffer = w:previous_previous_buffer
    endif

    return w:previous_buffer
endfunction

function s:jumpToPreviousBuffer()
    let l:previous_buffer = s:getPreviousBuffer()

    " No previous buffer set
    if !l:previous_buffer
        return
    endif

    " Jump to previous buffer
    execute 'b' . l:previous_buffer
endfunction

command PreviousBuffer call s:jumpToPreviousBuffer()
