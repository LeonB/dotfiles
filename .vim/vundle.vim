filetype off "see: https://github.com/spf13/spf13-vim/pull/128
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Puppet niceties for your Vim setup
Bundle 'rodjek/vim-puppet'

" original repos on github
"let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vim/Ruby Configuration File
Bundle 'vim-ruby/vim-ruby'

" Moloikai color scheme
Bundle 'vim-scripts/molokai'

" Monokai colorschem
Bundle 'sickill/vim-monokai'

" Molokai color scheme for Vim
"Bundle 'tomasr/molokai'

" Perl/Ruby style regexp notation for Vim
Bundle 'othree/eregex.vim'

" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'

" A tree explorer plugin for vim
Bundle 'scrooloose/nerdtree'

"Syntax checking hacks for Vim"
Bundle 'scrooloose/syntastic'

" Highlight colors in css files
"Bundle 'skammer/vim-css-color'
Bundle 'ap/vim-css-color'

"Provides insert mode auto-completion for quotes, parens, brackets, etc
Bundle 'Raimondi/delimitMate'

"quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

"enable repeating supported plugin maps with \".\"
Bundle 'tpope/vim-repeat'

"Vim Markdown runtime files
Bundle 'tpope/vim-markdown'

"visualize your Vim undo tree
Bundle 'sjl/gundo.vim'

"precision colorscheme for the vim text editor
Bundle 'altercation/vim-colors-solarized'

"MatchParen for HTML tags
"Bundle 'gregsexton/MatchTag'

"Highlights whitespace at the end of lines
Bundle 'bitc/vim-bad-whitespace'

"A vim script to provide a ropevim omnicomplete function
"Bundle 'rygwdn/rope-omni'

"Color theme Hemisu
Bundle 'noahfrederick/Hemisu'

"Color theme Bad Wolf
Bundle 'sjl/badwolf'

"Markdown previewer
" Bundle 'LeonB/vim-markdown-preview'

"VimTips / fortune
"Bundle 'hobbestigrou/vimtips-fortune'

"PHP-Correct-Indenting VIM script
Bundle '2072/PHP-Indenting-for-VIm'

" Vastly improved Javascript indentation and syntax support in Vim.
Bundle "pangloss/vim-javascript"

" CoffeeScript support for vim
Bundle 'kchmck/vim-coffee-script'

" A vim plugin to display the indention levels with thin vertical lines
" Bundle 'Yggdroot/indentLine'

" vim-scripts repos

"recently opened/edited files
Bundle 'mru.vim'

"easily switch between buffers
Bundle 'bufexplorer.zip'

"Updates entries in a tags file automatically when saving
Bundle 'AutoTag'

"buffer/file/command/tag/etc explorer with fuzzy matching
"Bundle 'FuzzyFinder'

"Fuzzy file, buffer, mru and tag finder
Bundle 'kien/ctrlp.vim'

"Vim-script library
Bundle 'L9'

"Source code browser
Bundle 'taglist.vim'

"Minimalistic buffer tabs saving screen space
"Bundle 'buftabs'

"switch buffer with Alt-<number>
"Bundle 'bufpos'

"extended % matching for HTML
Bundle 'matchit.zip'

"Maintains a history of previous yanks, changes and deletes
"Bundle 'YankRing.vim'

"Automatically closes HTML tags once you finish typing them
"Bundle 'HTML-AutoCloseTag'

"Fork of HTML-AutoCloseTag that works with php indenting
"Bundle 'LeonB/HTML-AutoCloseTag'

"auto-numbers a list
"Bundle 'autonumbering-in-vim'

"Help folks to align text, eqns, declarations, tables, etc
"(Tabular is better)
"Bundle 'Align'

"Vim script for text filtering and alignment
Bundle 'godlygeek/tabular'

"Automatic folding of PHP functions, classes,.. (also folds related PhpDoc)
"Bundle 'phpfolding.vim'

"The ultimate statusline/prompt utility
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" super simple vim plugin to show the list of buffers in the command bar
" Bundle 'bling/vim-bufferline'

" lean & mean statusline for vim that's light as air
" Bundle 'bling/vim-airline'

"A modern side panel for Vim
"Bundle 'mihaifm/vimpanel'

"Fuzzy file, buffer, mru, tag, etc finder.
Bundle 'kien/ctrlp.vim'

"Vim syntax file for scss (Sassy CSS)
Bundle 'cakebaker/scss-syntax.vim'

"simplify the line movement in vim
"Bundle 'yueyoum/vim-linemovement'

"swap line plugin for vim
"Bundle 'dougnukem/vim-swap-lines'

" unite-ssh doesn't work at the moment
" Bundle 'Shougo/unite.vim'
" Bundle 'Shougo/vimproc'
" Bundle 'Shougo/vimfiler'
" Bundle 'Shougo/unite-ssh'
