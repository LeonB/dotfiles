" au FileType mail sil call s:DoMappings()

" set global variables only for mail type because for some reason this
" configuration gets loaded before the plugin does...
autocmd FileType mail let g:yaposting#cleanreu = "<Leader>mq"
autocmd FileType mail let g:yaposting#cleanred = "<Leader>md"
