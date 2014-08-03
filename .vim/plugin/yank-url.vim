" http://www.google.com

func! s:YankUrl()
    let line = getline('.')
    let url = s:getUrl(line)

    if url == ''
        return
    endif

    " Paste the url in the unnamed (default) register
    let @@ = url
    echo 'Url "' . url . '" yanked'
endfunction

func! s:getUrl(line)
    let regex = '\(\(https\?\|ftp\|mailto\|file\):\)\?\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'
    let url = matchstr(a:line, regex)
    return url
endfunction

command! YankUrl call s:YankUrl()
nmap <leader>yu :YankUrl<cr>
