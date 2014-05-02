" This plugins adds a smarter previous buffer (`:b#`, `Ctrl-6`).
" It does it by not storing buffers that have `nobuflisted` set or
" are matched by a pattern (TODO).

autocmd BufLeave * call s:storeBuffer()

function s:storeBuffer()
    " Don't store buffer if it isn't listed
    if &buflisted == 0
        return
    end

    " Store current buffer
    let w:previous_buffer = bufnr('%')
endfunction

function s:getPreviousBuffer()
    " No previous buffer was set: do nothing
    if !exists('w:previous_buffer')
        return
    endif

    " Jump to previous buffer
    execute 'b' . w:previous_buffer
endfunction

command PreviousBuffer call s:getPreviousBuffer()
