" http://gnuvince.wordpress.com/2007/02/26/reformatting-a-css-file-with-vim/

" Ignore a:hover
" autocmd FileType scss.css command <buffer> FixColons :%s/:\(\S\)/: \1/g

function s:TidyScss(line1, line2)
    let cmd = 'sass-convert --from scss --to scss --stdin --indent ' . &shiftwidth
    let stdin = join(getline(a:line1, a:line2), "\n")
    execute a:line1 . ',' . a:line2 . '!' . cmd
endfunction

function s:TidyCss(line1, line2)
    let cmd = 'csstidy - --silent=true --sort_properties=true --template=low'
    let stdin = join(getline(a:line1, a:line2), "\n")
    execute a:line1 . ',' . a:line2 . '!' . cmd
    :retab
endfunction

autocmd FileType scss.css command! -range=% Tidy call <SID>TidyScss(<line1>,<line2>)
autocmd FileType css command! -range=% Tidy call <SID>TidyScss(<line1>,<line2>)
" autocmd FileType css command! -range=% Tidy call <SID>TidyCss(<line1>,<line2>)
