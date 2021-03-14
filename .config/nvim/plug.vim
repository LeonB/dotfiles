" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugins/')

" init plugins
runtime plugins.vim
"
" Initialize plugin system
call plug#end()
