" Disable netrw.vim
let g:loaded_netrwPlugin = 1

" Use vimfiler as default explorer
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_expand_jump_to_first_child = 0

" call custom vimfiler settings when creating buffer
autocmd! FileType vimfiler call g:my_vimfiler_settings()

function! g:my_vimfiler_settings()
    set nobuflisted
    " setlocal bufhidden=delete
    " Only works the first open :(
    " let b:vimfiler.prompt_linenr = 0
    " nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    " nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
    " nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
    " nmap <buffer> <Enter> :call vimfiler#mappings#vimfiler_expand_tree()<Cr>
    " nmap <buffer> <Enter> <Plug>(vimfiler_expand_tree)
    " nmap <buffer> <Enter> :echo a:dir<Cr>

    " Use enter to toggle tree + open files
    nmap <buffer><expr> <Cr> vimfiler#smart_cursor_map(
                \ "\<Plug>(vimfiler_expand_tree)",
                \ "\<Plug>(vimfiler_edit_file)")

    " Only close buffer, not whole window
    nmap q <buffer> <Plug>(vimfiler_close)

    " Remap <leader>vf to close the buffer (toggle function)
    nmap <buffer> <leader>vf <Plug>(vimfiler_close)

    " Use C to change to a directory
    " nmap <buffer><expr> C vimfiler#smart_cursor_map(
    "             \ "\<Plug>(vimfiler_execute)",
    "             \ "\<Plug>(vimfiler_edit_file)")
endfunction

" Return a unique id each time.
let s:cntr = 0
function! s:getUniqueID()
    let s:cntr = s:cntr + 1
    return s:cntr
endfunction

" Create a new VimFiler instance based on the current window
function! VimFilerUnique()
    exec 'VimFiler -simple -buffer-name=window-' . w:id
endfunction

" put unique window identifier into w:id variable
autocmd VimEnter,WinEnter * if !exists('w:id') | let w:id=s:getUniqueID() | endif

nmap <silent> <Plug>VimFilerUnique :call VimFilerUnique()<cr>
nmap - <Plug>VimFilerUnique
nmap <leader>vf <Plug>VimFilerUnique

if !exists(":NERDTree")
    nmap <leader>nt <Plug>VimFilerUnique
endif

