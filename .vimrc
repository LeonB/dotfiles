"set syntax highlighting on
syntax on
"enable line numbering
:set number

"enable ruler (right-below)
set ruler

"use default perl regex
"nnoremap / /\v
"use default perl regex
"vnoremap / /\v
set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set gdefault
set incsearch " incremental searching
set showmatch
"set foldcolumn=1 "display sidebar with folds

"highlight search results
set hlsearch

"no line wrapping
:set nowrap

"enable mouse
"set mouse=a

" Show (partial) command in status line.
set showcmd

"set indenting on
filetype plugin indent on

"make backspace work like most other apps
set backspace=2

"Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"allow multiple open files
:set hidden

set enc=utf-8
set fileencoding=utf-8
set spelllang=nl,en
set spellfile=~/.vim/spell/custom.add

set nocompatible          "Use VIM not vi (affects other options?)
set textwidth=80          "force text width off (prev at 80 chars/line)
"set colorcolumn=+1        "Highlight text after 'textwidth'
set formatoptions=tcqnlr  "include numbered lists when formatting with gq
set autoindent            "set automatic indenting
set modelines=0           "prevent some security exploits
let mapleader = ","       "Change \ to , (nercommenter, fuzzyfinder (t))
set laststatus=2          "Always show the statusline in all windows
set noshowmode            "Hide the default mode text (e.g. -- INSERT -- below the statusline)
set tabstop=4             "Show a tab as four spaces
set shiftwidth=4          "set expandtab
set ffs=unix              "Always use unix line endings"
set list                  "Show special keys
set clipboard=unnamedplus "Sync vim clipboard with system clipboard
set listchars=tab:›\ ,trail:·,extends:>,precedes:< "what special keys should look like
set nopaste               "disable indenting when pasting

" Disable netrw
":let loaded_netrw = 1
":let loaded_netrwPlugin = 1
let g:netrw_keepdir=0 "keep the current directory the same as the browsing directory

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"Some gui options:
:set completeopt=longest,preview,menuone


let g:Tb_MoreThanOne=99999999 "Always open the tabbar.vim
:let g:buftabs_only_basename=1 "Only show the basename, not the full path

runtime vundle.vim
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

"Set wildmenu (Shows completions in the status line)
:set wmnu

"let MRU_Use_Current_Window = 1
"autocmd VIMEnter * MRU

"Yankring file
let g:yankring_history_file = '.yankring_history'

" Disable syntax highlighting on huge files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Add eol to files that don't have it
"au BufWritePre * if !&bin | set eol | endif

" Fix for not detecting puppet filetype properly :s
au! BufRead,BufNewFile *.pp setfiletype puppet

