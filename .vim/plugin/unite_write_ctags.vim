" https://github.com/vim-scripts/AutoTag/blob/master/plugin/autotag.vim
" http://vim.wikia.com/wiki/Autocmd_to_update_ctags_file
" https://github.com/xolox/vim-easytags
" call vimproc#system_bg('ctags -f' . ProjectRootGet() . expand('%:p'))
" https://github.com/craigemery/dotFiles/blob/master/vim/plugin/autotag.vim
" https://github.com/szw/vim-tags
" bundle show --paths 2>/dev/null
" https://github.com/craigemery/dotFiles/blob/master/vim/plugin/autotag.py
" https://github.com/xolox/vim-easytags
" https://github.com/dbakker/vim-projectroot
" https://github.com/Shougo/vimproc.vim/issues/102

" Push as much as configuration to .ctags
" As little configuration as possile
" Fast, fast, fast!

let g:ctags_filename = 'ctags'
function! unite_write_ctags#save()
    " Store projectroot variable per buffer so it doesn't have to get fetched
    " every time you save
    if !exists('b:projectroot')
        let b:projectroot = ProjectRootGet()
    endif

    let ctags_path = b:projectroot . '/' . g:ctags_filename
    let file_to_process = expand('%:p')
    let cmd = 'ctags -f ' . ctags_path . ' ' . file_to_process

    " echo "Writing to ctags file " . ctags_path
    call vimproc#system_bg(cmd)

    " Sleep 5 seconds
    " sleep 5
    " echo vimproc#get_last_errmsg()
    " sleep 1
    " echo vimproc#get_last_status()
endfunction

" Enable automatic ctags generation
augroup unite_write_ctags
   au!
   autocmd BufWritePost,FileWritePost * call unite_write_ctags#save()
augroup END
