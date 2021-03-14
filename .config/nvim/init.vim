runtime plug.vim

"set syntax highlighting on
syntax on
"enable line numbering
:set number

set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set gdefault "replace globally by default
"set foldcolumn=1 "display sidebar with folds

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
set spellfile=~/.config/nvim/spell/custom.add

set nocompatible          "Use VIM not vi (affects other options?)
set re=1                  "Use the old regex engine for the time (is faster)
set textwidth=80          "force text width off (prev at 80 chars/line)
" Set different bgcolor for everything > `textwidth`
execute "set colorcolumn=" . "+" . join(range(1,150), ',+')
set formatoptions=tcqnlr  "include numbered lists when formatting with gq
set modelines=1           "prevent some security exploits
nnoremap <SPACE> <Nop>
" let mapleader = <space>   "Change \ to , (nercommenter, fuzzyfinder (t))
let mapleader = "\<space>"
set noshowmode            "Hide the default mode text (e.g. -- INSERT -- below the statusline)
set tabstop=4             "Show a tab as four spaces
set shiftwidth=4          "Insert four spaces when using indent
set expandtab             "Use spaces instead of tabs
set ffs=unix              "Always use unix line endings"
set list                  "Show special keys
set clipboard=unnamedplus "Sync vim clipboard with system clipboard
set listchars=tab:›\ ,trail:·,extends:>,precedes:< "what special keys should look like
set nopaste               "disable indenting when pasting
set grepprg=ag\ --nogroup\ --nocolor "Use ag over grep
" set ttyfast               "u got a fast terminal
" set ttyscroll=3           "redraw instead of scrolling (may cause flickering)
" set lazyredraw            "do not redraw as many
set laststatus=2            " give every window a statusline
set scrolloff=10
set hlsearch              "highlight search results
set incsearch             "incremental searching
set inccommand=nosplit    "incremental search & replace
se nostartofline          "don't jump to start of line when switching buffers

" Fix slow syntax highlighting
set synmaxcol=350           " stop highlighting wide columns
set nocursorcolumn          " Dont't highlight current column
set nocursorline            " Don't highlight current line
syntax sync minlines=256   " ??

" disable fileencoding, fileformat (ffs), (no)expandtab, shiftwidth,
" softtabstop, tabstop & textwidth when using editorconfig-vim

" Directories for swp files
" // uses the whole path for tmp files to avoid collisions
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/backup//

"Some gui options:
" :set completeopt=longest,preview,menuone
:set completeopt=longest,menuone

runtime! plugin_config/*.vim

runtime macros.vim
runtime theme.vim
"runtime plugins/autonum.vim "Deze zou ik zelf overnieuw moeten maken
"au FileType html,xhtml,xml,php so ~/.config/nvim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

set tags=./ctags;/ "Search for ctag files up every directory

" Neovim specific stuff??
if has('nvim')
    " set unnamedclip
    set backspace=indent,eol,start " backspace through lines
endif

"voor php indent: http://www.2072productions.com/to/phpindent.txt

"Gebruik passive ftp (http://alecthegeek.wordpress.com/2007/02/06/handy-hack-how-to-use-vim-netrw-in-ftp-passive-mode/):
" let g:netrw_ftp_cmd="ftp -p -i"
" let g:netrw_silent=1
set shortmess+=T
set shortmess=aOItT     " To avoid the 'Hit ENTER to continue' prompt
"Standaard treelisting:
" let g:netrw_liststyle=3

" If something is selected in the completion popup
" or ctrl-e is used: close the preview buffer
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() ==0|pclose|endif

" Disable syntax highlighting on huge files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Add eol to files that don't have it
" au BufWritePre * if !&bin | set eol | endif

" Open command-line window by default
" map : q:
