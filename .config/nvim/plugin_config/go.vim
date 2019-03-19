" go get -u github.com/rogpeppe/godef
" go get -u github.com/golang/lint/golint
" go get -u github.com/nsf/gocode
" go get -u golang.org/x/tools/cmd/goimports
" go get -u golang.org/x/tools/cmd/guru
" go get -u github.com/kisielk/errcheck
" go get -u golang.org/x/tools/cmd/vet
" go get -u github.com/axw/gocov/gocov
" go get -u github.com/jstemmer/gotags
" go get -u golang.org/x/tools/cmd/gorename
" go get -u github.com/zmb3/gogetdoc
" go get -u github.com/klauspost/asmfmt/cmd/asmfmt
" go get -u github.com/fatih/motion
" go get -u github.com/dominikh/go-tools/cmd/keyify

" Use autocomplete: <C-x><C-o>

" Set import path
" let g:go_bin_path = expand("~/.go/bin")

" ignore neovim version warnings
let g:go_version_warning = 0

" Disable auto installation of binaries
let g:go_disable_autoinstall = 1

" Disable auto fmt on save:
let g:go_fmt_autosave = 1

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
