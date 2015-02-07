" go get -u code.google.com/p/rog-go/exp/cmd/godef
" go get -u github.com/golang/lint/golint
" go get -u github.com/nsf/gocode
" go get -u code.google.com/p/go.tools/cmd/goimports
" go get -u code.google.com/p/go.tools/oracle
" go get -u github.com/kisielk/errcheck
" go get -u code.google.com/p/go.tools/cmd/vet
" go get -u github.com/axw/gocov/gocov

" Use autocomplete: <C-x><C-o>

" Set import path
let g:go_bin_path = expand("~/.go/bin")

" Disable auto installation of binaries
let g:go_disable_autoinstall = 1

" Disable auto fmt on save:
let g:go_fmt_autosave = 0

" Automatically run :GoInfo on every keyword
" let g:go_auto_type_info = 1

" Set up mappings
autocmd FileType go nmap <leader>gb :GoBuild<CR>
autocmd FileType go nmap <leader>gf :GoFmt<CR>
" autocmd FileType go nmap <leader>gi :GoInstall<CR>
autocmd FileType go nmap <leader>g? :GoInfo<CR>
autocmd FileType go nmap <leader>gi :GoImports<CR>
autocmd FileType go nmap <leader>gr :GoRun<CR>
autocmd FileType go nmap <leader>gm :make<CR>
autocmd FileType go nmap <c-]> :GoDef<cr>
