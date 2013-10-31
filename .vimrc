runtime vundle.vim

"set syntax highlighting on
syntax on
"enable line numbering
:set number

set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set gdefault "replace globally by default
"set foldcolumn=1 "display sidebar with folds

"highlight search results
set hlsearch

"no line wrapping
:set nowrap

"enable mouse
"set mouse=a

"set indenting on
filetype plugin indent on

"allow multiple open files
:set hidden

set fileencoding=utf-8
set spelllang=nl,en
set spellfile=~/.vim/spell/custom.add

set nocompatible          "Use VIM not vi (affects other options?)
set textwidth=80          "force text width off (prev at 80 chars/line)
" Set different bgcolor for everything > `textwidth`
execute "set colorcolumn=" . "+" . join(range(1,150), ',+')
set formatoptions=tcqnlr  "include numbered lists when formatting with gq
set modelines=0           "prevent some security exploits
let mapleader = ","       "Change \ to , (nercommenter, fuzzyfinder (t))
set noshowmode            "Hide the default mode text (e.g. -- INSERT -- below the statusline)
set tabstop=4             "Show a tab as four spaces
set shiftwidth=4          "Insert four spaces when using indent
set expandtab             "Use spaces instead of tabs
set ffs=unix              "Always use unix line endings"
set list                  "Show special keys
set clipboard=unnamedplus "Sync vim clipboard with system clipboard
set listchars=tab:›\ ,trail:·,extends:>,precedes:< "what special keys should look like
set nopaste               "disable indenting when pasting
" set ttyfast               "u got a fast terminal
" set ttyscroll=3           "redraw instead of scrolling (may cause flickering)
" set lazyredraw            "do not redraw as many

" disable fileencoding, fileformat (ffs), (no)expandtab, shiftwidth,
" softtabstop, tabstop & textwidth when using editorconfig-vim

" Disable netrw
":let loaded_netrw = 1
":let loaded_netrwPlugin = 1
let g:netrw_keepdir=0 "keep the current directory the same as the browsing directory

" Directories for swp files
" // uses the whole path for tmp files to avoid collisions
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

"Some gui options:
:set completeopt=longest,preview,menuone

let g:Tb_MoreThanOne=99999999 "Always open the tabbar.vim
:let g:buftabs_only_basename=1 "Only show the basename, not the full path

runtime plugin_mappings.vim

runtime macros.vim
runtime theme.vim
"runtime plugins/autonum.vim "Deze zou ik zelf overnieuw moeten maken
"au FileType html,xhtml,xml,php so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

let g:autotagTagsFile="ctags"

"Search for ctag files up every directory
"VERY IMPORTANT!! FOR FUZZYFINDER, COMPLETION ET CETERA
set tags=./ctags;/

"voor php indent: http://www.2072productions.com/to/phpindent.txt

"Gebruik passive ftp (http://alecthegeek.wordpress.com/2007/02/06/handy-hack-how-to-use-vim-netrw-in-ftp-passive-mode/):
let g:netrw_ftp_cmd="ftp -p -i"
let g:netrw_silent=1
set shortmess+=T
set shortmess=aOItT     " To avoid the 'Hit ENTER to continue' prompt
"Standaard treelisting:
let g:netrw_liststyle=3

"""BEHAVIOUR???"""
"deliMate mappings
"inoremap <Space> <C-R>=delimitMate#ExpandSpace()<CR>
"inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<C-R>=delimitMate#ExpandReturn()\<CR>"
"let delimitMate_autoclose = 0
let delimitMate_expand_cr = 1

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" If something is selected in the completion popup
" or ctrl-e is used: close the preview buffer
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() ==0|pclose|endif

"let MRU_Use_Current_Window = 1
"autocmd VIMEnter * MRU

" Disable syntax highlighting on huge files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Add eol to files that don't have it
" au BufWritePre * if !&bin | set eol | endif
