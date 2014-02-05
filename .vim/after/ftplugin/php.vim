"Many ftplugin files have a b:did_ftplugin setting, you should set it in
" your custom file to prevent the system wide to take any action.

" if exists("b:did_ftplugin") | finish | endif
" let b:did_ftplugin = 1

setlocal commentstring=//%s
