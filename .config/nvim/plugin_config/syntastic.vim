"Syntastic
let g:syntastic_auto_loc_list = 1 "open the error window automically
let g:syntastic_loc_list_height = 10 "the size of the error window
let g:syntastic_enable_signs = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_aggregate_errors = 1 " group results for all checkers

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" PHP
" phpcs: php code sniffer
" php-pmd: php mess detector
" pdepend
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_phpcs_conf="--standard=Zend"
let g:syntastic_phpcs_conf="--standard=CakePHP"
let g:syntastic_phpcs_conf="--standard=PSR2"

" Python
" flake8, pyflakes, pylin, python
let g:syntastic_python_checkers = ['flake8']

" Go
" go get code.google.com/p/go.tools/cmd/vet
" go get github.com/golang/lint/golint
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'gotype', 'govet']

" scss
let g:syntastic_scss_checkers = ['sass', 'scss_lint']

" javascript
let g:syntastic_javascript_checkers = ['gjslint', 'jslint', 'jshint']

nmap <leader>sc :SyntasticCheck<CR>
