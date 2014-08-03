" go get -u code.google.com/p/rog-go/exp/cmd/godef
" go get -u github.com/golang/lint/golint
" go get -u github.com/nsf/gocode
" go get -u code.google.com/p/go.tools/cmd/goimports
" go get -u code.google.com/p/go.tools/oracle
" go get -u github.com/kisielk/errcheck

" Use autocomplete: <C-x><C-o>

" Set import path
let g:go_bin_path = expand("~/.go/bin")

" Disable auto installation of binaries
let g:go_disable_autoinstall = 1

" Disable auto fmt on save:
let g:go_fmt_autosave = 0

